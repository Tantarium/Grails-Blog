package com.manifestcorp

class Comment {

    String commenter
    String commentText
    Date dateCreated

    static belongsTo = [blog: Blog]

    static constraints = {
        commenter(nullable: false, size: 0..50)
        commentText(widget: 'textarea', size: 0..2147483646, nullable: false)
    }

    static mapping = {
        sort dateCreated: 'desc'
    }
}
