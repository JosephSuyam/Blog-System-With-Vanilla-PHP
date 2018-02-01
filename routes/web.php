<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

checkUser(); // from helper

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/MySQLConn', 'MySQLConn@connect');

Route::get('', 'Fun@viewBlogs2');

Route::get('/openblog/{blog_id}', 'Fun@openBlog2');

Route::get('/home', 'Fun@showMyBlogs');

Route::get('/home/{blog_id}', 'Fun@openBlog');

Route::get('/addblog', 'Fun@showMyBlogs2');

Route::get('/admin', 'Fun@adminPanel');

// Route::get('/addblog', function(){
// 	return view('addblog');
// });

// CREATE
Route::post('/openblog/{blog_id}/comment', 'Fun@comment');

Route::post('/home/{blog_id}/addBlog', 'Fun@addBlog');

Route::post('/addblog/new', 'Fun@newBlog');

Route::post('/admin/{id}/user', 'Fun@enableUser');

Route::post('/admin/{blog_id}/blog', 'Fun@blogControl');

Route::post('/admin/{comment_id}/comment', 'Fun@commentControl');
