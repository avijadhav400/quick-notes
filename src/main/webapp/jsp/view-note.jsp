<%@ page import="com.quicknotes.model.Note" %>

<html>
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
