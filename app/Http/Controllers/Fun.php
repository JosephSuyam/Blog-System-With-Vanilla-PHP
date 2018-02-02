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
			// ->paginate(2);
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
		->select('name', 'blog_id', 'blog_title', 'blog', 'blog_date', 'allow')
		->join('blog', 'users.id', '=', 'blog.blogger_id')
		->where('blog_id', '=', $id)
		->get();

		$comment = \DB::table('blog')
		->select('commentor_name', 'comment', 'comment_date')
		->join('comment', 'blog.blog_id', '=', 'comment.commented_blog')
		->where('commented_blog', '=', $id)
		->orderBy('comment_date', 'desc')
		->paginate(5);
		return view('openblog', compact('users', 'comment'));
	}

	// public function adminPanel(){
	// 	if(isset($_GET['users'])){
	// 		$users = \DB::table('users')
	// 		->select('users.*')
	// 		->where('usertype', '=', NULL)
	// 		->paginate(10);
	// 		return view('admin', compact('users'));
	// 	}elseif(isset($_GET['blog'])){
	// 		$blog = \DB::table('blog')
	// 		->select('blog.*', 'name')
	// 		->join('users', 'blog.blogger_id', '=', 'users.id')
	// 		->paginate(10);
	// 		return view('admin', compact('blog'));
	// 	}elseif(isset($_GET['comment']))(
	// 		$comment = \DB::table('comment')
	// 		->select('comment.*')
	// 		->paginate(10);
	// 		return view('admin', compact('comment'));
	// 	)else{
	// 		die('yea');
	// 	}
	// }

	public function adminPanel(){
		$users = \DB::table('users')
		->select('users.*')
		->where('usertype', '=', NULL)
		->paginate(10);

		$blog = \DB::table('blog')
		->select('blog.*', 'name')
		->join('users', 'blog.blogger_id', '=', 'users.id')
		->paginate(10);

		$comment = \DB::table('comment')
		->select('comment.*')
		->paginate(10);
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
		return back()->with('message', 'Comment uploaded');;
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

					$qry = \DB::table('comment')
					->where('commented_blog', '=', $blog_id)
					->delete();
					return redirect()->to('/home')->with('message', 'Blog Deleted!');
				}elseif(isset($_POST['publish'])){
					$blog_id = $request->blog_id;
					$qry = \DB::table('blog')
					->where('blog_id', $blog_id)
					->update(['allow' => 1]);
					return redirect()->to('/home')->with('message', 'Blog Published!');
				}elseif(isset($_POST['unpublish'])){
					$blog_id = $request->blog_id;
					$qry = \DB::table('blog')
					->where('blog_id', $blog_id)
					->update(['allow' => 0]);
					return redirect()->to('/home')->with('message', 'Blog Unpublished!');
				}elseif(isset($_POST['saveButton'])){
					$blog_id = $request->blog_id;
					$blog_title = $request->blog_title;
					$blog = $request->blog;$user_stuff = auth()->user();
					$user_id = $user_stuff->id;
					if(isset($blog_title) && isset($blog)){
						$qry = \DB::table('blog')
						->where('blog_id', $blog_id)
						->update(
							['blog_title' => $blog_title, 'blog' => $blog]
							);
						return redirect()->to('/home')->with('message', 'Your Blog have been Saved!');
					}else{
						return redirect()->to('/home')->with('message', 'Please fill up all forms.');
					}
				}else{
					die("Check author_panel form");
				}
			}else{
				return redirect()->to('/home')->with('message', 'Please select a blog.');
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
			return redirect()->to('/home')->with('message', 'Your blog have been saved!');
		}else{
			return redirect()->to('/home')->with('message', 'Please fill up all forms.');
		}
	}

	public function enableUser(Request $request){
		$id = $request->id;
		if(isset($_POST['enable'])){
			$qry = \DB::table('users')
			->where('id', $id)
			->update(['access' => 0]);
			return redirect()->to('/admin')->with('message', 'User Access Disabled!');
		}elseif(isset($_POST['disable'])){
			$qry = \DB::table('users')
			->where('id', $id)
			->update(['access' => 1]);
			return redirect()->to('/admin')->with('message', 'User Access Enabled!');
		}else{
			return redirect()->to('/admin')->with('message', 'No user selected.');
		}
	}

	public function blogControl(Request $request){
		$blog_id = $request->blog_id;
		if(isset($_POST['publish'])){
			$qry = \DB::table('blog')
			->where('blog_id', $blog_id)
			->update(['allow' => 0]);
			return redirect()->to('/admin')->with('message', 'Blog unpublished!');
		}elseif(isset($_POST['unpublish'])){
			$qry = \DB::table('blog')
			->where('blog_id', $blog_id)
			->update(['allow' => 1]);
			return redirect()->to('/admin')->with('message', 'Blog Published!');
		}else{
			return redirect()->to('/admin')->with('message', 'No blog selected.');
		}
	}

	public function commentControl(Request $request){
		$comment_id = $request->comment_id;
		if(isset($_POST['delete'])){
			$qry = \DB::table('comment')
			->where('comment_id', $comment_id)
			->delete();
			return redirect()->to('/admin')->with('message', 'Comment Deleted!');
		}else{
			return redirect()->to('/admin')->with('message', 'No comment selected.');
		}
	}
	
}
