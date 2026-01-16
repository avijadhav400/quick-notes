<!DOCTYPE html>
<html>
<head>
    <title>Register</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="bg-light">

<div class="container">
    <div class="row justify-content-center mt-5">
        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-body">

                    <h4 class="text-center mb-3">Register</h4>

                    <form action="<%=request.getContextPath()%>/register" method="post">

                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="username"
                                   class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email"
                                   class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password"
                                   class="form-control" required>
                        </div>

                        <button type="submit" class="btn btn-success w-100">
                            Register
                        </button>
                    </form>

                    <!-- Back to Login -->
                    <div class="text-center mt-3">
                        <span class="text-muted">Already have an account?</span>
                        <a href="<%=request.getContextPath()%>/login"
                           class="text-decoration-none fw-semibold">
                            Login
                        </a>
                    </div>

                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger mt-3">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>

                    <% if (request.getAttribute("success") != null) { %>
                        <div class="alert alert-success mt-3">
                            <%= request.getAttribute("success") %>
                        </div>
                    <% } %>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
