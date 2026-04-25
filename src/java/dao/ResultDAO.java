/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import db.DBConnection;
import model.Result;
import java.sql.*;

public class ResultDAO {

    public boolean saveResult(Result r) {
        try {
            Connection con = DBConnection.getConnection();
            String sql = "INSERT INTO results (student_id, paper_id, score, total) VALUES (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, r.getStudentId());
            ps.setInt(2, r.getPaperId());
            ps.setInt(3, r.getScore());
            ps.setInt(4, r.getTotal());
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
}
