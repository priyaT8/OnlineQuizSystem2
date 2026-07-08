package servlet;

import dao.StudentDAO;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if(request.getSession().getAttribute("admin") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));
        StudentDAO dao = new StudentDAO();
        dao.deleteStudent(id);
        response.sendRedirect("admindashboard.jsp?msg=Student deleted successfully!");
    }
}