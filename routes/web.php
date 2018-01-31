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

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get('/MySQLConn', 'MySQLConn@connect');

Route::get('', 'Fun@viewBlogs2');

Route::get('/openblog/{blog_id}', 'Fun@openBlog2');

Route::get('/home', 'Fun@viewBlogs');

Route::get('/home/{blog_id}', 'Fun@openBlog');

// CREATE
Route::post('/openblog/{blog_id}/comment', 'Fun@comment');

Route::post('/home/{blog_id}/addBlog', 'Fun@addBlog');