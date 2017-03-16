<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Blog Find</title>
    </head>

    <body>
        <div class="nav" role="navigation">
            <ul>
                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            </ul>
        </div>

        <br />
        <br />

        <h2>Post Search</h2>

        <g:form controller="blog" method="post" >
            <input type='text' name='value' value="${value}" />
            <g:actionSubmit value="Search" />
        </g:form>

        Results:

        <ol>
            <g:each var="blog" in="${BlogList}">
                <li>${blog?.title}
                    <g:if test="${blog.text}">- </g:if>
                    ${blog?.text}
                </li>
            </g:each>
        </ol>
    </body>
</html>