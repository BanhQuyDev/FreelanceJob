/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package feedbacks;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class FeedbackDAO {

    private final String INSERT_FEEDBACK = "INSERT INTO tblFeedback(content, rating, id_freelancer, id_employer, status) VALUES(?, ?, ?, ?, 1)";

    public boolean createFeedback(String content, int rating, int id_freelancer, int id_employer) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_FEEDBACK);
                ptm.setString(1, content);
                ptm.setInt(2, rating);
                ptm.setInt(3, id_freelancer);
                ptm.setInt(4, id_employer);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }
}
