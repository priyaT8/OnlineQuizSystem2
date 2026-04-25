<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Online Quiz System</title>
    <link rel="stylesheet" href="bootstrap.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { background: linear-gradient(135deg, #0f2027, #203a43, #2c5364); min-height: 100vh; display: flex; align-items: center; justify-content: center; font-family: 'Segoe UI', sans-serif; }
        .hero-card { background: rgba(255,255,255,0.1); backdrop-filter: blur(10px); border-radius: 25px; padding: 60px 50px; text-align: center; border: 1px solid rgba(255,255,255,0.2); box-shadow: 0 25px 50px rgba(0,0,0,0.3); max-width: 600px; width: 90%; }
        h1 { color: white; font-size: 2.8rem; font-weight: bold; margin-bottom: 10px; }
        .subtitle { color: #a8d8ea; font-size: 1.1rem; margin-bottom: 40px; }
        .btn-ocean { background: linear-gradient(135deg, #00b4db, #0083b0); border: none; color: white; border-radius: 25px; padding: 12px 35px; font-weight: bold; font-size: 1rem; margin: 8px; transition: transform 0.2s; }
        .btn-ocean:hover { transform: translateY(-3px); color: white; box-shadow: 0 10px 20px rgba(0,180,219,0.4); }
        .btn-outline-ocean { background: transparent; border: 2px solid #00b4db; color: #00b4db; border-radius: 25px; padding: 12px 35px; font-weight: bold; font-size: 1rem; margin: 8px; transition: all 0.2s; }
        .btn-outline-ocean:hover { background: #00b4db; color: white; transform: translateY(-3px); }
        .emoji { font-size: 4rem; margin-bottom: 20px; }
        .features { display: flex; justify-content: center; gap: 30px; margin-top: 40px; flex-wrap: wrap; }
        .feature { color: #a8d8ea; text-align: center; }
        .feature span { font-size: 2rem; display: block; margin-bottom: 8px; }
    </style>
</head>
<body>
<div class="hero-card">
    <div class="emoji">🎯</div>
    <h1>Online Quiz System</h1>
    <p class="subtitle">Test your knowledge with interactive quizzes!</p>
    <div>
        <a href="login.jsp" class="btn btn-ocean">🎓 Student Login</a>
        <a href="register.jsp" class="btn btn-ocean">📝 Register</a>
        <a href="adminlogin.jsp" class="btn btn-outline-ocean">⚙️ Admin</a>
    </div>
    <div class="features">
        <div class="feature"><span>📚</span>2 Subjects</div>
        <div class="feature"><span>❓</span>10 Questions Each</div>
        <div class="feature"><span>🏆</span>Instant Results</div>
    </div>
</div>
</body>
</html>