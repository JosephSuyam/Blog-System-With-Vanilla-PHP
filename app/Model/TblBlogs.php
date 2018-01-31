<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TblBlogs extends Model {

    /**
     * Generated
     */
    public $timestamps = false;
    protected $table = 'blog'; // table name
    protected $fillable = ['blog_id', 'blog_title', 'blog', 'blogger_id', 'blog_date', 'allow']; // fields


    public function tblBlogs() { //
        return $this->belongsTo(\App\Models::find('blog_id'));  // \App\Models\TblRules(model of diff table)::class, pk of \App\Models\TblRules, fk? $this 
    }

    public function tblUsers() {
        return $this->belongsTo(\App\Models\TblUsers::class, 'operator_id', 'id');
    }

    public function tblLibraries() {
        return $this->belongsTo(\App\Models\TblLibraries::class, 'library_id', 'id');
    }


}
