<?PHP
	session_start();
	$pgTitle = "Author Panel";
	require('../class/class_mysql_conn.php');
	require('../class/class_fun.php');
	require_once ('libraries/Google/autoload.php');

	//Insert your cient ID and secret 
	//You can get it from : https://console.developers.google.com/
	$client_id = '757348632632-6goetb1irt6glqcqijeksgj4l84kjabd.apps.googleusercontent.com'; 
	$client_secret = '1eF2I4mPbiyMSpaDfdsMgl1W';
	$redirect_uri = 'http://localhost/assessment/login/author_panel.php';

	//database
	$db_username = "root"; //Database Username
	$db_password = ""; //Database Password
	$host_name = "localhost"; //Mysql Hostname
	$db_name = 'assessment'; //Database Name

	//incase of logout request, just unset the session var
	if (isset($_GET['logout'])) {
		unset($_SESSION['access_token']);
		session_unset($_SESSION);
		header('location: ./');
		// header('../logout.php');
	}

	/************************************************
	  Make an API request on behalf of a user. In
	  this case we need to have a valid OAuth 2.0
	  token for the user, so we need to send them
	  through a login flow. To do this we need some
	  information from our API console project.
	 ************************************************/
	$client = new Google_Client();
	$client->setClientId($client_id);
	$client->setClientSecret($client_secret);
	$client->setRedirectUri($redirect_uri);
	$client->addScope("email");
	$client->addScope("profile");

	/************************************************
	  When we create the service here, we pass the
	  client to it. The client then queries the service
	  for the required scopes, and uses that when
	  generating the authentication URL later.
	 ************************************************/
	$service = new Google_Service_Oauth2($client);

	/************************************************
	  If we have a code back from the OAuth 2.0 flow,
	  we need to exchange that with the authenticate()
	  function. We store the resultant access token
	  bundle in the session, and redirect to ourself.
	*/
	  
	if (isset($_GET['code'])) {
	  $client->authenticate($_GET['code']);
	  $_SESSION['access_token'] = $client->getAccessToken();
	  header('Location: ' . filter_var($redirect_uri, FILTER_SANITIZE_URL));
	  exit;
	}

	/************************************************
	  If we have an access token, we can make
	  requests, else we generate an authentication URL.
	 ************************************************/
	// ORIGINAL CODE
	// if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
	//   $client->setAccessToken($_SESSION['access_token']);
	// } else {
	//   $authUrl = $client->createAuthUrl();
	// }

	// SOLUTION
	if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
		$client->setAccessToken($_SESSION['access_token']);
		if ($client->isAccessTokenExpired()) { // check if token has expired
			// unset($_SESSION['access_token']);
			$authUrl = $client->createAuthUrl();
			header('Location: ' . filter_var($authUrl, FILTER_SANITIZE_URL));

			// $client->setAccessType('online');
			// $client->setApprovalPrompt('auto');

			// $client->refreshToken($refreshToken)
		}
	} else {
		$authUrl = $client->createAuthUrl();
	}

	require('../components/html_head.php');
?>
	</head>
	<body>

<?PHP
	require('../components/html_banner.php');
?>
	<div class = "container">
		<?PHP
			//Display user info or display login url as per the info we have.
			echo '<div style="margin: ;">';
			if (isset($authUrl)){ 
				header('location: ./');
			} else {
				$user = $service->userinfo->get(); //get user info 
				// set token into session
				$g_id = $user->id;
				$g_name = $user->name;
				$g_email = $user->email;
				$g_link = $user->link;
				$g_picture = $user->picture;
				$_SESSION['g_id'] = $g_id;
				$_SESSION['g_name'] = $g_name;
				$_SESSION['g_email'] = $g_email;
				$_SESSION['g_link'] = $g_link;
				$_SESSION['g_picture'] = $g_picture;
				$_SESSION['redirect_uri'] = $redirect_uri;
				// connect to database
				$mysqli = new mysqli($host_name, $db_username, $db_password, $db_name);
			    if ($mysqli->connect_error) {
			        die('Error : ('. $mysqli->connect_errno .') '. $mysqli->connect_error);
			    }
				//check if user exist in database using COUNT
				$result = $mysqli->query("SELECT COUNT(google_id) as usercount FROM google_users WHERE google_id=$user->id");
				$user_count = $result->fetch_object()->usercount; //will return 0 if user doesn't exist
				if($user_count){ // checks if user already exist in local db
			        $stmt = $mysqli->prepare("SELECT access FROM google_users WHERE google_id = ?");
			        $stmt->bind_param('i', $user->id);
			        if($stmt->execute()){
			        	$stmt->bind_result($acc);
			        	if($acc===0){
			        		unset($_SESSION['access_token']);
							session_unset($_SESSION);
							header('location: ./');
			        		$_SESSION['infomsg'] = '<br><center><div class = "alert alert-danger alert-dismissable fade in" style="width: 65%;"><a href="../login/index.php" class="close" data-dismiss="alert">&times;</a><strong>Your Account have been DISABLED</strong></div></center>';
			        	}
			        }else{
			        	die("check for access");
			        }
			    }else{
			        $utype=0;
					$acc=1;
					$statement = $mysqli->prepare("INSERT INTO google_users (google_id, google_name, google_email, google_picture_link, user_type, access) VALUES (?,?,?,?,?,?)");
					$statement->bind_param('isssii', $user->id,  $user->name, $user->email, $user->picture, $utype, $acc);
					$statement->execute();
					echo $mysqli->error;
			    }
			}
			echo '</div>';
		?>
		<div style="margin: 15px; font-size: 25px;">Welcome, <?PHP echo $_SESSION['g_name'].'&nbsp;&nbsp; <a href="'.$redirect_uri.'?logout=1"><button class = "btn btn-outline-danger">Logout</button></a>'?>
		<a href="admin.php"><button type="submit" style="float: right;" class="btn btn-outline-warning">Administrator</button></a></div>
		<div class = "row">
			<div class = "col-sm-5">
				<div class = "panel panel-default" style="min-width: 65%;">
					<div class = "panel-heading" style="font-size: 30px;">
						<center>My Blogs</center>
					</div>
					<div class = "panel-body" style = "width: 100%;">
						<?PHP
							$conn = new MySQLConnection();
							$conn->connect();
							$fun = new Fun();
							$fun->showMyBlogs($_SESSION['g_id']);
						?>
					</div><!--panel-body-->
				</div><!--panel-->
			</div>
			<div class="col-sm-7">
				<form method="POST" action="blog_process.php">
					<div class = "panel panel-default" style="min-width: 65%;">
						<div class = "panel-heading" style="background-color: #FFFFFF	;">
							<input type="text" name="blog_title" placeholder="New Blog Title" value="<?PHP echo (isset($_POST['blog_title']) ? $conn->clean_data($_POST['blog_title']) : "New blog title here..." );?>" style="width: 100%; font-size: 30px; outline: none; border: 0;">
						</div>
						<div class = "panel-body" style = "width: 100%;">
							<textarea name="blog" placeholder="Write your new blog here..." style="width: 100%; font-size: 20px; margin-top: 12px; height: 275px; resize: vertical; outline: none; border: 0;"><?PHP echo (isset($_POST['blog']) ? $conn->clean_data($_POST['blog']) : "Write your new blog here..." );?></textarea>
						</div><!--panel-body-->
					</div><!--panel-->
					<input type="hidden" name="blog_id" value="<?PHP echo (isset($_POST['blog_id']) ? $_POST['blog_id'] : "Blog Title" ) ?>">
					<button type="submit" name="delete" class="btn btn-outline-danger">Delete</button>
					<div class="dropdown" style = "width: 125px; float: right; margin-right: 25px;">
						<button class="btn btn-outline-success dropdown-toggle" type="button" data-toggle="dropdown">Publish Settings&nbsp;<span class="caret"></span></button>
						<ul class="dropdown-menu">
							<li><input type = "submit" value = "Publish" name="publish" class = "btn btn-outline-success" style = " display: inline-block; width: 100%;"/></li>
							<li><input type = "submit" value = "Unpublish" name="unpublish" id = "" class = "btn btn-outline-success" style = " display: inline-block; width: 100%;"/></li>
						</ul>
					</div>
					<button type="submit" name="save" class="btn btn-outline-info" style="float: right; margin-right: 20px;">Save</button>
				</form>
				<?PHP
					echo isset($_SESSION['infomsg']) ? $_SESSION['infomsg'] : "";
					echo isset($_SESSION['errmsg']) ? $_SESSION['errmsg'] : "";
					unset($_SESSION['infomsg']);
					unset($_SESSION['errmsg']);
				?>
			</div>
		</div>
	</div>
		
	</body>

	<script language = "javascript" type = "text/javascript" src = "../js/jquery-1.9.1.js"></script>
	<script language = "javascript" type = "text/javascript" src = "../js/bootstrap.js"></script>

</html>