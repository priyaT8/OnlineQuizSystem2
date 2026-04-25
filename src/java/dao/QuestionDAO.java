/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import db.DBConnection;
import model.Question;
import java.sql.*;
import java.util.*;

public class QuestionDAO {

    public List<Question> getQuestionsByPaper(int paperId) {
        List<Question> list = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            String sql = "SELECT * FROM questions WHERE paper_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, paperId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Question q = new Question();
                q.setQId(rs.getInt("q_id"));
                q.setPaperId(rs.getInt("paper_id"));
                q.setQuestion(rs.getString("question"));
                q.setOptionA(rs.getString("option_a"));
                q.setOptionB(rs.getString("option_b"));
                q.setOptionC(rs.getString("option_c"));
                q.setOptionD(rs.getString("option_d"));
                q.setCorrectAnswer(rs.getString("correct_answer"));
                q.setQuestionType(rs.getString("question_type"));
                list.add(q);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }
}
