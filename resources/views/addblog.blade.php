@extends('layouts.app')

@section('content')
{{ checkUser() }}
{{ checkAccess() }}
<div class="container">
<a href="javascript:history.go(-1)"><button class="btn btn-danger" style="float: right;">Go to Previous Page</button></a>
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
                            <center>My Blogs</center>
                        </div>
                        <div class = "panel-body" style = "width: 100%;">
                            <!--SHOW MYBLOGS-->
                            @foreach($users as $blog)
                                <li>
                                    <a href="{{ (strpos($_SERVER['REQUEST_URI'], '/home/')) ? $blog->blog_id : 'home/'.$blog->blog_id }}">
                                        {{ $blog->blog_title }}
                                    </a>
                                </li>
                            @endforeach
                        </div><!--panel-body-->
                    </div><!--panel-->
                </div>
                <div class="col-sm-7">
                    <form method="POST" action="addblog/new">
                        {{ csrf_field() }}
                        <div class = "panel panel-default" style="min-width: 65%;">
                            <div class = "panel-heading" style="background-color: #FFFFFF;">
                                <input type="text" name="blog_title" placeholder="New Blog Title" value="" style="width: 100%; font-size: 30px; outline: none; border: 0;" placeholder="New blog title here...">
                            </div>
                            <div class = "panel-body" style = "width: 100%;">
                                <textarea name="blog" placeholder="Write your new blog here..." style="width: 100%; font-size: 20px; margin-top: 12px; height: 275px; resize: vertical; outline: none; border: 0;" placeholder="Write your new blog here..."></textarea>
                            </div><!--panel-body-->
                        </div><!--panel-->
                        <button type="submit" name="saveButton" class="btn btn-info" style="float: right; margin-right: ;">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


@endsection
