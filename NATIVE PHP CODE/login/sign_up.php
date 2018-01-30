<?PHP
require('../class/class_mysql_conn.php');
require('../class/class_users.php');

	if(!empty($_POST['user_id']) && !empty($_POST['username']) && !empty($_POST['password']) && !empty($_POST['usertype']) && !empty($_POST['fname']) && !empty($_POST['lname']) && !empty($_POST['gender']) && !empty($_POST['bod'])){
		$conn = new MySQLConnection();
		$conn->connect();
		$user = new Users();
		$user_id = $conn->clean_data($_POST['user_id']);
		$username = $conn->clean_data($_POST['username']);
		$password = $conn->clean_data($_POST['password']);
		$usertype = $conn->clean_data($_POST['usertype']);
		$fname = $conn->clean_data($_POST['fname']);
		$mname = $conn->clean_data($_POST['mname']);
		$lname = $conn->clean_data(['lname']);
		$gender = $conn->clean_data(['gender']);
		$bod =  $conn->clean_data(['bod']);
		if($user->checkifUserExist($user_id, $username)){
			$conn = new MySQLConnection();
			$conn->connect();
			$user = new Users();
			$user->createUsers($user_id, $usertype, $username, $password);
			$user->createUsersInfo($user_id, $fname, $mname, $lname, $gender, $bod);
			$_SESSION['errmsg'] = '<center><div class = "alert alert-success alert-dismissable fade in" style="width: 100%;"><a href="../login/index.php" class="close" data-dismiss="alert">&times;</a><strong>Record Created!</strong></div></center>';
			header('location:index.php');
		}else{
			$_SESSION['errmsg'] = '<center><div class = "alert alert-danger alert-dismissable fade in" style="width: 100%;"><a href="../login/index.php" class="close" data-dismiss="alert">&times;</a><strong>Username Already Exist!</strong></div></center>';
			header('location:index.php');
		}
	}else{
		$_SESSION['errmsg'] = '<center><div class = "alert alert-danger alert-dismissable fade in" style="width: 100%;"><a href="../login/index.php" class="close" data-dismiss="alert">&times;</a><strong>Please fill up all the records!</strong></div></center>';
		header('location:index.php');
	}

?>