package com.manifestcorp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured('ROLE_USER')
class CommentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def show(Comment comment) {
        respond comment
    }

    @Secured('permitAll')
    def create() {
        respond new Comment(params)
    }

    @Transactional
    @Secured('permitAll')
    def save(Comment comment) {
        if (comment == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (comment.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond comment.errors, view:'create'
            return
        }

        comment.save flush:true

        redirect controller: 'blog', action: 'show', id: comment.blog.id
    }

    @Transactional
    def delete(Comment comment) {
        if (comment == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        comment.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'comment.label', default: 'Comment by'), comment.commenter])
                redirect controller: 'Blog', action: 'show', id: comment.blog.id
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'comment.label', default: 'Comment'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
