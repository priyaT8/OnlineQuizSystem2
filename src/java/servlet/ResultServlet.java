/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import dao.ResultDAO;
import model.Question;
import model.Result;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/ResultServlet")
public class ResultServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        List<Question> questions = (List<Question>) session.getAttribute("questions");
        int paperId = (int) session.getAttribute("paperId");
        int studentId = (int) session.getAttribute("studentId");

        int score = 0;
        int total = questions.size();

        for (Question q : questions) {
            String submitted = request.getParameter("q" + q.getQId());
            if (submitted != null && submitted.equalsIgnoreCase(q.getCorrectAnswer())) {
                score++;
            }
        }

        Result r = new Result();
        r.setStudentId(studentId);
        r.setPaperId(paperId);
        r.setScore(score);
        r.setTotal(total);

        ResultDAO dao = new ResultDAO();
        dao.saveResult(r);

        session.setAttribute("score", score);
        session.setAttribute("total", total);

        response.sendRedirect("result.jsp");
    }
}
