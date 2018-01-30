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
                    My Assessment Blog System
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
        <div class = "col-sm-5">
            <!-- <center><h1>My Assessment Blog System</h1></center> -->
        </div>
        <div class = "col-sm-7" style="border-left: thick double #002259; height: 500px;">
            <h2>Latest Articles</h2>
            <hr class="hrstyle">
        </div>
    </div>

@stop
