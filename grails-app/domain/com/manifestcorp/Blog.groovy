package com.manifestcorp

class Blog {

    String title
    String text
    Date dateCreated
    String author
    String description

    static constraints = {
        title(blank: false)
        author(nullable: false)
        description(nullable: false)
        text(widget:'textarea', nullable: false)
    }

    static mapping = {
        sort dateCreated: 'desc'
    }
}
