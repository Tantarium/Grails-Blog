<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
        <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
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
                        <g:img dir="images" file="icon.png" height="20" width="20" />
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

            <g:each in="${blogList}" status="numberOfIndex" var="item">
                <div class="panel panel-default">
                    <div id="Row ${numberOfIndex}" class="panel-heading">
                        <g:link mapping="blogLink" params="[id: item.id,title: seo.convert(value:item.title)]">
                            <div id="blog-link-${numberOfIndex}"><h4>${item.title}</h4></div>
                        </g:link>
                    </div>
                    <div class="panel-body">
                        <div id="author ${numberOfIndex}"><b>Author:</b> ${item.author}</div>
                        <div id="date ${numberOfIndex}"><b>Date Created:</b> ${item.dateCreated}</div>
                    </div>
                    <div class="panel-footer">
                        ${item.description}
                    </div>
                </div>
            </g:each>

            <div class="pagination">
                <g:paginate max="10" total="${blogCount ?: 0}" />
            </div>
        </div>
    </body>
</html>