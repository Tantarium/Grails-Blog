
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
                    <g:form controller="comment" resource="${com}" method="DELETE">
                        <button class="delete btn btn-danger" type="submit" onclick="return confirm('${message(code:
                            'default.button.delete.confirm.message', default: 'Are you sure?')}');">

                            <g:img dir="image" file="Trash-Can.png" height="20" width="20" />
                             Delete Comment
                        </button>
                    </g:form>
                </sec:ifLoggedIn>
            </div>
            <div id="commentText_${commentNumber}" class="panel-footer">
                <pre>${com.commentText}</pre>
            </div>
        </div>
    </g:each>
</div>

