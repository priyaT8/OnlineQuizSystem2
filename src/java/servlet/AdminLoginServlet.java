/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import dao.AdminDAO;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AdminDAO dao = new AdminDAO();
        boolean valid = dao.validateAdmin(username, password);

        if (valid) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", username);
            response.sendRedirect("admindashboard.jsp");
        } else {
            response.sendRedirect("adminlogin.jsp?msg=Invalid Credentials");
        }
    }
}
