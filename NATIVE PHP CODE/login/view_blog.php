<?PHP
	session_start();
	if(isset($_SESSION['errmsg'])){
		$errmsg = $_SESSION['errmsg'];
		unset ($_SESSION['errmsg']);
	}
	$pgTitle = (isset($_GET['blog_title']) ? $_GET['blog_title'] : "View Blog");
	require('../class/class_mysql_conn.php');
	require('../class/class_fun.php');
	require('../components/html_head.php');
?>
	</head>
	<body>

<?PHP
	require('../components/html_banner.php');
?>
		
	<div class = "container">
		<div class = "row">
			<div class = "col-sm-12">
				<a href="./" style="float: right; margin-top: 25px;"><button class="btn btn-outline-info">Back to Login</button></a>
				<?PHP
					if(isset($_GET['blog_id'])){
						$blog = $_GET['blog_id'];
						$_SESSION['selected_blog'] = $blog;
						$title = $_GET['blog_title'];
						$conn = new MySQLConnection();
						$conn->connect();
						$fun = new Fun();
						$fun->openBlog($_SESSION['selected_blog']);
					}
				?>
				<div style="margin-left: 15px;"><h3>Leave a comment:</h3>
				<form method="POST" action="add_comment.php">
					<input type="text" name="commentor_name" placeholder="Name" required>
					<input type="textarea" name="comment" placeholder="Write your comment here..." style="width: 20%;" required>
					<input type="hidden" name="commented_blog" value="<?=$_SESSION['selected_blog']?>">
					<input type="hidden" name="blog_title" value="<?=$title?>">
					<button type="submit">Send Comment</button>
				</form><br>
				</div>
				<?PHP
					echo isset($_SESSION['infomsg']) ? $_SESSION['infomsg'] : "";
					unset($_SESSION['infomsg']);
				?>
			</div>
		</div>
	</div>
		
	</body>

	<script language = "javascript" type = "text/javascript" src = "../js/jquery-1.9.1.js"></script>
	<script language = "javascript" type = "text/javascript" src = "../js/bootstrap.js"></script>

</html>