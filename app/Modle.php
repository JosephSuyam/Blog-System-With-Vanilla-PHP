<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Modle extends Model
{
    protected $fillable = ['commented_blog', 'commentor_name', 'comment'];

    public function addComment($data){
    	$this->commented_blog=$data['commented_blog'];
    	$this->commentor_name=$data['commentor_name'];
    	$this->comment=$data['comment'];
    	$this->comment_date=NOW();
    	$this->save();
    	die();
    }

}
