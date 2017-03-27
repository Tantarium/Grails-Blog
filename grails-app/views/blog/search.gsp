<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <g:set var="entityName" value="${message(code: 'blog.label', default: 'Blog')}" />
        <meta name="layout" content="main" />
        <title>Blog Find</title>
    </head>

    <body>
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
            </ul>
        </div>

        <br />

        <h2>Search For Blog Entries</h2>

        <g:form controller="blog" method="get" >
            <input id="searchValue" type='text' name='value' value="${value}" />
            <g:actionSubmit id="submitButton" value="Search" />
        </g:form>

        <br />

        Search Results: <br />

        <div class="col-sm-12">
            <g:each var="item" status="numberOfIndex" in="${blogs}">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <g:link mapping="blogLink" params="[id: item.id,title: seo.convert(value:item.title)]">
                            <div id="title ${numberOfIndex}"><h4>${item.title}</h4></div>
                        </g:link>
                    </div>
                    <div class="panel-body">
                        <b>Author:</b> ${item.author}
                        <br />
                        <b>Date Created:</b> ${item.dateCreated}
                    </div>
                    <div class="panel-footer">
                        ${item.description}
                    </div>
                </div>
            </g:each>
        </div>
    </body>
</html>