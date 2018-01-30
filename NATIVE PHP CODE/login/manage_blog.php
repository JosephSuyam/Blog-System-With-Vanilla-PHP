<?PHP
	session_start();
	$pgTitle = "Login";
	require('../class/class_mysql_conn.php');
	require('../class/class_fun.php');

	if(isset($_POST['blog_id']) && !empty($_POST['blog_id'])){
		$conn = new MySQLConnection();
		$conn->connect();
		$fun = new Fun();
		$fun->showMyBlogs2($_POST['blog_id']);
	}else{
		die();
	}

?>