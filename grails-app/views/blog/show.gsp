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
                <sec:ifLoggedIn>
                    <li>
                        <g:link action="create">
                            <g:img dir="image" file="pen-and-paper.png" height="20" width="20" />
                            <g:message code="default.new.label" args="[entityName]" />
                             Entry
                         </g:link>
                     </li>
                 </sec:ifLoggedIn>
                 <li>
                     <g:link class="search" action="search">
                         <g:img dir="images" file="icon.png" height="20" width="20" />
                         Search
                     </g:link>
                 </li>
                 <sec:ifLoggedIn>
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
                 </sec:ifLoggedIn>
            </ul>
        </div>

        <br />


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
                    <pre>${blog.text}</pre>
                </div>
            </div>
        </div>

            <h3>Add Your Own Comment To This Blog:</h3>


            <form onsubmit="jQuery.ajax({type:'POST',data:jQuery(this).serialize(),
                url:'/blog/userComments',success:function(data,textStatus){jQuery('#commentUpdates').html(data);
                },error:function(XMLHttpRequest,textStatus,errorThrown){}});return false"
                method="post" id="commentForm">

                <div class="form-group">
                    <label class="control-label col-sm-1">Name: </label>
                    <div class="col-sm-10"><g:textField name="commenter" /></div>
                    <label class="control-label col-sm-1">Comment: </label>
                    <div class="col-sm-10"><g:textArea name="commentText" rows="5" /></div>
                    <g:hiddenField name="blog.id" value="${blog.id}" />
                    <div class="col-sm-2"><g:submitButton name="create" class="save" value="Post Comment" /></div>
                </div>
            </form>


            <div id="commentUpdates">
                <g:render template="results" model="['comments': blog.comments]"> </g:render>
            </div>

    </body>
</html>