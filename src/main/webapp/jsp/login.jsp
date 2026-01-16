<!DOCTYPE html>
<html>
<head>
    <title>Login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <script>
        const params = new URLSearchParams(window.location.search);

        if (params.get("msg") === "loggedout") {
            alert("Logged out successfully!");
        }
    </script>
</head>

<body class="bg-light">

<div class="container">
<%
    String msg = request.getParameter("msg");
    if ("registered".equals(msg)) {
%>
    <div class="alert alert-success text-center">
        Registration successful. Please login.
    </div>
<%
    }
%>

    <div class="row justify-content-center mt-5">
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body">

                    <h4 class="text-center mb-3">Login</h4>

                    <form action="<%=request.getContextPath()%>/login" method="post">
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" required>

                            <label class="form-label mt-2">Password</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">
                            Login
                        </button>
                    </form>

                    <!-- Register Link -->
                    <div class="text-center mt-3">
                        <span class="text-muted">Don't have an account?</span>
                        <a href="<%=request.getContextPath()%>/register" class="text-decoration-none fw-semibold">
                            Register
                        </a>
                    </div>

                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger mt-3">
                            <%=request.getAttribute("error")%>
                        </div>
                    <% } %>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
