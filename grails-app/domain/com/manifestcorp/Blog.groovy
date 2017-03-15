package com.manifestcorp

class Blog {

    String name
    String note
    Date dateCreated

    static constraints = {
        name(blank:false)
        note(maxSize:1000, widget:'textarea', nullable: true)
    }
}
