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

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Student s = new Student();
        s.setName(name);
        s.setEmail(email);
        s.setUsername(username);
        s.setPassword(password);

        StudentDAO dao = new StudentDAO();
        boolean success = dao.registerStudent(s);

        if (success) {
            response.sendRedirect("login.jsp?msg=Registration Successful! Please Login");
        } else {
            response.sendRedirect("register.jsp?msg=Registration Failed! Try Again");
        }
    }
}
