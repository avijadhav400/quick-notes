<%@ page import="com.quicknotes.model.Note" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Note</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <!-- TinyMCE -->
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

<body class="bg-light">

<%
Note note = (Note) request.getAttribute("note");
if (note == null) {
    response.sendRedirect(request.getContextPath() + "/notes");
    return;
}
%>

<div class="container mt-4">
    <h3>Edit Note</h3>

    <form action="<%=request.getContextPath()%>/update-note" method="post"
          onsubmit="tinymce.triggerSave();">

        <!-- REQUIRED -->
        <input type="hidden" name="noteId" value="<%=note.getNoteId()%>">

        <div class="mb-3">
            <label class="form-label">Title</label>
            <input type="text"
                   name="title"
                   class="form-control"
                   value="<%=note.getTitle()%>"
                   required>
        </div>

        <div class="mb-3">
            <label class="form-label">Content</label>
            <textarea name="content"><%=note.getContent()%></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
        <a href="<%=request.getContextPath()%>/notes" class="btn btn-secondary">Cancel</a>
    </form>
</div>

</body>
</html>
