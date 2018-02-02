@extends('layouts.app')

@section('content')
    
    <div class = "row">
        <div class = "col-sm-5">
            <!-- <center><h1>My Assessment Blog System</h1></center> -->
        </div>
        <div class = "col-sm-7" style="border-left: thick double #002259; height: 500px;">
            <h2>Latest Articles</h2>
            <!-- show publlish blog list here-->
 			@foreach($users as $blog)
                <li style="font-size: 25px; margin-left: 15px;">
                    <a href="openblog/{{ $blog->blog_id }}">
                        {{ $blog->blog_title }}
                    </a>
                </li>
            @endforeach
        </div>
    </div>

@stop
