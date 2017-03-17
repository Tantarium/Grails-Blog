<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
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
            </ul>
        </div>

        <br />
        <br />

        <h2>Search</h2>

        <g:form controller="blog" method="get" >
            <input type='text' name='value' value="${value}" />
            <g:actionSubmit value="Search" />
        </g:form>

        Results:

        <ol>
            <g:each var="blog" in="${blogs}">
                    <a href="/blog/show/${blog?.id}">${blog?.title}</a>
                    <br />
            </g:each>
        </ol>
    </body>
</html>