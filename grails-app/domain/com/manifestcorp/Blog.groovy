package com.manifestcorp

class Blog {

    String title
    String text
    Date dateCreated

    static constraints = {
        title(blank:false)
        text(maxSize:1000, widget:'textarea', nullable: false)
    }
}
