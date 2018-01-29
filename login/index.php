<?PHP
	session_start();
	if(isset($_SESSION['errmsg'])){
		$errmsg = $_SESSION['errmsg'];
		unset ($_SESSION['errmsg']);
	}
	$pgTitle = "Login";
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
		// header('location:index.php');
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
	if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
	  $client->setAccessToken($_SESSION['access_token']);
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
		
	<div class = "container" style="margin-top: 10px;">
		<div class = "row">
			<div class = "col-sm-5">
				<center><h1>My Assessment Blog System</h1></center>
				<!-- GOOGLE LOGIN -->
				<?PHP
					//Display user info or display login url as per the info we have.
					echo '<div style="margin: 20px;">';
					if (isset($authUrl)){ 
						echo '<a class="login" href="' . $authUrl . '"><center><img src="../img/google-login-button.png" style ="width: 65%;"/></center></a>';
						echo isset($_SESSION['infomsg']) ? $_SESSION['infomsg'] : "";
						unset($_SESSION['infomsg']);
					} else {
						
						$user = $service->userinfo->get(); //get user info 

						// set token into session
						$_SESSION['g_id'] = $user->id;
						$_SESSION['g_name'] = $user->name;
						$_SESSION['g_email'] = $user->email;
						$_SESSION['g_link'] = $user->link;
						$_SESSION['g_picture'] = $user->picture;
						
						// connect to database
						$mysqli = new mysqli($host_name, $db_username, $db_password, $db_name);
					    if ($mysqli->connect_error) {
					        die('Error : ('. $mysqli->connect_errno .') '. $mysqli->connect_error);
					    }
						
						//check if user exist in database using COUNT
						$result = $mysqli->query("SELECT COUNT(google_id) as usercount FROM google_users WHERE google_id=$user->id");
						$user_count = $result->fetch_object()->usercount; //will return 0 if user doesn't exist
						
						if($user_count) //if user already exist change greeting text to "Welcome Back"
					    {
					        echo '<label style="font-size: 20px; margin-right: 20px;">Welcome '.$user->name.'!</label> <a href="'.$redirect_uri.'?logout=1"><button class = "btn btn-outline-danger">Logout</button></a><br>';
					        echo isset($_SESSION['infomsg']) ? $_SESSION['infomsg'] : "";
							unset($_SESSION['infomsg']);
					    }
						else //else greeting text "Thanks for registering"
						{ 
					        echo 'Hi '.$user->name.', Welcome [<a href="'.$redirect_uri.'?logout=1">Log Out</a>]';
							$statement = $mysqli->prepare("INSERT INTO google_users (google_id, google_name, google_email, google_picture_link) VALUES (?,?,?,?)");
							$statement->bind_param('issss', $user->id,  $user->name, $user->email, $user->picture);
							$statement->execute();
							echo $mysqli->error;
					    }
						
						//print user details
						// echo '<pre>';
						// print_r($user);
						// echo '</pre>';
					}
					echo '</div>';
				?>
			</div>
			<div class = "col-sm-7" style="border-left: thick double #002259; height: 500px;">
				<h2>Latest Articles</h2>
				<hr class="hrstyle">
				<?PHP
					$conn = new MySQLConnection();
					$conn->connect();
					$fun = new Fun();
					$fun->viewBlogs();
				?>
			</div>
		</div>
	</div>
		
	</body>

	<script language = "javascript" type = "text/javascript" src = "../js/jquery-1.9.1.js"></script>
	<script language = "javascript" type = "text/javascript" src = "../js/bootstrap.js"></script>

</html>