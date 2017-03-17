<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#list-blog" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
            <ul>
                <li>
                    <a href="${createLink(uri: '/')}">
                        <g:img dir="images" file="Home-icon.png" height="20" width="20" />
                         <g:message code="default.home.label" />
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
                    <g:link class="search" action="search">
                        <g:img dir="images" file="search-icon.png" height="20" width="20" />
                        Search
                    </g:link>
                </li>

            </ul>
        </div>
        <div id="list-blog" class="content scaffold-list" role="main">
            <h1>Blog Entries</h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:each in="${blogList}" status="numberOfIndex" var="blog">
                <div class="panel panel-default">
                    <div id="Row ${numberOfIndex}" class="panel-heading">
                        <a id="${numberOfIndex}" href="/blog/show/${blog?.id}">
                            <h4>${blog.title}</h4>
                        </a>
                    </div>
                    <div class="panel-body">
                        <b>Author:</b> ${blog.author}
                        <br />
                        <b>Date Created:</b> ${blog.dateCreated}
                    </div>
                    <div class="panel-footer">
                        ${blog.description}
                    </div>
                </div>

            </g:each>

<!--            <g:if test="${blogList != null}">
                <f:table collection="${blogList}" />
            </g:if>
-->
            <div class="pagination">
                <g:paginate max="10" total="${blogCount ?: 0}" />
            </div>
        </div>
    </body>
</html>