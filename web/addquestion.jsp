<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Question - Admin</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { background: linear-gradient(135deg, #0f2027, #203a43, #2c5364); min-height: 100vh; display: flex; align-items: center; justify-content: center; font-family: 'Segoe UI', sans-serif; padding: 30px 0; }
        .card { border-radius: 25px; border: none; box-shadow: 0 25px 50px rgba(0,0,0,0.3); width: 600px; overflow: hidden; }
        .card-header { background: linear-gradient(135deg, #f7971e, #ffd200); padding: 25px; text-align: center; }
        .card-header h3 { color: white; font-weight: bold; margin: 0; }
        .card-body { background: rgba(255,255,255,0.95); padding: 35px; }
        .form-control, .form-select { border-radius: 10px; border: 2px solid #e0e0e0; padding: 10px 15px; margin-bottom: 15px; width: 100%; }
        .form-control:focus { border-color: #f7971e; outline: none; }
        .btn-add { background: linear-gradient(135deg, #f7971e, #ffd200); border: none; border-radius: 25px; width: 100%; padding: 12px; font-weight: bold; color: white; font-size: 1rem; cursor: pointer; }
        label { font-weight: 600; color: #333; margin-bottom: 5px; display: block; }
        a { color: #f7971e; }
    </style>
</head>
<body>
<%
    if(session.getAttribute("admin") == null) {
        response.sendRedirect("adminlogin.jsp");
        return;
    }
%>
<div class="card">
    <div class="card-header">
        <h3>➕ Add New Question</h3>
    </div>
    <div class="card-body">
        <% String msg = request.getParameter("msg");
           if(msg != null) { %>
            <div style="background:#d4edda;color:#155724;padding:10px;border-radius:10px;margin-bottom:15px;"><%= msg %></div>
        <% } %>
        <form action="AddQuestionServlet" method="post">
            <label>Select Paper</label>
            <select name="paper_id" class="form-select">
                <option value="1">Paper 1 - Java Basics</option>
                <option value="2">Paper 2 - Mathematics</option>
            </select>

            <label>Question Type</label>
            <select name="question_type" class="form-select" id="qtype" onchange="toggleOptions()">
                <option value="MCQ">Multiple Choice (MCQ)</option>
                <option value="TF">True/False</option>
            </select>

            <label>Question</label>
            <textarea name="question" class="form-control" rows="3" placeholder="Enter question here" required></textarea>

            <label>Option A</label>
            <input type="text" name="option_a" class="form-control" placeholder="Option A" required>

            <label>Option B</label>
            <input type="text" name="option_b" class="form-control" placeholder="Option B" required>

            <div id="mcqOptions">
                <label>Option C</label>
                <input type="text" name="option_c" class="form-control" placeholder="Option C">

                <label>Option D</label>
                <input type="text" name="option_d" class="form-control" placeholder="Option D">
            </div>

            <label>Correct Answer</label>
            <select name="correct_answer" class="form-select">
                <option value="A">A</option>
                <option value="B">B</option>
                <option value="C">C</option>
                <option value="D">D</option>
            </select>

            <br>
            <button type="submit" class="btn-add">➕ Add Question</button>
        </form>
        <div style="text-align:center;margin-top:15px;">
            <a href="admindashboard.jsp">← Back to Dashboard</a>
        </div>
    </div>
</div>
<script>
function toggleOptions() {
    var qtype = document.getElementById('qtype').value;
    document.getElementById('mcqOptions').style.display = qtype === 'TF' ? 'none' : 'block';
}
</script>
</body>
</html>