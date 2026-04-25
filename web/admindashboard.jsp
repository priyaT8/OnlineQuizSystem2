<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, db.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Quiz System</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { background: linear-gradient(135deg, #0f2027, #203a43, #2c5364); min-height: 100vh; font-family: 'Segoe UI', sans-serif; padding: 30px 0; }
        .main-card { background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); border-radius: 25px; padding: 40px; border: 1px solid rgba(255,255,255,0.2); box-shadow: 0 25px 50px rgba(0,0,0,0.3); max-width: 1000px; margin: 0 auto; }
        h2 { color: white; font-weight: bold; margin-bottom: 5px; }
        .subtitle { color: #a8d8ea; margin-bottom: 30px; }
        .stat-card { background: rgba(255,255,255,0.95); border-radius: 15px; padding: 25px 15px; text-align: center; margin-bottom: 20px; }
        .stat-number { font-size: 2.5rem; font-weight: bold; color: #0083b0; display: block; }
        .stat-label { color: #666; font-size: 0.9rem; display: block; margin-top: 5px; }
        .table-card { background: rgba(255,255,255,0.95); border-radius: 15px; padding: 25px; margin-bottom: 20px; overflow-x: auto; }
        .table-card h5 { color: #0083b0; font-weight: bold; margin-bottom: 15px; }
        table { width: 100%; border-collapse: collapse; }
        th { background: linear-gradient(135deg, #00b4db, #0083b0); color: white; padding: 10px; text-align: left; }
        td { padding: 10px; border-bottom: 1px solid #eee; color: #333; }
        tr:hover td { background: #e8f7fc; }
        .btn-logout { background: linear-gradient(135deg, #f7971e, #ffd200); border: none; border-radius: 25px; padding: 10px 30px; color: white; font-weight: bold; }
        .badge-java { background: #e3f2fd; color: #0083b0; border-radius: 10px; padding: 3px 10px; font-size: 0.8rem; }
        .badge-math { background: #e8f5e9; color: #2e7d32; border-radius: 10px; padding: 3px 10px; font-size: 0.8rem; }
    </style>
</head>
<body>
<%
    if(session.getAttribute("admin") == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>
<div class="main-card">
    <h2>⚙️ Admin Dashboard</h2>
    <p class="subtitle">Welcome Admin! Here's an overview of the quiz system.</p>

    <%
        Connection con = DBConnection.getConnection();
        
        PreparedStatement ps1 = con.prepareStatement("SELECT COUNT(*) FROM students");
        ResultSet rs1 = ps1.executeQuery();
        rs1.next();
        int totalStudents = rs1.getInt(1);
        
        PreparedStatement ps2 = con.prepareStatement("SELECT COUNT(*) FROM questions");
        ResultSet rs2 = ps2.executeQuery();
        rs2.next();
        int totalQuestions = rs2.getInt(1);
        
        PreparedStatement ps3 = con.prepareStatement("SELECT COUNT(*) FROM results");
        ResultSet rs3 = ps3.executeQuery();
        rs3.next();
        int totalAttempts = rs3.getInt(1);
    %>

    <div class="row mb-4">
        <div class="col-md-4">
            <div class="stat-card">
                <span class="stat-number">👥 <%= totalStudents %></span>
                <span class="stat-label">Total Students</span>
            </div>
        </div>
        <div class="col-md-4">
            <div class="stat-card">
                <span class="stat-number">❓ <%= totalQuestions %></span>
                <span class="stat-label">Total Questions</span>
            </div>
        </div>
        <div class="col-md-4">
            <div class="stat-card">
                <span class="stat-number">📝 <%= totalAttempts %></span>
                <span class="stat-label">Total Attempts</span>
            </div>
        </div>
    </div>

    <div class="table-card">
        <h5>👥 Registered Students</h5>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Username</th>
            </tr>
            <%
                PreparedStatement ps4 = con.prepareStatement("SELECT * FROM students");
                ResultSet rs4 = ps4.executeQuery();
                while(rs4.next()) {
            %>
            <tr>
                <td><%= rs4.getInt("id") %></td>
                <td><%= rs4.getString("name") %></td>
                <td><%= rs4.getString("email") %></td>
                <td><%= rs4.getString("username") %></td>
            </tr>
            <% } %>
        </table>
    </div>

    <div class="table-card">
        <h5>🏆 Quiz Results</h5>
        <table>
            <tr>
                <th>Student</th>
                <th>Subject</th>
                <th>Score</th>
                <th>Date</th>
            </tr>
            <%
                PreparedStatement ps5 = con.prepareStatement(
                    "SELECT s.name, qp.paper_name, r.score, r.total, r.attempt_date " +
                    "FROM results r JOIN students s ON r.student_id = s.id " +
                    "JOIN question_paper qp ON r.paper_id = qp.paper_id " +
                    "ORDER BY r.attempt_date DESC");
                ResultSet rs5 = ps5.executeQuery();
                while(rs5.next()) {
                    String paperName = rs5.getString("paper_name");
            %>
            <tr>
                <td><%= rs5.getString("name") %></td>
                <td>
                    <span class="<%= paperName.equals("Java Basics") ? "badge-java" : "badge-math" %>">
                        <%= paperName %>
                    </span>
                </td>
                <td><strong><%= rs5.getInt("score") %>/<%= rs5.getInt("total") %></strong></td>
                <td><%= rs5.getTimestamp("attempt_date") %></td>
            </tr>
            <% } %>
        </table>
    </div>

    <div class="text-center mt-3">
        <a href="LogoutServlet" class="btn btn-logout">🚪 Logout</a>
    </div>
</div>
</body>
</html>