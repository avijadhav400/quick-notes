<a href="<%=request.getContextPath()%>/add-note">Add New Note</a>
<hr/>

<%@ page import="com.quicknotes.model.*" %>
<%@ page import="java.util.*" %>

<h2>My Notes</h2>
<body>
<%
List<Note> notes = (List<Note>)request.getAttribute("notes");

if (notes != null && !notes.isEmpty()) {
for(Note n : notes){
%>
<p>
    <a href="<%=request.getContextPath()%>/view-note?id=<%=n.getNoteId()%>">
        <%= n.getTitle() %>
    </a>
     &nbsp;&nbsp;

        <a href="<%=request.getContextPath()%>/delete-note?id=<%=n.getNoteId()%>"
           onclick="return confirm('Are you sure you want to delete this note?');">
            Delete
        </a>
</p>

<%
}
}else{
%>
<p>Notes not available</p>
<%
}
%>
</body>