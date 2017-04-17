package com.manifestcorp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured('ROLE_USER')
class CommentController {

    static allowedMethods = [delete: "DELETE"]

    @Transactional
    def delete(Comment comment) {

        comment.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Comment by ' + comment.commenter + ' deleted.')
                redirect controller: 'Blog', action: 'show', id: comment.blog.id
            }
            '*'{ render status: NO_CONTENT }
        }
    }
}
