<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TblComments extends Model {

    /**
     * Generated
     */
    public $timestamps = false;
    protected $table = 'comment'; // table name
    protected $fillable = ['comment_id', 'commented_blog', 'commentor_name', 'comment', 'comment_date']; // fields


    public function tblComments() { //
        return $this->belongsTo(\App\Models\TblBlogs::class, 'commented_blog', 'blog_id');  // \App\Models\TblRules(model of diff table)::class, pk of \App\Models\TblRules, fk? $this 
    }

    // public function tblUsers() {
    //     return $this->belongsTo(\App\Models\TblUsers::class, 'operator_id', 'id');
    // }

    // public function tblLibraries() {
    //     return $this->belongsTo(\App\Models\TblLibraries::class, 'library_id', 'id');
    // }


}
