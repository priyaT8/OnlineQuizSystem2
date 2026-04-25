<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login - Quiz System</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { background: linear-gradient(135deg, #0f2027, #203a43, #2c5364); min-height: 100vh; display: flex; align-items: center; justify-content: center; font-family: 'Segoe UI', sans-serif; }
        .card { border-radius: 25px; border: none; box-shadow: 0 25px 50px rgba(0,0,0,0.3); width: 420px; overflow: hidden; }
        .card-header { background: linear-gradient(135deg, #f7971e, #ffd200); padding: 30px; text-align: center; }
        .card-header h3 { color: white; font-weight: bold; margin: 0; }
        .card-body { background: rgba(255,255,255,0.95); padding: 35px; }
        .form-control { border-radius: 10px; border: 2px solid #e0e0e0; padding: 10px 15px; }
        .form-control:focus { border-color: #f7971e; box-shadow: 0 0 0 0.2rem rgba(247,151,30,0.25); }
        .btn-admin { background: linear-gradient(135deg, #f7971e, #ffd200); border: none; border-radius: 25px; width: 100%; padding: 12px; font-weight: bold; color: white; font-size: 1rem; }
        .btn-admin:hover { opacity: 0.9; color: white; }
        label { font-weight: 600; color: #333; margin-bottom: 5px; }
        a { color: #f7971e; }
    </style>
</head>
<body>
<div class="card">
    <div class="card-header">
        <h3>⚙️ Admin Login</h3>
    </div>
    <div class="card-body">
        <% String msg = request.getParameter("msg");
           if(msg != null) { %>
            <div class="alert alert-danger"><%= msg %></div>
        <% } %>
        <form action="AdminLoginServlet" method="post">
            <div class="mb-3">
                <label>Username</label>
                <input type="text" name="username" class="form-control" placeholder="Enter admin username" required>
            </div>
            <div class="mb-3">
                <label>Password</label>
                <input type="password" name="password" class="form-control" placeholder="Enter admin password" required>
            </div>
            <button type="submit" class="btn btn-admin">Login as Admin</button>
        </form>
        <div class="text-center mt-3">
            <a href="index.jsp">← Back to Home</a>
        </div>
    </div>
</div>
</body>
</html>
