<?PHP

	class Fun{

		public function viewBlogs(){
			$sql = "SELECT google_name, blog_id, blog_title, blog_date, allow FROM google_users JOIN blog ON google_users.google_id=blog.blogger_id WHERE allow=1;";
			$result = mysql_query($sql);
			if($result){
				while($row=mysql_fetch_array($result)){
					$_SESSION['blog_title'] = $row['blog_title'];
					echo '<div style="font-size:18px;"><form method="GET" action="view_blog.php"><input type="hidden" name="blog_id" value="'.$row['blog_id'].'"><input type="hidden" name="blog_title" value="'.$row['blog_title'].'"><button type="submit" class="submitbutton" style = "font-size: 30px;">'.$row['blog_title'].'</button></form> <cite style="margin-left: 20px;">by</cite> '.$row['google_name'].'&nbsp;&nbsp;<span style="color: #afafaf;">'.$this->compDates($row['blog_date']).'</span></div>';
				}
			}else{
				die(mysql_error());
			}
		}

		public function openBlog($id){
			$sql = "SELECT google_name, blog_id, blog_title, blog, blog_date FROM google_users JOIN blog ON google_users.google_id=blog.blogger_id WHERE blog_id='$id';";
			$result = mysql_query($sql);
			if($result){
				while($row=mysql_fetch_array($result)){
					echo '<div style="font-size: 20px;"><h1>'.$row['blog_title'].'</h1><hr class="hrstyle">
						<cite>by</cite> '.$row['google_name'].' <span style="color: #afafaf;">'.$this->compDates($row['blog_date']).'</span><br>
						'.$row['blog'].'</div><br>';

					$qry = "SELECT commentor_name, comment, comment_date FROM comment JOIN blog ON comment.commented_blog=blog.blog_id WHERE blog_id='$id';";
					$result2 = mysql_query($qry);
					if($result2){
						echo '<div style="margin-left: 15px;"><h3>Comments:</h3>';
						while($row2=mysql_fetch_array($result2)){
							echo '<div style="font-size: 18px;"><img src="../img/user.png" style="width: 25px; margin-bottom: 5px;"/>&nbsp;&nbsp;'.$row2['commentor_name'].' said '.$row2['comment'].' <span style="color: #afafaf;">'.$this->compDates($row2['comment_date']).'</span></div>';
						}
						echo "</div>";
					}
				}
			}else{
				die(mysql_error());
			}
		}

		public function comment($commented_blog, $commentor_name, $comment){
			$success = false;
			$sql = "INSERT INTO comment(commented_blog, commentor_name, comment, comment_date) VALUES('$commented_blog', '$commentor_name', '$comment', NOW());";
			$result = mysql_query($sql);
			if($result){
				$success = true;
			}else{
				die("ERROR ".mysql_error());
			}return $success;
		}

		public function showMyBlogs($pr){
			$sql = "SELECT * FROM blog WHERE blogger_id = '$pr';";
			$result = mysql_query($sql);
			if($result){
				$val = 0;
				while($row=mysql_fetch_array($result)){
					echo '<div style="font-size: 25px;"><form method="POST" action="manage_blog.php"><input type="hidden" name="blog_id" value="'.$row['blog_id'].'"/><button type="submit" class="submitbutton" value="'.$row['blog_id'].'" onclick="showBlog(this.value)">'.$row['blog_title'].'</button></form></div>';
				}
			}else{
				die(mysql_error());
			}
		}

		public function showMyBlogs2($pr){
			$sql = "SELECT * FROM blog WHERE blog_id = '$pr';";
			$result = mysql_query($sql);
			if($result){
				while($row=mysql_fetch_array($result)){
					$_SESSION['sel_blog_title'] = $row['blog_title'];
					$_SESSION['sel_blog'] = $row['blog'];
					echo '<form method="POST" action="author_panel.php" id="blog"><input type="hidden" name="blog_title" value="'.$row['blog_title'].'"><input type="hidden" name="blog" value="'.$row['blog'].'"><input type="hidden" name="blog_id" value="'.$row['blog_id'].'"></form>
						<script>document.getElementById("blog").submit();</script>';
				}
			}else{
				die(mysql_error());
			}
		}

		public function checkBlog(){
			if(isset($_POST['blog_id'])){
				echo $_POST['blog_id'];
			}else{
				echo "<script>alert('Please select first a blog');</script>";
			}
		}

		public function deleteBlog($pr){
			$success = false;
			$sql="DELETE FROM blog WHERE blog_id='$pr';";
			$result = mysql_query($sql);
			if($result){
				$success = true;
			}else{
				die(mysql_error());
			}return $success;
		}

		public function saveBlog($blog_title, $blog, $blogger_id){
			$success = false;
			$sql="INSERT INTO blog(blog_title, blog, blogger_id, blog_date, allow) VALUES('$blog_title', '$blog', '$blogger_id', NOW(), 0);";
			$result = mysql_query($sql);
			if($result){
				$success = true;
			}else{
				die(mysql_error());
			}return $success;
		}

		public function publish($pr){
			$success = false;
			$sql="UPDATE blog SET allow = 1 WHERE blog_id='$pr';";
			$result = mysql_query($sql);
			if($result){
				$success = true;
			}else{
				die(mysql_error());
			}return $success;
		}

		public function unpublish($pr){
			$success = false;
			$sql="UPDATE blog SET allow = 0 WHERE blog_id='$pr';";
			$result = mysql_query($sql);
			if($result){
				$success = true;
			}else{
				die(mysql_error());
			}return $success;
		}

		public function enableUser($prid){
			$success = false;
			$sql="UPDATE google_users SET access=1 WHERE google_id='$prid';";
			$result = mysql_query($sql);
			if($result){
				$success = true;
			}else{
				mysql_error();
			}return $success;
		}

		public function disableUser($prid){
			$success = false;
			$sql="UPDATE google_users SET access=0 WHERE google_id='$prid';";
			$result = mysql_query($sql);
			if($result){
				$success = true;
			}else{
				mysql_error();
			}return $success;
		}

		public function deleteComment($pr){
			$success = false;
			$sql="DELETE FROM comment WHERE comment_id='$pr';";
			$result = mysql_query($sql);
			if($result){
				$success = true;
			}else{
				mysql_error();
			}return $success;
		}

		public function checkUtype($prid){
			$success = false;
			$sql = "SELECT user_type FROM google_users WHERE google_id = '$prid';";
			$result = mysql_query($sql);
			if($result){
				$res = mysql_result($result, 0);
			}else{
				die(mysql_error());
			}return $res;
		}

		public function viewAuthors(){
			$sql="SELECT google_id, google_name, date_join FROM google_users;";
			$result=mysql_query($sql);
			if($result){
				while($row=mysql_fetch_array($result)){
					echo '<form method="POST" action="admin_process.php"><strong>'.$row['google_name'].' </strong><cite>joined '.$this->compDates($row['date_join']).'</cite>&nbsp;&nbsp;<strong>(&nbsp;<button type="submit" name="enable" class="nbutt">Enable</button>&nbsp;&nbsp;/&nbsp;&nbsp;<button type="submit" name="disable" class="nbutt">Disable</button>&nbsp;)</strong><input type="hidden" name="google_id" value="'.$row['google_id'].'"></form>';
				}
			}else{
				die(mysql_error());
			}
		}

		public function disableBlogs(){
			$sql="SELECT blog_id, blog_title, google_name, blog_date FROM blog JOIN google_users ON blog.blogger_id=google_users.google_id;";
			$result=mysql_query($sql);
			if($result){
				while($row=mysql_fetch_array($result)){
					echo '<form method="POST" action="admin_process.php"><strong>'.$row['blog_title'].' </strong><cite>'.$this->compDates($row['blog_date']).'</cite>&nbsp;&nbsp;<strong>(&nbsp;<button type="submit" name="publish" class="nbutt">Publish</button>&nbsp;&nbsp;/&nbsp;&nbsp;<button type="submit" name="unpublish" class="nbutt">Unpublish</button>&nbsp;)</strong><input type="hidden" name="blog_id" value="'.$row['blog_id'].'"></form>';
				}
			}else{
				die(mysql_error());
			}
		}

		public function viewComments(){
			$sql="SELECT comment_id, commentor_name, comment, comment_date FROM comment;";
			$result=mysql_query($sql);
			if($result){
				while($row=mysql_fetch_array($result)){
					echo '<form method="POST" action="admin_process.php">'.$row['commentor_name'].' said <strong>'.$row['comment'].' </strong><cite>'.$this->compDates($row['comment_date']).'</cite>&nbsp;&nbsp;<strong>(&nbsp;<button type="submit" name="comment_del" class="nbutt">Delete</button>&nbsp;)</strong><input type="hidden" name="comment_id" value="'.$row['comment_id'].'"></form>';
				}
			}else{
				die(mysql_error());
			}
		}

		public function compDates($time){
			date_default_timezone_set('Asia/Manila');
			$start  = date_create($time);
			$end 	= date_create(); // Current time and date
			$diff  	= date_diff( $start, $end );
			if($diff->y==0){
				if($diff->m==0){
					if($diff->d==0){
						if($diff->h==0){
							if($diff->i==0){
								$msg = "Just now";
							}elseif($diff->i==1){
								$msg = $diff->i." minute ago";
							}else{
								$msg = $diff->i." minutes ago";
							}
						}elseif($diff->h==1){
							$msg = $diff->h. " hour ago";
						}else{
							$msg = $diff->h. " hours ago";
						}
					}elseif($diff->d>7){
						$days = $diff->d;
						$weeks = $days/7;
						$weeks = round($weeks);
						if($weeks==1){
							$msg = "$weeks week ago";
						}else{
							$msg = "$weeks weeks ago";
						}
					}elseif($diff->d==1){
						$msg = $diff->d." day ago";
					}else{
						$msg = $diff->d." days ago";
					}
				}elseif($diff->m==1){
					$msg = $diff->m." month ago";
				}else{
					$msg = $diff->m." months ago";
				}
			}elseif($diff->y==1){
				$msg = $diff->y." year ago";
			}else{
				$msg = $diff->y." years ago";
			}return $msg;
		}



	}

?>
