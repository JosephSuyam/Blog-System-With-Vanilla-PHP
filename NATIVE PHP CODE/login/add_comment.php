<?PHP
	session_start();
	require('../include/session_check.php');
	if(isset($_SESSION['errmsg'])){
		$errmsg = $_SESSION['errmsg'];
		unset ($_SESSION['errmsg']);
	}
	$pgTitle = "Login";
	require('../class/class_mysql_conn.php');
	require('../class/class_fun.php');

	if(isset($_POST['commentor_name']) && isset($_POST['comment']) && !empty($_POST['commentor_name']) && !empty($_POST['comment'])){
		$conn = new MySQLConnection();
		$conn->connect();
		$fun = new Fun();
		$commented_blog = $_POST['commented_blog'];
		$commentor_name = $conn->clean_data($_POST['commentor_name']);
		$comment = $conn->clean_data($_POST['comment']);
		$fun->comment($commented_blog, $commentor_name, $comment);
		header('location:view_blog.php?blog_id='.$_SESSION['selected_blog'].'&blog_title='.$_GET['blog_title']);
		echo '<input type="hidden" name="commented_blog" value="'.$_SESSION['selected_blog'].'">';
		$_SESSION['infomsg'] = "Your comment have been uploaded!";
	}else{
		header('location:view_blog.php?blog_id='.$_SESSION['selected_blog'].'&blog_title='.$_GET['blog_title']);
		echo '<input type="hidden" name="commented_blog" value="'.$_SESSION['selected_blog'].'">';
		$_SESSION['infomsg'] = "Please Fillout all the Forms!";
	}

?>