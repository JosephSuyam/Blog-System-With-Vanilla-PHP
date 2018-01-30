<?php
	if(isset($_SESSION['logUserID'])){
		$strmsg= "Welcome ".$_SESSION['logUsername'];
	}else{
		header('location:../login/index.php');
	}
?>