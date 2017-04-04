package com.manifestcorp

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Transactional(readOnly = true)
@Secured('ROLE_USER')
class BlogController {
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured('permitAll')
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Blog.list(params), model:[blogCount: Blog.count()]
    }

    @Secured('permitAll')
    def show(Blog blog) {
        respond blog
    }

    def create() {
        respond new Blog(params)
    }

    @Transactional
    def save(Blog blog) {
        if (blog == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (blog.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond blog.errors, view:'create'
            return
        }

        blog.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: blog.title + ' blog post created.')
                redirect blog
            }
            '*' { respond blog, [status: CREATED] }
        }
    }

    def edit(Blog blog) {
        respond blog
    }

    @Transactional
    def update(Blog blog) {
        if (blog == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (blog.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond blog.errors, view:'edit'
            return
        }

        blog.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: blog.title + ' updated.')
                redirect blog
            }
            '*'{ respond blog, [status: OK] }
        }
    }

    @Transactional
    def delete(Blog blog) {
        if (blog == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        blog.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: blog.title + ' has been successfully deleted.')
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    @Secured('permitAll')
    def userComments() {
        Blog blog = Blog.findByIdLike(Integer.parseInt(params.blog.id))
        if (params.commentText != "" && params.commenter != null) {
            Comment comment = new Comment()
            comment.blog = blog
            comment.commentText = params.commentText
            comment.commenter = params.commenter
            comment.dateCreated = new Date()
            blog.comments.add(comment)

            blog.save flush: true

            render(template: 'results', model: [comments: blog.comments])
        }
        else {
            render(text: '<br /><br /><br /><br /><br /><br /><br />' +
                    '<font color="red">Comment text or commenter name should not be empty!</font>')
            render(template: 'results', model: [comments: blog.comments])
        }
    }

    @Secured('permitAll')
    def search() {
        render(view:'search')
    }

    @Secured('permitAll')
    def searchResults() {
        def blogs = Blog.findAllByTitleIlike("%${params.value.trim()}%")
        render(template:'searchResults', model: [value: params.value, blogs: blogs])
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'blog.label', default: 'Blog'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
