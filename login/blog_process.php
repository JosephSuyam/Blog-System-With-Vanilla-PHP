<?PHP
	session_start();
	$pgTitle = "Login";
	require('../class/class_mysql_conn.php');
	require('../class/class_fun.php');

	$blog_id = $_POST['blog_id'];
	$type = gettype($blog_id);
	$num = "1";
	$typeint = gettype($num);
	echo $type;
	echo $typeint;
	if($type==$typeint){
		if(isset($_POST['blog_id']) && !empty($_POST['blog_id'])){
			$conn = new MySQLConnection();
			$conn->connect();
			$fun = new Fun();
			if(isset($_POST['delete'])){
				$fun->deleteBlog($blog_id);
				header('location: author_panel.php');
				$_SESSION['infomsg'] = '<br><center><div class = "alert alert-success alert-dismissable fade in" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>Blog Deleted!</strong></div></center>';
			}elseif(isset($_POST['publish'])){
				$fun->publish($blog_id);
				header('location: author_panel.php');
				$_SESSION['infomsg'] = '<br><center><div class = "alert alert-success alert-dismissable fade in" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>Blog Published!</strong></div></center>';
			}elseif(isset($_POST['unpublish'])){
				$fun->unpublish($blog_id);
				header('location: author_panel.php');
				$_SESSION['infomsg'] = '<br><center><div class = "alert alert-info alert-dismissable fade in" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>Blog Unpublished!</strong></div></center>';
			}elseif(isset($_POST['save'])){
				if(isset($_POST['blog_title']) && isset($_POST['blog']) && !empty($_POST['blog_title']) && !empty($_POST['blog'])){
					$blogger_id = $_SESSION['g_id'];
					$blog_title = $conn->clean_data($_POST['blog_title']);
					$blog = $conn->clean_data($_POST['blog']);
					$fun->saveBlog($blog_title, $blog, $blogger_id);
					header('location: author_panel.php');
					$_SESSION['errmsg'] = '<br><center><div class = "alert alert-success alert-dismissable fade in" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>Your Blog have been Saved!</strong></div></center>';
				}else{
					header('location: author_panel.php');
					$_SESSION['errmsg'] = '<br><center><div class = "alert alert-danger alert-dismissable fade in" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>Please fill up all forms.</strong></div></center>';
				}
			}else{
				die("Check author_panel form");
			}
		}else{
			header('location: author_panel.php');
			$_SESSION['errmsg'] = '<br><center><div class = "alert alert-danger alert-dismissable fade in" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>Please select a blog</strong></div></center>';
		}
	}else{
		header('location: author_panel.php');
		$_SESSION['errmsg'] = '<br><center><div class = "alert alert-danger alert-dismissable fade in" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>Please select a blog!!!</strong></div></center>';
	}

?>