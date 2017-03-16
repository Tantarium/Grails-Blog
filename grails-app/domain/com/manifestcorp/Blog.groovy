package com.manifestcorp

class Blog {

    String title
    String text
    Date dateCreated

    static constraints = {
        title(blank:false)
        text(widget:'textarea', nullable: false)
    }

    static mapping = {
        sort dateCreated: 'desc'
    }
}
