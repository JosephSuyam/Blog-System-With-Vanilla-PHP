<?php

	function updateUserRetries($userID){
		$success=false;
		$sql="UPDATE tbl_users SET retries=retries + 1 WHERE id = $userID;";
		$result = mysql_query($sql);
		if($result){
			$success=true;
		}else{
			die("Error in executing sql statement.".mysql_error());
		}
		return $success;
	}
	function resetUserRetries($userID){
		$success=false;
		$sql="UPDATE tbl_users SET retries=retries + 0 WHERE id = $userID;";
		$result = mysql_query($sql);
		if($result){
			$success=true;
		}else{
			die("Error in executing sql statement.".mysql_error());
		}
		return $success;
	}
	
	function checkifUsertypeExist($prUType){
		$found = false;
		$sql = "SELECT id FROM tbl_usertypes WHERE type_name = '$prUType';";
		$result = mysql_query($sql);
		if($result){
			if(mysql_num_rows($result) > 0){
				$found = true;
			}
		}else{
			die(mysql_error());
		}return $found;
	}
	
	function checkifUserExist($prType){
		$found = false;
		$sql = "SELECT id FROM tbl_users WHERE username = '$prType';";
		$result = mysql_query($sql);
		if($result){
			if(mysql_num_rows($result) > 0){
				$found = true;
			}
		}else{
			die(mysql_error());
		}return $found;
	}
	
	function checkifModuleExist($module){
		$found = false;
		$sql = "SELECT id FROM tbl_modules WHERE module_name = '$module';";
		$result = mysql_query($sql);
		if($result){
			if(mysql_num_rows($result) > 0){
				$found = true;
			}
		}else{
			die(mysql_error());
		}return $found;
	}

	function checkifCollegeExist($College){
		$found = false;
		$sql = "SELECT ID FROM tbl_colleges WHERE College_Code = '$College';";
		$result = mysql_query($sql);
		if($result){
			if(mysql_num_rows($result) > 0){
				$found = true;
			}
		}else{
			die(mysql_error());
		}return $found;
	}

	function checkifCourseExist($Course){
		$found = false;
		$sql = "SELECT ID FROM tbl_courses WHERE Course_Code = '$Course';";
		$result = mysql_query($sql);
		if($result){
			if(mysql_num_rows($result) > 0){
				$found = true;
			}
		}else{
			die(mysql_error());
		}return $found;
	}

	function checkifStudentExist($Student){
		$found = false;
		$sql = "SELECT IDNo FROM tbl_students WHERE IDNo = '$Student';";
		$result = mysql_query($sql);
		if($result){
			if(mysql_num_rows($result) > 0){
				$found = true;
			}
		}else{
			die(mysql_error());
		}return $found;
	}
	
	function checkifUsertypeAccessExist($module, $usertype){
		$found = false;
		$sql = "SELECT id FROM tbl_usertype_access WHERE module = '$module' AND usertype = '$usertype';";
		$result = mysql_query($sql);
		if($result){
			if(mysql_num_rows($result) > 0){
				$found = true;
			}
		}else{
			die(mysql_error());
		}return $found;
	}
	
	function showUsertypeAccess($module, $usertype){
		#CHANGE MODULES IN TBL_MODULES : CHANGE MODULE_NAME IN TBL_USERTYPE_ACCESS
		$sql = "SELECT a.id, b.type_name, c.module_name, if(can_add=1,'Y','N') as c_add, if(can_edit=1,'Y','N') as c_edit, if(can_delete=1,'Y','N') as c_delete, if(can_print=1,'Y','N') as c_print FROM tbl_usertype_access a JOIN tbl_usertypes b on a.usertype=b.id JOIN tbl_modules c on a.module=c.id WHERE a.usertype='$usertype';";
		$result = mysql_query($sql);
		if($result){
			echo '<table class = "table table-bordered">';
			echo '<thead><tr><th>Usertype</th><th>Module</th><th>Add</th><th>Edit</th><th>Delete</th><th>Print</th><th>Select</th></tr></thead>';
			while($row=mysql_fetch_array($result)){
				echo '<tr><td>'.$row[1].'</td><td>'.$row[2].'</td><td>'.$row[3].'</td><td>'.$row[4].'</td><td>'.$row[5].'</td><td>'.$row[6].'</td><td><input type = "radio" id = "urad" name = "urad" value = "'.$row[0].'"/></tr>';
			}
			echo '</table>';
			echo '<center><input class = "btn btn-danger" type = "button" id = "delete" value = "Remove"/></center>';
		}else{
			die('Error in SQL Query - mysql_functions');
		}
	}
	
?>