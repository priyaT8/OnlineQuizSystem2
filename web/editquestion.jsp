<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, db.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Question - Admin</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { background: linear-gradient(135deg, #0f2027, #203a43, #2c5364); min-height: 100vh; display: flex; align-items: center; justify-content: center; font-family: 'Segoe UI', sans-serif; padding: 30px 0; }
        .card { border-radius: 25px; border: none; box-shadow: 0 25px 50px rgba(0,0,0,0.3); width: 600px; overflow: hidden; }
        .card-header { background: linear-gradient(135deg, #00b4db, #0083b0); padding: 25px; text-align: center; }
        .card-header h3 { color: white; font-weight: bold; margin: 0; }
        .card-body { background: rgba(255,255,255,0.95); padding: 35px; }
        .form-control, .form-select { border-radius: 10px; border: 2px solid #e0e0e0; padding: 10px 15px; margin-bottom: 15px; width: 100%; }
        .btn-edit { background: linear-gradient(135deg, #00b4db, #0083b0); border: none; border-radius: 25px; width: 100%; padding: 12px; font-weight: bold; color: white; font-size: 1rem; cursor: pointer; }
        label { font-weight: 600; color: #333; margin-bottom: 5px; display: block; }
        a { color: #0083b0; }
    </style>
</head>
<body>
<%
    if(session.getAttribute("admin") == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
    int qid = Integer.parseInt(request.getParameter("id"));
    Connection con = DBConnection.getConnection();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM questions WHERE q_id=?");
    ps.setInt(1, qid);
    ResultSet rs = ps.executeQuery();
    rs.next();
%>
<div class="card">
    <div class="card-header">
        <h3>✏️ Edit Question</h3>
    </div>
    <div class="card-body">
        <form action="EditQuestionServlet" method="post">
            <input type="hidden" name="q_id" value="<%= rs.getInt("q_id") %>">
            
            <label>Select Paper</label>
            <select name="paper_id" class="form-select">
                <option value="1" <%= rs.getInt("paper_id")==1 ? "selected" : "" %>>Paper 1 - Java Basics</option>
                <option value="2" <%= rs.getInt("paper_id")==2 ? "selected" : "" %>>Paper 2 - Mathematics</option>
            </select>

            <label>Question Type</label>
            <select name="question_type" class="form-select">
                <option value="MCQ" <%= rs.getString("question_type").equals("MCQ") ? "selected" : "" %>>MCQ</option>
                <option value="TF" <%= rs.getString("question_type").equals("TF") ? "selected" : "" %>>True/False</option>
            </select>

            <label>Question</label>
            <textarea name="question" class="form-control" rows="3" required><%= rs.getString("question") %></textarea>

            <label>Option A</label>
            <input type="text" name="option_a" class="form-control" value="<%= rs.getString("option_a") %>" required>

            <label>Option B</label>
            <input type="text" name="option_b" class="form-control" value="<%= rs.getString("option_b") %>" required>

            <label>Option C</label>
            <input type="text" name="option_c" class="form-control" value="<%= rs.getString("option_c") != null ? rs.getString("option_c") : "" %>">

            <label>Option D</label>
            <input type="text" name="option_d" class="form-control" value="<%= rs.getString("option_d") != null ? rs.getString("option_d") : "" %>">

            <label>Correct Answer</label>
            <select name="correct_answer" class="form-select">
                <option value="A" <%= rs.getString("correct_answer").equals("A") ? "selected" : "" %>>A</option>
                <option value="B" <%= rs.getString("correct_answer").equals("B") ? "selected" : "" %>>B</option>
                <option value="C" <%= rs.getString("correct_answer").equals("C") ? "selected" : "" %>>C</option>
                <option value="D" <%= rs.getString("correct_answer").equals("D") ? "selected" : "" %>>D</option>
            </select>

            <br>
            <button type="submit" class="btn-edit">💾 Save Changes</button>
        </form>
        <div style="text-align:center;margin-top:15px;">
            <a href="admindashboard.jsp">← Back to Dashboard</a>
        </div>
    </div>
</div>
</body>
</html>