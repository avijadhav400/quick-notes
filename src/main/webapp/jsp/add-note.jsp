<!DOCTYPE html>
<html>
<head>
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
<body>

<h2>Add Note</h2>

<form action="<%=request.getContextPath()%>/add-note" method="post">
    Title:<br/>
    <input type="text" name="title" required /><br/><br/>

    Content:<br/>
    <textarea name="content" rows="8" cols="40" required></textarea><br/><br/>

    <input type="submit" value="Save Note"/>
</form>

</body>
</html>
