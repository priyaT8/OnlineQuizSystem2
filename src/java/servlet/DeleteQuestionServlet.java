package servlet;

import db.DBConnection;
import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/DeleteQuestionServlet")
public class DeleteQuestionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if(request.getSession().getAttribute("admin") == null) {
            response.sendRedirect("adminlogin.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));

        try {
            Connection con = DBConnection.getConnection();
            String sql = "DELETE FROM questions WHERE q_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            response.sendRedirect("admindashboard.jsp?msg=Question deleted successfully!");
        } catch (Exception e) {
            response.sendRedirect("admindashboard.jsp?msg=Error: " + e.getMessage());
        }
    }
}