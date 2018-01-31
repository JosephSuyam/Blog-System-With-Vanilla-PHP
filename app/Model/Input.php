<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Input extends Model {

    /**
     * Generated
     */
    public $timestamps = false;
    protected $table = 'comment'; // table name
    protected $fillable = ['comment_id', 'commented_blog', 'commentor_name', 'comment', 'comment_date']; // fields


    public function addComment($data){
        $this->commented_blog=$data['commented_blog'];
        $this->commentor_name=$data['commentor_name'];
        $this->comment=$data['comment'];
        $this->comment_date=NOW();
        $this->save();
        die();
    }



}
