/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package feedbacks;

import contracts.ContractDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class FeedbackDAO {

    private final String INSERT_FEEDBACK = "INSERT INTO tblFeedback(content, rating, id_freelancer, id_employer, status) VALUES(?, ?, ?, ?, 1)";
    private final String GET_TOP_4_FREELANCER = "SELECT TOP 4 U.id_user, U.fullname, U.avatar, (SUM(F.rating)/COUNT(F.rating)) avgRating FROM tblFeedback F, tblFreelancer Fe, tblUser U \n"
            + "WHERE Fe.id_freelancer = F.id_freelancer AND Fe.id_freelancer = U.id_user GROUP BY U.id_user, U.fullname, U.avatar ORDER BY SUM(F.rating) / COUNT(F.rating) DESC";
    private final String GET_BALANCE_USER = "SELECT balance FROM tblUser U WHERE u.id_user = ?";

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

    public List<FeedbackDTO> getTop4Freelancer() throws SQLException {
        List<FeedbackDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        ContractDAO contractDao = new ContractDAO();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_TOP_4_FREELANCER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_user = rs.getInt("id_user");
                    String fullname = rs.getString("fullname");
                    String avatar = rs.getString("avatar");
                    int avgRating = rs.getInt("avgRating");
                    int countJobDone = contractDao.countJobDone(id_user);
                    list.add(new FeedbackDTO(avgRating, fullname, avatar, countJobDone));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }

    public boolean tranferMoneyForFreelancer(int id_freelancer, double priceProject) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        boolean check = false;
        double priceCurrent = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_BALANCE_USER);
                ptm.setInt(1, id_freelancer);
                rs = ptm.executeQuery();
                if (rs.next()) {
                   priceCurrent = rs.getDouble("balance");
                }
                double newBalance = priceCurrent + priceProject;
                if(updateBalance(id_freelancer, newBalance)){
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return check;
    }

    public boolean updateBalance(int id, double newBalance) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE tblUser\n"
                + "SET balance = ?\n"
                + "WHERE id_user = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setDouble(1, newBalance);
                ptm.setInt(2, id);
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
