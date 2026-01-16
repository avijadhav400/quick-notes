<%
if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/login");
    return;
}
%>
<%@ page import="com.quicknotes.model.*" %>
<%@ page import="java.util.*" %>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
        const params = new URLSearchParams(window.location.search);
        if (params.get("msg") === "success") {
            alert("Logged in successfully!");
        }
        else if (params.get("msg") === "saved") {
           alert("Note saved successfully!");
        }
        else if (params.get("msg") === "deleted") {
            alert("Note deleted successfully!");
        }
        else if (params.get("msg") === "updated") {
            alert("Note updated successfully!");
        }

    </script>
</head>
<body><div class="container mt-4">

          <div class="d-flex justify-content-between align-items-center mb-3">
              <h3>My Notes</h3>
              <div>
                  <a href="<%=request.getContextPath()%>/add-note" class="btn btn-success btn-sm">Add Note</a>
                  <a href="<%=request.getContextPath()%>/logout" class="btn btn-outline-danger btn-sm">Logout</a>
              </div>
          </div>

          <div class="list-group">
              <%
              List<Note> notes = (List<Note>) request.getAttribute("notes");
              if(notes == null || notes.isEmpty()){
              %>
              <p>Notes not available</p>
              <%
              }else{
              for (Note n : notes) {
              %>
                  <div class="list-group-item">
                      <h5>
                          <a href="<%=request.getContextPath()%>/view-note?id=<%=n.getNoteId()%>"
                             class="text-decoration-none">
                              <%=n.getTitle()%>
                          </a>
                      </h5>

                      <div class="mt-2">
                          <a href="<%=request.getContextPath()%>/edit-note?id=<%=n.getNoteId()%>"
                             class="btn btn-sm btn-outline-primary">Edit</a>

                          <a href="<%=request.getContextPath()%>/delete-note?id=<%=n.getNoteId()%>"
                             class="btn btn-sm btn-outline-danger"
                             onclick="return confirm('Delete this note?')">Delete</a>
                      </div>
                  </div>
              <% }
               }
               %>
          </div>

      </div>

</body>
</html>