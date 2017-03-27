<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'comment.label', default: 'Comment')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-comment" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
        </div>

        <br />
        <div class="col-sm-12">
            <div id="show-comment" class="content scaffold-show" role="main">
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>
                <div class="panel panel-default">
                    <div id="commenter" class="panel-heading">
                        <h2>${comment.commenter}</h2>
                    </div>
                    <div id="dateCreated" class="panel-body">
                        Date Created: ${comment.dateCreated}
                        <br />
                        Blog: ${comment.blog.title}
                    </div>
                    <div id="text" class="panel-footer">
                        <pre>${comment.commentText}</pre>
                    </div>
                </div>
            </div>

            <g:form resource="${this.comment}" method="DELETE">
                <button class="delete btn btn-danger" type="submit" onclick="return confirm('${message(code:
                    'default.button.delete.confirm.message', default: 'Are you sure?')}');">

                    <g:img dir="image" file="Trash-Can.png" height="20" width="20" />
                     Delete Comment
                </button>
            </g:form>

            <br />

            <a href="/blog/show/${comment.blog.id}">
                <button class="btn btn-primary">Back to Blog</button>
            </a>

        </div>

    </body>
</html>
