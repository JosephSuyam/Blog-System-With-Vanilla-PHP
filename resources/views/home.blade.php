@extends('layouts.app')

@section('content')
<div class="container">
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
                        </div><!--panel-body-->
                    </div><!--panel-->
                </div>
                <div class="col-sm-7">
                    <form method="POST" action="blog_process.php">
                        <div class = "panel panel-default" style="min-width: 65%;">
                            <div class = "panel-heading" style="background-color: #FFFFFF   ;">
                                <input type="text" name="blog_title" placeholder="New Blog Title" value="<?PHP echo (isset($_POST['blog_title']) ? $conn->clean_data($_POST['blog_title']) : "New blog title here..." );?>" style="width: 100%; font-size: 30px; outline: none; border: 0;">
                            </div>
                            <div class = "panel-body" style = "width: 100%;">
                                <textarea name="blog" placeholder="Write your new blog here..." style="width: 100%; font-size: 20px; margin-top: 12px; height: 275px; resize: vertical; outline: none; border: 0;"><?PHP echo (isset($_POST['blog']) ? $conn->clean_data($_POST['blog']) : "Write your new blog here..." );?></textarea>
                            </div><!--panel-body-->
                        </div><!--panel-->
                        <input type="hidden" name="blog_id" value="<?PHP echo (isset($_POST['blog_id']) ? $_POST['blog_id'] : "Blog Title" ) ?>">
                        <button type="submit" name="delete" class="btn btn-outline-danger">Delete</button>
                        <div class="dropdown" style = "width: 125px; float: right; margin-right: 25px;">
                            <button class="btn btn-outline-success dropdown-toggle" type="button" data-toggle="dropdown">Publish Settings&nbsp;<span class="caret"></span></button>
                            <ul class="dropdown-menu">
                                <li><input type = "submit" value = "Publish" name="publish" class = "btn btn-outline-success" style = " display: inline-block; width: 100%;"/></li>
                                <li><input type = "submit" value = "Unpublish" name="unpublish" id = "" class = "btn btn-outline-success" style = " display: inline-block; width: 100%;"/></li>
                            </ul>
                        </div>
                        <button type="submit" name="save" class="btn btn-outline-info" style="float: right; margin-right: 20px;">Save</button>
                    </form>
                    <!-- <?PHP
                        // echo isset($_SESSION['infomsg']) ? $_SESSION['infomsg'] : "";
                        // echo isset($_SESSION['errmsg']) ? $_SESSION['errmsg'] : "";
                        // unset($_SESSION['infomsg']);
                        // unset($_SESSION['errmsg']);
                    ?> -->
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
