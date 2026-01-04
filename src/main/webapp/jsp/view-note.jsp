<%
if (session.getAttribute("user") == null) {
    response.sendRedirect(request.getContextPath() + "/login");
    return;
}
%>

<%@ page import="com.quicknotes.model.Note" %>

<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<%
Note note = (Note) request.getAttribute("note");
%>

<h2><%= note.getTitle() %></h2>

<div style="border:1px solid #ccc; padding:10px;">
    <%= note.getContent() %>
</div>

<br/>
<a href="<%=request.getContextPath()%>/edit-note?id=<%=note.getNoteId()%>">
    Edit
</a>
&nbsp;&nbsp;
<a href="<%=request.getContextPath()%>/notes">Back</a>


</body>
</html>
