<!-- Page developed by Debasmita Das -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Result - Quiz System</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { background: linear-gradient(135deg, #0f2027, #203a43, #2c5364); min-height: 100vh; display: flex; align-items: center; justify-content: center; font-family: 'Segoe UI', sans-serif; }
        .card { background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); border-radius: 25px; padding: 50px; text-align: center; border: 1px solid rgba(255,255,255,0.2); box-shadow: 0 25px 50px rgba(0,0,0,0.3); max-width: 550px; width: 90%; }
        .score-circle { width: 180px; height: 180px; border-radius: 50%; background: linear-gradient(135deg, #00b4db, #0083b0); display: flex; align-items: center; justify-content: center; margin: 0 auto 30px; box-shadow: 0 10px 30px rgba(0,180,219,0.4); }
        .score-text { color: white; font-size: 3rem; font-weight: bold; }
        .score-label { color: white; font-size: 1rem; }
        .message { font-size: 1.8rem; font-weight: bold; margin: 20px 0; }
        .name-msg { font-size: 1.1rem; color: #a8d8ea; margin-bottom: 30px; }
        .btn-again { background: linear-gradient(135deg, #00b4db, #0083b0); border: none; border-radius: 25px; padding: 12px 35px; color: white; font-weight: bold; margin: 8px; }
        .btn-logout { background: transparent; border: 2px solid #a8d8ea; border-radius: 25px; padding: 12px 35px; color: #a8d8ea; font-weight: bold; margin: 8px; }
        .btn-logout:hover { background: #a8d8ea; color: #0f2027; }
    </style>
</head>
<body>
<%
    if(session.getAttribute("student") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    int score = (int) session.getAttribute("score");
    int total = (int) session.getAttribute("total");
    String studentName = (String) session.getAttribute("studentName");
    
    String emoji = "";
    String message = "";
    String color = "";
    
    double percentage = (double) score / total * 100;
    
    if(percentage == 100) {
        emoji = "🏆";
        message = "PERFECT SCORE!";
        color = "#ffd700";
    } else if(percentage >= 70) {
        emoji = "🎉";
        message = "GREAT SCORE!";
        color = "#00e676";
    } else if(percentage >= 50) {
        emoji = "👍";
        message = "GOOD EFFORT!";
        color = "#00b4db";
    } else if(percentage >= 30) {
        emoji = "😐";
        message = "NEEDS IMPROVEMENT!";
        color = "#ff9800";
    } else {
        emoji = "😢";
        message = "BETTER LUCK NEXT TIME!";
        color = "#ff5252";
    }
%>
<div class="card">
    <div class="score-circle">
        <div>
            <div class="score-text"><%= score %>/<%= total %></div>
            
        </div>
    </div>
    
    <div class="message" style="color: <%= color %>"><%= emoji %> <%= message %></div>
    <div class="name-msg"><%= studentName.toUpperCase() %>! 🌟</div>
    
    <p style="color: #a8d8ea; margin-bottom: 25px;">
        You scored <strong style="color:white"><%= score %></strong> out of 
        <strong style="color:white"><%= total %></strong> questions correctly!
    </p>
    
    <a href="selectpaper.jsp" class="btn btn-again">🔄 Try Another Quiz</a>
    <a href="LogoutServlet" class="btn btn-logout">🚪 Logout</a>
</div>
</body>
</html>
