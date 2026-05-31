<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Question" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz - Quiz System</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { background: linear-gradient(135deg, #0f2027, #203a43, #2c5364); min-height: 100vh; font-family: 'Segoe UI', sans-serif; padding: 30px 0; }
        .main-card { background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); border-radius: 25px; padding: 40px; border: 1px solid rgba(255,255,255,0.2); box-shadow: 0 25px 50px rgba(0,0,0,0.3); max-width: 800px; margin: 0 auto; }
        h2 { color: white; font-weight: bold; margin-bottom: 5px; }
        .subtitle { color: #a8d8ea; margin-bottom: 30px; }
        .question-card { background: rgba(255,255,255,0.95); border-radius: 15px; padding: 25px; margin-bottom: 20px; }
        .question-number { background: linear-gradient(135deg, #00b4db, #0083b0); color: white; border-radius: 50%; width: 35px; height: 35px; display: inline-flex; align-items: center; justify-content: center; font-weight: bold; margin-right: 10px; }
        .question-text { font-weight: 600; color: #333; font-size: 1.1rem; margin-bottom: 15px; }
        .option-label { display: block; background: #f8f9fa; border: 2px solid #e0e0e0; border-radius: 10px; padding: 10px 15px; margin-bottom: 8px; cursor: pointer; transition: all 0.2s; }
        .option-label:hover { border-color: #00b4db; background: #e8f7fc; }
        input[type="radio"] { margin-right: 10px; }
        .btn-submit { background: linear-gradient(135deg, #00b4db, #0083b0); border: none; border-radius: 25px; padding: 15px 50px; color: white; font-weight: bold; font-size: 1.1rem; width: 100%; margin-top: 20px; }
        .btn-submit:hover { opacity: 0.9; color: white; }
        .tf-badge { background: #e3f2fd; color: #0083b0; border-radius: 10px; padding: 3px 10px; font-size: 0.8rem; font-weight: bold; margin-left: 10px; }
        .timer-container { position: fixed; top: 20px; right: 20px; background: linear-gradient(135deg, #00b4db, #0083b0); border-radius: 15px; padding: 15px 25px; text-align: center; box-shadow: 0 10px 30px rgba(0,180,219,0.4); z-index: 1000; }
.timer-label { color: rgba(255,255,255,0.8); font-size: 0.8rem; display: block; }
.timer-display { color: white; font-size: 2rem; font-weight: bold; display: block; }
.timer-warning { background: linear-gradient(135deg, #ff9800, #ff5722) !important; }
.timer-danger { background: linear-gradient(135deg, #ff5252, #d32f2f) !important; animation: pulse 1s infinite; }
@keyframes pulse { 0% { transform: scale(1); } 50% { transform: scale(1.05); } 100% { transform: scale(1); } }
    
    </style>
</head>
<body>
<%
    if(session.getAttribute("student") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Question> questions = (List<Question>) session.getAttribute("questions");
    if(questions == null) {
        response.sendRedirect("selectpaper.jsp");
        return;
    }
    String studentName = (String) session.getAttribute("studentName");
%>
<div class="main-card">
    <h2>📝 Quiz Time!</h2>
    <p class="subtitle">Good luck, <%= studentName %>! Answer all questions below.</p>
    
    <form action="ResultServlet" method="post" id="quizForm">
        <% int qNum = 1; for(Question q : questions) { %>
        <div class="question-card">
            <div class="question-text">
                <span class="question-number"><%= qNum %></span>
                <%= q.getQuestion() %>
                <% if(q.getQuestionType().equals("TF")) { %>
                    <span class="tf-badge">True/False</span>
                <% } %>
            </div>
            <label class="option-label">
                <input type="radio" name="q<%= q.getQId() %>" value="A" required> A) <%= q.getOptionA() %>
            </label>
            <label class="option-label">
                <input type="radio" name="q<%= q.getQId() %>" value="B"> B) <%= q.getOptionB() %>
            </label>
            <% if(q.getQuestionType().equals("MCQ")) { %>
            <label class="option-label">
                <input type="radio" name="q<%= q.getQId() %>" value="C"> C) <%= q.getOptionC() %>
            </label>
            <label class="option-label">
                <input type="radio" name="q<%= q.getQId() %>" value="D"> D) <%= q.getOptionD() %>
            </label>
            <% } %>
        </div>
        <% qNum++; } %>
        <button type="submit" class="btn btn-submit">🏁 Submit Quiz</button>
    </form>
</div>
<div class="timer-container" id="timerBox">
    <span class="timer-label">⏱️ Time Remaining</span>
    <span class="timer-display" id="timerDisplay">10:00</span>
</div>

<script>
    var totalSeconds = 600; // 10 minutes
    var timerDisplay = document.getElementById('timerDisplay');
    var timerBox = document.getElementById('timerBox');
    var quizForm = document.getElementById('quizForm');

    var countdown = setInterval(function() {
        totalSeconds--;
        
        var minutes = Math.floor(totalSeconds / 60);
        var seconds = totalSeconds % 60;
        
        timerDisplay.textContent = 
            (minutes < 10 ? '0' : '') + minutes + ':' + 
            (seconds < 10 ? '0' : '') + seconds;
        
        // Warning at 3 minutes
        if(totalSeconds <= 180 && totalSeconds > 60) {
            timerBox.className = 'timer-container timer-warning';
        }
        
        // Danger at 1 minute
        if(totalSeconds <= 60) {
            timerBox.className = 'timer-container timer-danger';
        }
        
        // Auto submit when time runs out
        if(totalSeconds <= 0) {
            clearInterval(countdown);
            timerDisplay.textContent = '00:00';
            alert('⏰ Time is up! Your quiz is being submitted automatically!');
            document.getElementById('quizForm').submit();
        }
    }, 1000);
</script>
</body>
</html>