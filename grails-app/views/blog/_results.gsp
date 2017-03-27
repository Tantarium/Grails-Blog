
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
                <br />
                <sec:ifLoggedIn>
                    <a href="/comment/show/${com.id}">
                        <button class="btn btn-info">Go To Comment</button>
                    </a>
                </sec:ifLoggedIn>
            </div>
            <div id="commentText_${commentNumber}" class="panel-footer">
                <pre>${com.commentText}</pre>
            </div>
        </div>
    </g:each>
</div>

