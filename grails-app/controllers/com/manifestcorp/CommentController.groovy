package com.manifestcorp

import grails.plugin.springsecurity.annotation.Secured
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.CREATED

@Secured('permitAll')
class CommentController {

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Comment.list(params), model:[commentCount: Comment.count()]
    }

    def show(Comment comment) {
        respond comment
    }

    def create() {
        respond new Comment(params)
    }

    @Transactional
    def save(Comment comment) {
        if (comment == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (comment.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond comment.errors, view:'show'
            return
        }

        comment.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'Blog created')
                redirect comment
            }
            '*' { respond comment, [status: CREATED] }
        }
    }
}
