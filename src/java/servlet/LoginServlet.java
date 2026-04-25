/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import dao.StudentDAO;
import model.Student;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        StudentDAO dao = new StudentDAO();
        Student s = dao.loginStudent(username, password);

        if (s != null) {
            HttpSession session = request.getSession();
            session.setAttribute("student", s);
            session.setAttribute("studentId", s.getId());
            session.setAttribute("studentName", s.getName());
            response.sendRedirect("selectpaper.jsp");
        } else {
            response.sendRedirect("login.jsp?msg=Invalid Username or Password");
        }
    }
}
