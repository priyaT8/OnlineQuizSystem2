package servlet;

import db.DBConnection;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/AddQuestionServlet")
public class AddQuestionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if(request.getSession().getAttribute("admin") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }

        int paperId = Integer.parseInt(request.getParameter("paper_id"));
        String questionType = request.getParameter("question_type");
        String question = request.getParameter("question");
        String optionA = request.getParameter("option_a");
        String optionB = request.getParameter("option_b");
        String optionC = request.getParameter("option_c");
        String optionD = request.getParameter("option_d");
        String correctAnswer = request.getParameter("correct_answer");

        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO questions (paper_id, question, option_a, option_b, option_c, option_d, correct_answer, question_type) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, paperId);
            ps.setString(2, question);
            ps.setString(3, optionA);
            ps.setString(4, optionB);
            ps.setString(5, questionType.equals("TF") ? null : optionC);
            ps.setString(6, questionType.equals("TF") ? null : optionD);
            ps.setString(7, correctAnswer);
            ps.setString(8, questionType);
            ps.executeUpdate();
            response.sendRedirect("addquestion.jsp?msg=Question added successfully!");
        } catch (Exception e) {
            response.sendRedirect("addquestion.jsp?msg=Error: " + e.getMessage());
        }
    }
}