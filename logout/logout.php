<?PHP

	session_start();
	unset($_SESSION['access_token']);
	session_unset($_SESSION);
	session_destroy();
	header('location:../login/index.php');

?>