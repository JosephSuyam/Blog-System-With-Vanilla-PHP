<?php 
$connection =  mysql_connect("localhost:3306","root","");
if($connection){
	$dblink = mysql_select_db("db_wis",$connection);
	if(!$dblink){
		die("Error in selecting a database");
	}
	
}
else{
	die("Error in establishing connection to the server!");
}
?>