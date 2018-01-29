<?PHP
	session_start();
	require('../class/class_mysql_conn.php');
	require('../class/class_fun.php');

	$conn = new MySQLConnection();
	$conn->connect();
	$fun = new Fun();
	if(isset($_POST['enable'])){
		if(isset($_POST['google_id'])){
			$google_id = $_POST['google_id'];
			$fun->enableUser($google_id);
			header('location: admin.php');
			$_SESSION['infomsg'] = '<br><center><div class = "alert alert-success alert-dismissable fade in" style="width: 50%;"><a href="../login/index.php" class="close" data-dismiss="alert">&times;</a><strong>Account Enabled!</strong></div></center>';
		}else{
			die('User Id not selected');
		}
	}elseif(isset($_POST['disable'])){
		if(isset($_POST['google_id'])){
			$google_id = $_POST['google_id'];
			$fun->disableUser($google_id);
			header('location: admin.php');
			$_SESSION['infomsg'] = '<br><center><div class = "alert alert-warning alert-dismissable fade in" style="width: 50%;"><a href="../login/index.php" class="close" data-dismiss="alert">&times;</a><strong>Account Disabled!</strong></div></center>';
		}else{
			die('User Id not selected');
		}
	}elseif(isset($_POST['publish'])){
		if(isset($_POST['blog_id'])){
			$blog_id = $_POST['blog_id'];
			$fun->publish($blog_id);
			header('location: admin.php');
			$_SESSION['infomsg'] = '<br><center><div class = "alert alert-success alert-dismissable fade in" style="width: 50%;"><a href="../login/index.php" class="close" data-dismiss="alert">&times;</a><strong>Blog Published!</strong></div></center>';
		}else{
			die('Blog Id not selected');
		}
	}elseif(isset($_POST['unpublish'])){
		if(isset($_POST['blog_id'])){
			$blog_id = $_POST['blog_id'];
			$fun->unpublish($blog_id);
			header('location: admin.php');
			$_SESSION['infomsg'] = '<br><center><div class = "alert alert-warning alert-dismissable fade in" style="width: 50%;"><a href="../login/index.php" class="close" data-dismiss="alert">&times;</a><strong>Blog Unpublished!</strong></div></center>';
		}else{
			die('Blog Id not selected');
		}
	}elseif(isset($_POST['comment_del'])){
		if(isset($_POST['comment_id'])){
			$comment_id = $_POST['comment_id'];
			$fun->deleteComment($comment_id);
			header('location: admin.php');
			$_SESSION['infomsg'] = '<br><center><div class = "alert alert-warning alert-dismissable fade in" style="width: 50%;"><a href="../login/index.php" class="close" data-dismiss="alert">&times;</a><strong>Comment Deleted!</strong></div></center>';
		}else{
			die('Comment Id not selected');
		}
	}else{
		die('nothing is selected');
	}

?>