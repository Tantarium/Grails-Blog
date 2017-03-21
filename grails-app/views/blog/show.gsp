<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-blog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
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
            </ul>
        </div>


        <div id="show-blog" class="content scaffold-show" role="main">
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <div class="panel panel-default">
                <div id="title" class="panel-heading">
                    <h2>${blog.title}</h2>
                </div>
                <div id="author&dateCreated" class="panel-body">
                    Author: ${blog.author}
                    <br />
                    Date Created: ${blog.dateCreated}
                </div>
                <div id="text" class="panel-footer">
                    ${blog.text}
                </div>
            </div>
            <g:form action="save">
                <div class="form-horizontal">
                    <div class="form-group">
                    <label class="control-label col-sm-1">Name: </label>
                    <div class="col-sm-10"><g:textField name="commenter" /></div>
                    <label class="control-label col-sm-1">Comment: </label>
                    <div class="col-sm-10"><g:textArea name="commentText" /></div>
                    </div>
                </div>
            </g:form>


            <g:form resource="${this.blog}" method="DELETE">
                <fieldset class="buttons">
                    <g:link class="edit" action="edit" resource="${this.blog}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                    <input class="delete" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
