package notifications;

import utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class NotificationDAO {

    private final String CREATE_NOTIFICATION = "INSERT INTO tblNotification(id_user, content, id_status)\n" +
            "VALUES(?,?,?)";

    public boolean createNotification(NotificationDTO noti) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_NOTIFICATION);
                ptm.setInt(1, noti.getId_user());
                ptm.setString(2, noti.getContent());
                ptm.setInt(3, noti.getId_status());
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
