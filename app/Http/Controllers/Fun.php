<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Model;
use Illuminate\Support\Facades\Input;


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

	public function showMyBlogs(){
		if(\Auth::check()){
			$user_stuff = auth()->user();
			$user_id = $user_stuff->id;
			$user_stuff = auth()->user();
			$user_id = $user_stuff->id;
			$users = \DB::table('blog')
			->select('blog.*')
			->where('blogger_id', '=', $user_id)
			->get();
			return view('home', compact('users'));
		}else{
			return redirect()->to('/login');
		}
	}

	public function showMyBlogs2(){
		if(\Auth::check()){
			$user_stuff = auth()->user();
			$user_id = $user_stuff->id;
			$user_stuff = auth()->user();
			$user_id = $user_stuff->id;
			$users = \DB::table('blog')
			->select('blog.*')
			->where('blogger_id', '=', $user_id)
			->get();
			return view('addblog', compact('users'));
		}else{
			return redirect()->to('/login');
		}
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
		->select('name', 'blog_id', 'blog_title', 'blog', 'blog_date', 'allow', 'commentor_name', 'comment', 'comment_date')
		->join('blog', 'users.id', '=', 'blog.blogger_id')
		->join('comment', 'blog.blog_id', '=', 'comment.commented_blog')
		->where('blog_id', '=', $id)
		->get();
		return view('openblog', compact('users'));
	}

	// public function showComment($id){
	// 	$users = \DB::table('comment')
	// 	->select('commentor_name', 'comment', 'comment_date')
	// 	->join('blog', 'comment.commented_blog', '=', 'blog.blog_id')
	// 	->where('blog_id', '=', $id)
	// 	->get();
	// 	return view('openblog', compact('comment'));
	// 	// $b = \App\Model\TblBlogs::findAll();
	// 	// foreach ($$b as $value) {
	// 	// 	echo $value->name;
	// 	// 	$comment = $value->TblComment;
	// 	// 	foreach ($comment as  $value) {
	// 	// 		echo $value->name;
	// 	// 	}
	// 	// }
	// }

	public function adminPanel(){
		$users = \DB::table('users')
		->select('users.*')
		->get();

		$blog = \DB::table('blog')
		->select('blog.*', 'name')
		->join('users', 'blog.blogger_id', '=', 'users.id')
		->get();

		$comment = \DB::table('comment')
		->select('comment.*')
		->get();
		return view('admin', compact('users', 'blog', 'comment'));
	}

// CREATE SYNTAX (CHECK ALSO ROUTES/WEB.PHP)
	public function comment(Request $request){
		$commented_blog = $request->commented_blog;
		$commentor_name = $request->commentor_name;
		$comment = $request->comment;
		$qry = \DB::table('comment')
		->insert(
			['commented_blog' => $commented_blog, 'commentor_name' => $commentor_name, 'comment' => $comment, 'comment_date' => NOW()]
			);
		return back();
	}

	public function addBlog(Request $request){
		$blog_id = $_POST['blog_id'];
		$type = gettype($blog_id);
		$num = "1";
		$typeint = gettype($num);
		if($type==$typeint){
			if(isset($_POST['blog_id']) && !empty($_POST['blog_id'])){
				if(isset($_POST['delete'])){
					$blog_id = $request->blog_id;
					$qry = \DB::table('blog')
					->where('blog_id', '=', $blog_id)
					->delete();
					// $_SESSION['infomsg'] = '<br><center><div class = "alert alert-success alert-dismissable fade in" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>Blog Deleted!</strong></div></center>';
					return redirect()->to('/home');
				}elseif(isset($_POST['publish'])){
					$blog_id = $request->blog_id;
					$qry = \DB::table('blog')
					->where('blog_id', $blog_id)
					->update(['allow' => 1]);
					// $_SESSION['infomsg'] = '<br><center><div class = "alert alert-success alert-dismissable fade in" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>Blog Published!</strong></div></center>';
					return redirect()->to('/home');
				}elseif(isset($_POST['unpublish'])){
					$blog_id = $request->blog_id;
					$qry = \DB::table('blog')
					->where('blog_id', $blog_id)
					->update(['allow' => 0]);
					// $_SESSION['infomsg'] = '<br><center><div class = "alert alert-info alert-dismissable fade in" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>Blog Unpublished!</strong></div></center>';
					return redirect()->to('/home');
				}elseif(isset($_POST['saveButton'])){
					$blog_id = $request->blog_id;
					$blog_title = $request->blog_title;
					$blog = $request->blog;$user_stuff = auth()->user();
					$user_id = $user_stuff->id;
					if(isset($blog_title) && isset($blog) && !empty($blog_title) && !empty($blog)){
						$qry = \DB::table('blog')
						->insert(
							['blog_title' => $blog_title, 'blog' => $blog, 'blogger_id' => $user_id, 'blog_date' => NOW(), 'allow' => '1']
							);
						// $_SESSION['errmsg'] = '<br><center><div class = "alert alert-success alert-dismissable fade in" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>Your Blog have been Saved!</strong></div></center>';
						return redirect()->to('/home');
					}else{
						// $_SESSION['errmsg'] = '<br><center><div class = "alert alert-danger alert-dismissable fade in" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>Please fill up all forms.</strong></div></center>';
						return redirect()->to('/home');
					}
				}else{
					die("Check author_panel form");
				}
			}else{
				die("1");
				// $_SESSION['errmsg'] = '<br><center><div class = "alert alert-danger alert-dismissable fade in" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>Please select a blog</strong></div></center>';
				return redirect()->to('/home');
			}
		}else{
			die('error');
		}
	}

	public function newBlog(Request $request){
		$blog_title = $request->blog_title;
		$blog = $request->blog;
		$user_stuff = auth()->user();
		$user_id = $user_stuff->id;
		if(isset($blog_title) && isset($blog) && !empty($blog_title) && !empty($blog)){
			$qry = \DB::table('blog')
			->insert(
				['blog_title' => $blog_title, 'blog' => $blog, 'blogger_id' => $user_id, 'blog_date' => NOW(), 'allow' => '1']
				);
			return redirect()->to('/addblog');
			// $_SESSION['errmsg'] = '<br><center><div class = "alert alert-success alert-dismissable fade in" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>Your Blog have been Saved!</strong></div></center>';
		}else{
			return redirect()->to('/home');
			// $_SESSION['errmsg'] = '<br><center><div class = "alert alert-danger alert-dismissable fade in" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>Please fill up all forms.</strong></div></center>';
		}
	}

	public function enableUser(Request $request){
		$id = $request->id;
		if(isset($_POST['enable'])){
			$qry = \DB::table('users')
			->where('id', $id)
			->update(['access' => 0]);
			return redirect()->to('/admin');
		}elseif(isset($_POST['disable'])){
			$qry = \DB::table('users')
			->where('id', $id)
			->update(['access' => 1]);
			return redirect()->to('/admin');
		}else{
			die('No user selected');
		}
	}

	public function blogControl(Request $request){
		$blog_id = $request->blog_id;
		if(isset($_POST['publish'])){
			$qry = \DB::table('blog')
			->where('blog_id', $blog_id)
			->update(['allow' => 0]);
			return redirect()->to('/admin');
		}elseif(isset($_POST['unpublish'])){
			$qry = \DB::table('blog')
			->where('blog_id', $blog_id)
			->update(['allow' => 1]);
			return redirect()->to('/admin');
		}else{
			die('No blog selected');
		}
	}

	public function commentControl(Request $request){
		$comment_id = $request->comment_id;
		if(isset($_POST['delete'])){
			$qry = \DB::table('comment')
			->where('comment_id', $comment_id)
			->delete();
			return redirect()->to('/admin');
		}else{
			die('No comment selected');
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
	
}
