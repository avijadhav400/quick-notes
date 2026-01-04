<%
if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/login");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <title>Add Note</title>

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
<body><div class="container mt-4">
          <h3>Add Note</h3>

          <form action="<%=request.getContextPath()%>/add-note" method="post"
                onsubmit="tinymce.triggerSave();">

              <div class="mb-3">
                  <label class="form-label">Title</label>
                  <input type="text" name="title" class="form-control" required>
              </div>

              <div class="mb-3">
                  <label class="form-label">Content</label>
                  <textarea name="content"></textarea>
              </div>

              <button type="submit" class="btn btn-primary">Save</button>
              <a href="<%=request.getContextPath()%>/notes" class="btn btn-secondary">Cancel</a>
          </form>
      </div>

</body>
</html>
