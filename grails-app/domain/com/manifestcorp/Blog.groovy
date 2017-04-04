package com.manifestcorp

class Blog {

    String title
    String text
    Date dateCreated
    String author
    String description
    SortedSet comments

    static hasMany = [comments:Comment]

    static constraints = {
        title(blank: false)
        author(nullable: false)
        description(nullable: false, size: 0..5000)
        text(widget:'textarea', nullable: false, size: 0..2147483646)
    }

    static mapping = {
        sort dateCreated: 'desc'
    }
}
