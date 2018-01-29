<?PHP
	session_start();
	if(isset($_SESSION['errmsg'])){
		$errmsg = $_SESSION['errmsg'];
		unset ($_SESSION['errmsg']);
	}
	$pgTitle = "Admin";
	require('../class/class_mysql_conn.php');
	require('../class/class_fun.php');
	require('../components/html_head.php');

	$conn = new MySQLConnection();
	$conn->connect();
	$fun = new Fun();
	$utype = $fun->checkUtype($_SESSION['g_id']);
	if($utype==1){
		// echo '<span style="font-size: 23px; margin: 20px;">Welcome Admin!</span> <a href="admin.php"><button type="submit" style="float: right;" class="btn btn-outline-warning">Back to Editor</button></a>';

	}else{
		if(isset($_SERVER['HTTP_REFERER'])){
			$prev=$_SERVER['HTTP_REFERER'];
			header('location: '.$prev);
			$_SESSION['infomsg'] = '<br><center><div class = "alert alert-danger alert-dismissable fade in" style="width: 65%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>You are not authorized to Enter that site.<br>Ask the Developer for more Information.<br><cite>Joseph Suyam</cite></strong></div></center>';
			die();
		}else{
			header('location: ./');
			$_SESSION['infomsg'] = '<br><center><div class = "alert alert-danger alert-dismissable fade in" style="width: 65%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>You are not authorized to Enter that site.<br>Ask the Developer for more Information.<br><cite>Joseph Suyam</cite></strong></div></center>';
			die();
		}
	}

?>
	</head>
	<body>

<?PHP
	require('../components/html_banner.php');
?>
	<div class = "container">
		<br><div><span style="font-size: 23px; margin: 20px;">Welcome Admin!</span>
		<a href="author_panel.php"><button type="submit" style="float: right;" class="btn btn-outline-warning">Back to Editor</button></a></div><br>
		<div class = "row">
			<div class = "col-sm-5">
				<div class = "panel panel-default" style="min-width: 65%;">
					<div class = "panel-heading">
						<center><h3>Tools</h3></center>
					</div>
					<div class = "panel-body" style = "width: 100%;">
						<form method="POST" action="<?= htmlspecialchars($_SERVER["PHP_SELF"]); ?>"><center>
							<button type="submit" name="authors" class="btn btn-default mar" style="">Authors</button><br>
							<button type="submit" name="blogs" class="btn btn-default mar">Blogs</button><br>
							<button type="submit" name="comments" class="btn btn-default mar">Comments</button>
						</center></form>
					</div><!--panel-body-->
				</div><!--panel-->
			</div>
			<div class = "col-sm-7">
				<div class = "panel panel-default" style="min-width: 65%;">
					<div class = "panel-body" style = "width: 100%;">
						<?PHP
							if(isset($_POST['authors'])){
								$fun->viewAuthors();
								$_SESSION['admin_sel_authors'] = $_POST['authors'];
								unset($_SESSION['admin_sel_blogs']);
								unset($_SESSION['admin_sel_comments']);
							}elseif(isset($_POST['blogs'])){
								$fun->disableBlogs();
								$_SESSION['admin_sel_blogs'] = $_POST['blogs'];
								unset($_SESSION['admin_sel_authors']);
								unset($_SESSION['admin_sel_comments']);
							}elseif(isset($_POST['comments'])){
								$fun->viewComments();
								$_SESSION['admin_sel_comments'] = $_POST['comments'];
								unset($_SESSION['admin_sel_authors']);
								unset($_SESSION['admin_sel_blogs']);
							}elseif(isset($_SESSION['admin_sel_authors']) || isset($_SESSION['admin_sel_blogs']) || isset($_SESSION['admin_sel_comments'])){
								if(isset($_SESSION['admin_sel_authors'])){
									$fun->viewAuthors();
									unset($_SESSION['admin_sel_blogs']);
									unset($_SESSION['admin_sel_comments']);
								}elseif(isset($_SESSION['admin_sel_blogs'])){
									$fun->disableBlogs();
									unset($_SESSION['admin_sel_authors']);
									unset($_SESSION['admin_sel_comments']);
								}elseif(isset($_SESSION['admin_sel_comments'])){
									$fun->viewComments();
									unset($_SESSION['admin_sel_authors']);
									unset($_SESSION['admin_sel_blogs']);
								}
							}else{
								$fun->viewAuthors();
							}
						?>
					</div><!--panel-body-->
				</div><!--panel-->
			</div>
		</div>
		<?PHP
			echo isset($_SESSION['infomsg']) ? $_SESSION['infomsg'] : "";
			unset($_SESSION['infomsg']);
		?>
	</div>
		
	</body>

	<script language = "javascript" type = "text/javascript" src = "../js/jquery-1.9.1.js"></script>
	<script language = "javascript" type = "text/javascript" src = "../js/bootstrap.js"></script>

</html>