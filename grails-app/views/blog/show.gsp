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
                 <li>
                    <g:link class="edit" action="edit" resource="${this.blog}">
                        <g:img dir="image" file="scissors.png" height="20" width="20" />
                        <g:message code="default.button.edit.label" default="Edit" /> Blog
                    </g:link>
                 </li>
                 <li>
                    <g:form resource="${this.blog}" method="DELETE">
                        <button class="delete btn btn-danger" type="submit" onclick="return confirm('${message(code:
                            'default.button.delete.confirm.message', default: 'Are you sure?')}');">

                            <g:img dir="image" file="Trash-Can.png" height="20" width="20" />
                            Delete Blog
                        </button>
                    </g:form>
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

            <a href="#PostComment">Jump To Comment Entry</a>

            <h3>Comments:</h3>

            <g:each in="${blog.comments.sort{dateCreated}}" status="commentNumber" var="com">
                <div class="panel panel-default">
                    <div id="name_and_date_${commentNumber}" class="panel-body">
                        <b>Name: </b><span id="commenter_${commentNumber}">${com.commenter}</span>
                        <br />
                        Date: ${com.dateCreated}
                    </div>
                    <div id="commentText_${commentNumber}" class="panel-body">
                        ${com.commentText}
                    </div>
                </div>
            </g:each>

            <a name="PostComment"></a>

            <h3>Add Your Own Comment To This Blog:</h3>

            <g:form action="save" controller="Comment">
                <f:with bean="comment">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-sm-1">Name: </label>
                            <div class="col-sm-10"><g:textField name="commenter" /></div>
                            <label class="control-label col-sm-1">Comment: </label>
                            <div class="col-sm-10"><g:textArea name="commentText" /></div>
                            <g:hiddenField name="blog.id" value="${blog.id}" />
                            <div class="col-sm-2"><g:submitButton name="create" class="save" value="Post Comment" /></div>
                        </div>
                    </div>
                </f:with>
            </g:form>

        </div>
    </body>
</html>
