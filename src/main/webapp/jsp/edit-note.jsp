<%@ page import="com.quicknotes.model.Note" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.tiny.cloud/1/lishk5xbq6cwpx63rryd85ap58ixhgdyr9iajjwot5nvndml/tinymce/6/tinymce.min.js"
        referrerpolicy="origin"></script>

<script>
    tinymce.init({
        selector: 'textarea',
        menubar: false,
        plugins: 'lists table',
        toolbar: 'bold italic underline | bullist numlist | table',
        setup: function (editor) {
            editor.on('change', function () {
                tinymce.triggerSave();
            });
        }
    });
</script>


</head>
<body>

<%
Note note = (Note) request.getAttribute("note");

if (note == null) {
%>
    <h3>Invalid note.</h3>
    <a href="<%=request.getContextPath()%>/notes">Back</a>
<%
    return;
}
%>

<h2>Edit Note</h2>

<form action="<%=request.getContextPath()%>/update-note" method="post">

    <input type="hidden" name="noteId" value="<%=note.getNoteId()%>" />

    Title:<br/>
    <input type="text" name="title" value="<%=note.getTitle()%>" required />
    <br/><br/>

    Content:<br/>
    <textarea name="content" rows="8" cols="40" required>
<%=note.getContent()%>
    </textarea>
    <br/><br/>

    <input type="submit" value="Update Note"/>

</form>

<br/>
<a href="<%=request.getContextPath()%>/notes">Cancel</a>

</body>
</html>
