<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class MySQLConn extends Controller
{
    public $hostname;
	public $port;
	public $user;
	public $dbname;
	private $password;
	public $connid;

	public function __construct(){
		$this->hostname = "localhost";
		$this->port = 3306;
		$this->user = "root";
		$this->dbname = "assessment";
		$this->password = "";
	}

	public function connect(){
		$success = false;
		$this->connid = mysql_connect($this->hostname.':'.$this->port,$this->user,$this->password);
		if($this->connid){
			if($this->select_database()){
				$success=true;
			}
		}else{
			die("Cannot connect to the database server!");
		}
		return $success;
	}

	public function select_database(){
		$success = false;
		$db_link = mysql_select_db($this->dbname);
		if($db_link){
			$success = true;
		}else{
			die("Cannot select a valid database");
		}
		return $success;
	}

	public function clean_data($str){
		if(get_magic_quotes_gpc()){
			$str = stripslashes(trim($str));
		}
		return mysql_real_escape_string(trim($str));
	}

	public function __destruct(){
		//mysql_close($this->connid);
	}
}
