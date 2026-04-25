
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Select Paper - Quiz System</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { background: linear-gradient(135deg, #0f2027, #203a43, #2c5364); min-height: 100vh; display: flex; align-items: center; justify-content: center; font-family: 'Segoe UI', sans-serif; }
        .main-card { background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); border-radius: 25px; padding: 50px; text-align: center; border: 1px solid rgba(255,255,255,0.2); box-shadow: 0 25px 50px rgba(0,0,0,0.3); max-width: 700px; width: 90%; }
        h2 { color: white; font-weight: bold; margin-bottom: 10px; }
        .welcome { color: #a8d8ea; margin-bottom: 40px; font-size: 1.1rem; }
        .paper-card { background: rgba(255,255,255,0.95); border-radius: 20px; padding: 30px; margin: 15px; transition: transform 0.3s; cursor: pointer; }
        .paper-card:hover { transform: translateY(-10px); box-shadow: 0 20px 40px rgba(0,180,219,0.3); }
        .paper-icon { font-size: 3rem; margin-bottom: 15px; }
        .paper-title { font-size: 1.4rem; font-weight: bold; color: #0083b0; }
        .paper-desc { color: #666; margin: 10px 0; }
        .paper-id { background: linear-gradient(135deg, #00b4db, #0083b0); color: white; border-radius: 10px; padding: 5px 15px; display: inline-block; font-weight: bold; margin: 10px 0; }
        .btn-start { background: linear-gradient(135deg, #00b4db, #0083b0); border: none; border-radius: 25px; padding: 10px 30px; color: white; font-weight: bold; width: 100%; margin-top: 15px; }
        .btn-start:hover { opacity: 0.9; color: white; }
        .logout { color: #a8d8ea; text-decoration: none; margin-top: 20px; display: inline-block; }
        .logout:hover { color: white; }
    </style>
</head>
<body>
<%
    if(session.getAttribute("student") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String studentName = (String) session.getAttribute("studentName");
%>
<div class="main-card">
    <h2>👋 Welcome, <%= studentName %>!</h2>
    <p class="welcome">Select a subject to start your quiz</p>
    
    <div class="row">
        <div class="col-md-6">
            <div class="paper-card">
                <div class="paper-icon">☕</div>
                <div class="paper-title">Java Basics</div>
                <div class="paper-id">Paper ID: 1</div>
                <div class="paper-desc">Test your Java programming knowledge</div>
                <div class="paper-desc">📝 10 Questions | ⏱️ No Time Limit</div>
                <form action="QuizServlet" method="post">
                    <input type="hidden" name="paper_id" value="1">
                    <button type="submit" class="btn btn-start">Start Quiz →</button>
                </form>
            </div>
        </div>
        <div class="col-md-6">
            <div class="paper-card">
                <div class="paper-icon">🔢</div>
                <div class="paper-title">Mathematics</div>
                <div class="paper-id">Paper ID: 2</div>
                <div class="paper-desc">Test your mathematics knowledge</div>
                <div class="paper-desc">📝 10 Questions | ⏱️ No Time Limit</div>
                <form action="QuizServlet" method="post">
                    <input type="hidden" name="paper_id" value="2">
                    <button type="submit" class="btn btn-start">Start Quiz →</button>
                </form>
            </div>
        </div>
    </div>
    <div class="mt-3">
        <a href="LogoutServlet" class="logout">🚪 Logout</a>
    </div>
</div>
</body>
</html>