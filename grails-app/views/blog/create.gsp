<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#create-blog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li>
                    <a href="${createLink(uri: '/')}">
                        <g:img dir="images" file="Home-icon.png" height="20" width="20" />
                         <g:message code="default.home.label"/>
                     </a>
                </li>
                 <li>
                     <g:link class="search" action="search">
                         <g:img dir="images" file="icon.png" height="20" width="20" />
                         Search
                     </g:link>
                 </li>
            </ul>
        </div>
        <div id="create-blog" class="content scaffold-create" role="main">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${this.blog}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.blog}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>
                    <g:message error="${error}"/>
                </li>
                </g:eachError>
            </ul>
            </g:hasErrors>
            <g:form action="save">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-sm-1">Title: </label>
                        <div class="col-sm-10"><g:textArea name="title" rows="1" /></div>
                        <label class="control-label col-sm-1">Author: </label>
                        <div class="col-sm-10"><g:textArea name="author" rows="1" /></div>
                        <label class="control-label col-sm-1">Description: </label>
                        <div class="col-sm-10"><g:textArea name="description" rows="2" /></div>
                        <label class="control-label col-sm-1">Text: </label>
                        <div class="col-sm-10"><g:textArea name="text" rows="10" /></div>
                    </div>
                </div>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
