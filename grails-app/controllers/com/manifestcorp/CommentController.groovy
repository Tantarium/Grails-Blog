package com.manifestcorp

import grails.plugin.springsecurity.annotation.Secured

@Secured('permitAll')
class CommentController {

    def index() { }
}
