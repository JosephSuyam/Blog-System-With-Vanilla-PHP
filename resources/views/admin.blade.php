@extends('layouts.app')

@section('content')
{{ checkUser() }}
{{ checkAccess() }}
{{ checkAdmin() }}
<div class="container">
<a href="home"><button class="btn btn-danger" style="float: right;">Go to Home Page</button></a>
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            @if (session('status'))
                <div class="alert alert-success">
                    {{ session('status') }}
                </div>
            @endif
            <div class = "row">
                <div class = "col-sm-5">
                    <div class = "panel panel-default" style="min-width: 65%;">
                        <div class = "panel-heading" style="font-size: 30px;">
                            <center>Control Panel</center>
                        </div>
                        <div class = "panel-body" style = "width: 100%;"><center>
                            <button type="" name="users" class="btn btn-default" style="margin-bottom: 25px; width: 50%;" onclick="authors()">Authors</button><br>
                            <button type="" name="blog" class="btn btn-default" style="margin-bottom: 25px; width: 50%;" onclick="blogs()">Blogs</button><br>
                            <button type="" name="comment" class="btn btn-default" style="margin-bottom: 25px; width: 50%;" onclick="comments()">Comments</button>
                            <!-- <form method="GET" action="panel">
                                 <button type="submit" name="users" class="btn btn-default" style="margin-bottom: 25px; width: 50%;" onclick="">Authors</button><br>
                                <button type="submit" name="blog" class="btn btn-default" style="margin-bottom: 25px; width: 50%;" onclick="">Blogs</button><br>
                                <button type="submit" name="comment" class="btn btn-default" style="margin-bottom: 25px; width: 50%;" onclick="">Comments</button>
                            </form> -->
                        </center></div><!--panel-body-->
                    </div><!--panel-->
                </div>
                <div class="col-sm-7">
                    <div class = "panel panel-default" style="min-width: 65%;">
                        <div class = "panel-body" style = "width: 100%;">
                            <!-- view accounts, blogs, comments -->
                            <div id="authors" style="display: block;">
                                @foreach($users as $authors)
                                    <form method="POST" action="admin/{{ $authors->id }}/user">
                                    {{ csrf_field() }}
                                        @if($authors->access==1)
                                            <button type="submit" name="enable" style="background-color: #FFFFFF; border: 0; color: #001687;">Enabled</button> |&nbsp;
                                        @else
                                            <button type="submit" name="disable" style="background-color: #FFFFFF; border: 0; color: #001687;">Disabled</button> |&nbsp;
                                        @endif
                                        {{ $authors->name }} <span style="color: #afafaf;"><cite>joined</cite> {{ compDates($authors->created_at) }}</span>
                                        <input type="hidden" name="id" value="{{ $authors->id }}">
                                    </form>
                                @endforeach
                                {{ $users->links() }}
                            </div>
                            <div id="blogs" style="display: none;">
                                @foreach($blog as $blogs)
                                    <form method="POST" action="admin/{{ $blogs->blog_id }}/blog">
                                    {{ csrf_field() }}
                                        @if($blogs->allow==1)
                                            <button type="submit" name="publish" style="background-color: #FFFFFF; border: 0; color: #001687;">Published</button> |&nbsp;
                                        @else
                                            <button type="submit" name="unpublish" style="background-color: #FFFFFF; border: 0; color: #001687;">Unpublished</button> |&nbsp;
                                        @endif
                                        {{ $blogs->blog_title }} <cite style="color: #afafaf;"> {{ compDates($blogs->blog_date) }} by {{ $blogs->name }}</cite>
                                        <input type="hidden" name="blog_id" value="{{ $blogs->blog_id }}">
                                    </form>
                                @endforeach
                                {{ $blog->links() }}
                            </div>
                            <div id="comments" style="display: none;">
                                @foreach($comment as $comments)
                                    <form method="POST" action="admin/{{ $comments->comment_id }}/comment">
                                    {{ csrf_field() }}
                                        <button type="submit" name="delete" style="background-color: #FFFFFF; border: 0; color: #001687;">Delete</button> |&nbsp;
                                        <span style="color: #afafaf;">{{ $comments->commentor_name }} said</span> {{ $comments->comment }} <cite style="color: #afafaf;"> {{ compDates($comments->comment_date) }}</cite>
                                        <input type="hidden" name="comment_id" value="{{ $comments->comment_id }}">
                                    </form>
                                @endforeach
                                {{ $comment->links() }}
                            </div>
                        </div><!--panel-body-->
                    </div><!--panel-->
                </div>
            </div>
            @if(Session::has('message'))
                <div class="form-group"><center>
                    <div class="alert alert-info" style="width: 50%;"><a href="author_panel.php" class="close" data-dismiss="alert">&times;</a><strong>{{ Session::get('message') }}</strong></div>
                </center></div>
            @endif
        </div>
    </div>
</div>

<script>
    function authors(){
        var authors = document.getElementById("authors");
        var blogs = document.getElementById("blogs");
        var comments = document.getElementById("comments");
        if (authors.style.display === "block") {
            // authors.style.display = "none";
        }else{
            authors.style.display = "block";
            blogs.style.display = "none";
            comments.style.display = "none";
        }
    }

    function blogs(){
        var authors = document.getElementById("authors");
        var blogs = document.getElementById("blogs");
        var comments = document.getElementById("comments");
        if (blogs.style.display === "block") {
            // blogs.style.display = "none";
        }else{
            blogs.style.display = "block";
            authors.style.display = "none";
            comments.style.display = "none";
        }
    }

    function comments(){
        var authors = document.getElementById("authors");
        var blogs = document.getElementById("blogs");
        var comments = document.getElementById("comments");
        if (comments.style.display === "block") {
            // comments.style.display = "none";
        }else{
            comments.style.display = "block";
            authors.style.display = "none";
            blogs.style.display = "none";
        }
    }
</script>

@endsection
