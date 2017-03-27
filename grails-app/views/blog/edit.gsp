<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#edit-blog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li>
                    <a href="${createLink(uri: '/')}">
                        <g:img dir="images" file="Home-icon.png" height="20" width="20" />
                         <g:message code="default.home.label"/>
                     </a>
                </li>
                <li>
                    <g:link action="create">
                        <g:img dir="image" file="pen-and-paper.png" height="20" width="20" />
                        <g:message code="default.new.label" args="[entityName]" />
                         Entry
                    </g:link>
                </li>
                <sec:ifLoggedIn>
                    <li>
                        <g:form resource="${this.blog}" method="DELETE">
                            <button class="delete btn btn-danger" type="submit" onclick="return confirm('${message(code:
                                'default.button.delete.confirm.message', default: 'Are you sure?')}');">

                                <g:img dir="image" file="Trash-Can.png" height="20" width="20" />
                                 Delete Blog
                            </button>
                        </g:form>
                    </li>
                </sec:ifLoggedIn>
            </ul>
        </div>
        <div id="edit-blog" class="content scaffold-edit" role="main">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.blog}">
                <ul class="errors" role="alert">
                    <g:eachError bean="${this.blog}" var="error">
                        <li <g:if test="${error in org.springframework.validation.FieldError}">
                            data-field-id="${error.field}"</g:if>>

                            <g:message error="${error}"/>
                        </li>
                    </g:eachError>
                </ul>
            </g:hasErrors>
            <g:form resource="${this.blog}" method="PUT" name="blog">
                <g:hiddenField name="version" value="${this.blog?.version}" />
                <fieldset class="form">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-1">Title: </label>
                            <div class="col-sm-10"><g:textArea name="title" value="${blog.title}" rows="1" /></div>
                            <label class="control-label col-sm-1">Author: </label>
                            <div class="col-sm-10"><g:textArea name="author" value="${blog.author}" rows="1" /></div>
                            <label class="control-label col-sm-1">Description: </label>
                            <div class="col-sm-10"><g:textArea name="description" value="${blog.description}" rows="2" /></div>
                            <label class="control-label col-sm-1">Text: </label>
                            <div class="col-sm-10">
                                <g:textArea name="text" value="${blog.text}" rows="10"/>
                            </div>
                        </div>
                    </div>
                </fieldset>
                <fieldset class="buttons">
                    <input class="save" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
