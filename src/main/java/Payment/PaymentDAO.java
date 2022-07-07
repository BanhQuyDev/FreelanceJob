/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

/**
 *
 * @author QUANG HUY
 */
public class PaymentDAO {

    private static final String UPDATE_STATUS_PAYMENT = "  UPDATE tblJob SET payment_status = 1 WHERE id_job = ?";
    private static final String GET_STATUS = " SELECT payment_status FROM tblJob WHERE id_job = ?";

    public boolean updateStatusPayment(int idJob) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_STATUS_PAYMENT);
                ptm.setInt(1, idJob);
                int value = ptm.executeUpdate();
                result = value > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return result;
    }

    public int checkStatusPayment(int idJob) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int check = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_STATUS);
                ptm.setInt(1, idJob);
                rs = ptm.executeQuery();
                if(rs.next()) {
                    int payment_status = rs.getInt("payment_status");
                    check = payment_status;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return check;
    }
}
