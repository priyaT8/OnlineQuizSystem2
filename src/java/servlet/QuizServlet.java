/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import dao.QuestionDAO;
import model.Question;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/QuizServlet")
public class QuizServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int paperId = Integer.parseInt(request.getParameter("paper_id"));

        QuestionDAO dao = new QuestionDAO();
        List<Question> questions = dao.getQuestionsByPaper(paperId);

        HttpSession session = request.getSession();
        session.setAttribute("questions", questions);
        session.setAttribute("paperId", paperId);

        response.sendRedirect("quiz.jsp");
    }
}