
<div class="col-sm-12">
    <h3>Comments:</h3>
</div>

<div class="col-sm-12">
    <g:each in="${comments}" status="commentNumber" var="com">
        <div class="panel panel-default">
            <div id="name_and_date_${commentNumber}" class="panel-heading">
                <b>Name: </b><span id="commenter_${commentNumber}">${com.commenter}</span>
                <br />
                Date: ${com.dateCreated}
            </div>
            <div id="commentText_${commentNumber}" class="panel-footer">
                <pre>${com.commentText}</pre>
            </div>
            <sec:ifLoggedIn>
                <a href="/comment/show/${com.id}">Go to comment</a>
            </sec:ifLoggedIn>
        </div>
    </g:each>
</div>

