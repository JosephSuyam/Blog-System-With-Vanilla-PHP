<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Model;

class Fun extends Controller
{
    public function viewBlogs(){
		$users = \DB::table('users')
		->select('name', 'blog_id', 'blog_title', 'blog_date', 'allow')
		->join('blog', 'users.id', '=', 'blog.blogger_id')
		->where('allow', '=', 1)
		->orderBy('blog_date', 'desc')
		->get();

		return view('home', compact('users'));
	}

	public function viewBlogs2(){
		$users = \DB::table('users')
		->select('name', 'blog_id', 'blog_title', 'blog_date', 'allow')
		->join('blog', 'users.id', '=', 'blog.blogger_id')
		->where('allow', '=', 1)
		->get();

		return view('welcome', compact('users'));
	}

	public function openBlog($id){
		$users = \DB::table('users')
		->select('name', 'blog_id', 'blog_title', 'blog', 'blog_date', 'allow')
		->join('blog', 'users.id', '=', 'blog.blogger_id')
		->where('blog_id', '=', $id)
		->get();

		return view('home', compact('users'));
	}

	public function openBlog2($id){
		$users = \DB::table('users')
		->select('name', 'blog_id', 'blog_title', 'blog', 'blog_date', 'allow')
		->join('blog', 'users.id', '=', 'blog.blogger_id')
		->where('blog_id', '=', $id)
		->get();

		return view('openblog', compact('users'));
		// $b = \App\Model\TblBlogs::findAll();
		// foreach ($$b as $value) {
		// 	echo $value->name;
		// 	$comment = $value->TblComment;
		// 	foreach ($comment as  $value) {
		// 		echo $value->name;
		// 	}
		// }
	}

	public function showComment($id){
		$users = \DB::table('comment')
		->select('commentor_name', 'comment', 'comment_date')
		->join('blog', 'comment.commented_blog', '=', 'blog.blog_id')
		->where('blog_id', '=', $id)
		->get();

		return view('openblog', compact('comment'));
		// $b = \App\Model\TblBlogs::findAll();
		// foreach ($$b as $value) {
		// 	echo $value->name;
		// 	$comment = $value->TblComment;
		// 	foreach ($comment as  $value) {
		// 		echo $value->name;
		// 	}
		// }
	}

// old
	public function comment($commented_blog, $commentor_name, $comment){
// 		$qry = \DB::table('users')
// 		->insert(
// 			['commented_blog' => $commented_blog, 'commentor_name' => $commentor_name, 'comment' => $comment, 'comment_date' => NOW()]
// 			);
// die('ok');
		// return back();

		// users::Create([
		// 		'commented_blog' => $commented_blog,
		// 	])
dd( Input::all() );
		$blog = new Blog;
		$blog->username = Input::get('username');

		// $comm = new Modle();
		// $data = $this->validate($request, [
		// 		'commented_blog'=>'required',
		// 		'commentor_name'=>'required',
		// 		'comment'=>'required'
		// 	]);
		// $comm->addComment($data);
		// return redirect('/openblog')->with('success', 'Comment Uploaded');
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

		$qry = \DB::table('blog')
		->select('blog.*')
		->where('blogger_id', '=', '')
		->get();
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

		$qry = \DB::table('blog')
		->select('blog.*')
		->where('blog_id', '=', '')
		->get();
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

		$qry = \DB::table('blog')
		->where('blog_id', '=', '')
		->delete();

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

		$qry = \DB::table('blog')
		->insert(
			['blog_title' => '', 'blog' => 'blogger_id', '' => '', 'blog_date' => '', 'allow' => '']
			);

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

		// DB::table('blog')
		// ->where('blog_id', )
		// ->update(['allow' = ])

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
		$sql="UPDATE users SET access=1 WHERE id='$prid';";
		$result = mysql_query($sql);
		if($result){
			$success = true;
		}else{
			mysql_error();
		}return $success;
	}

	public function disableUser($prid){
		$success = false;
		$sql="UPDATE users SET access=0 WHERE id='$prid';";
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

		// $qry = \DB::table('comment')
		// ->where('comment_id', '=', '')
		// ->delete();

	}

	public function checkUtype($prid){
		$success = false;
		$sql = "SELECT user_type FROM users WHERE id = '$prid';";
		$result = mysql_query($sql);
		if($result){
			$res = mysql_result($result, 0);
		}else{
			die(mysql_error());
		}return $res;

		// $qry = \DB::table('user_type')
		// ->select('user_type')
		// ->where('id', '=', '')
		// ->get();

	}

	public function viewAuthors(){
		$sql="SELECT id, name, date_join FROM users;";
		$result=mysql_query($sql);
		if($result){
			while($row=mysql_fetch_array($result)){
				echo '<form method="POST" action="admin_process.php"><strong>'.$row['name'].' </strong><cite>joined '.$this->compDates($row['date_join']).'</cite>&nbsp;&nbsp;<strong>(&nbsp;<button type="submit" name="enable" class="nbutt">Enable</button>&nbsp;&nbsp;/&nbsp;&nbsp;<button type="submit" name="disable" class="nbutt">Disable</button>&nbsp;)</strong><input type="hidden" name="id" value="'.$row['id'].'"></form>';
			}
		}else{
			die(mysql_error());
		}

		$qry = \DB::table('users')
		->select('id', 'name', 'date_join')
		->get();

	}

	public function disableBlogs(){
		$sql="SELECT blog_id, blog_title, name, blog_date FROM blog JOIN users ON blog.blogger_id=users.id;";
		$result=mysql_query($sql);
		if($result){
			while($row=mysql_fetch_array($result)){
				echo '<form method="POST" action="admin_process.php"><strong>'.$row['blog_title'].' </strong><cite>'.$this->compDates($row['blog_date']).'</cite>&nbsp;&nbsp;<strong>(&nbsp;<button type="submit" name="publish" class="nbutt">Publish</button>&nbsp;&nbsp;/&nbsp;&nbsp;<button type="submit" name="unpublish" class="nbutt">Unpublish</button>&nbsp;)</strong><input type="hidden" name="blog_id" value="'.$row['blog_id'].'"></form>';
			}
		}else{
			die(mysql_error());
		}

		$qry = \DB::table('blog')
		->select('blog_id', 'blog_title', 'name', 'blog_date')
		->join('users', 'blog.blogger_id', '=', 'users.id')
		->get();

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

		\DB::table('comment')
		->select('comment_id', 'commentor_name', 'comment', 'comment_date')
		->get();

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
