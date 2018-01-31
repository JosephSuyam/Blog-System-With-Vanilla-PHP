@extends('layout')

	<div id="app">
        <nav class="navbar navbar-default navbar-static-top">
            <div class="navbar-header">

                <!-- Collapsed Hamburger -->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse" aria-expanded="false">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <!-- Branding Image -->
                <a class="navbar-brand" href="http://localhost/blog/public">
                    Blog System
                </a>
            </div>

            <div class="collapse navbar-collapse" id="app-navbar-collapse">
                <!-- Left Side Of Navbar -->
                <ul class="nav navbar-nav">
                    &nbsp;
                </ul>

                <!-- Right Side Of Navbar -->
                <ul class="nav navbar-nav navbar-right">
                    <!-- Authentication Links -->
					<li><a href="http://localhost/blog/public/login">Login</a></li>
					<li><a href="http://localhost/blog/public/register">Register</a></li>
				</ul>
            </div>
        </nav>
    </div>

@section('content')


    
    <div class = "row">
        <div class = "col-sm-12">
            <a href="/blog/public"><button class="btn btn-danger" style="float: right;">Go to Previous Page</button></a>
            <!-- SHOW THE SELECTED BLOG-->
            @foreach($users as $blog)
            @endforeach
            <div style="font-size: 20px;"><h1>{{ $blog->blog_title }}</h1><hr class="hrstyle">
                <cite>by</cite> {{ $blog->name }} <span style="color: #afafaf;">{{ $blog->blog_date }}</span><br>
            {{ $blog->blog }}</div><br>

            @foreach($users as $comments)
                <div style="font-size: 18px;"><img src="./img/user.png" style="width: 25px; margin-bottom: 5px;"/>&nbsp;&nbsp;{{ $comments->commentor_name }} said {{ $comments->comment }} <cite style="color: #afafaf;"> {{ compDates($comments->comment_date) }} </cite></div>
            @endforeach
            <div style="margin-left: 15px;"><h3>Leave a comment:</h3>
            <form method="POST" action="{{ $blog->blog_id }}/comment">
                {{ csrf_field() }}
                <div class="row form-group">
                    <input type="text" name="commentor_name" placeholder="Name" class="form-control" required>
                    <textarea name="comment" placeholder="Write your comment here..." class="form-control" style="width: 100%; font-size: 20px; margin-top: 12px; height: 275px; resize: vertical;" required></textarea>
                    <input type="hidden" name="commented_blog" value="{{ $blog->blog_id }}">
                    <input type="hidden" name="blog_title" value="{{ $blog->blog_title }}">
                    <button type="submit" class="btn btn-primary" style="margin-top: 12px;">Send Comment</button>
                </div>
            </form><br>
            </div>
        </div>
    </div>

    <?PHP $pgTitle = $blog->blog_title; ?>

@stop
