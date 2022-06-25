package notifications;

import utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NotificationDAO {

    private final String CREATE_NOTIFICATION = "INSERT INTO [dbo].[tblNotification]\n"
            + "                   ([id_user]\n"
            + "                 ,[content]\n"
            + "                 ,[id_status]\n"
            + "                ,[id_sender])\n"
            + "              VALUES (?,?,?,?)";

    public boolean createNotification(int id, String content, int status, int id_sender) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_NOTIFICATION);
                ptm.setInt(1, id);
                ptm.setString(2, content);
                ptm.setInt(3, status);
                ptm.setInt(4, id_sender);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }

    public boolean createNotificationV2(int id, String content, int status, int id_sender, int mode) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "INSERT INTO [dbo].[tblNotification]\n"
                + "                   ([id_user]\n"
                + "                 ,[content]\n"
                + "                 ,[id_status]\n"
                + "                 ,[id_mode]\n"
                + "                ,[id_sender])\n"
                + "              VALUES (?,?,?,?,?)";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.setString(2, content);
                ptm.setInt(3, status);
                ptm.setInt(4, mode);
                ptm.setInt(5, id_sender);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }

    public boolean addANotificationApprove(int id_freelancer, String title, int id) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "INSERT INTO [dbo].[tblNotification]\n"
                + "           ([id_user]\n"
                + "           ,[content]\n"
                + "           ,[id_status]\n"
                + "           ,[id_sender]\n"
                + "           ,[id_mode])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id_freelancer);
                ptm.setString(2, "approved a job " + title);
                ptm.setInt(3, 3);
                ptm.setInt(4, id);
                ptm.setInt(5, 1);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }

    public void addANotificationDeny(int id_freelancer, String title, int id) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "INSERT INTO [dbo].[tblNotification]\n"
                + "           ([id_user]\n"
                + "           ,[content]\n"
                + "           ,[id_status]\n"
                + "           ,[id_sender]\n"
                + "           ,[id_mode])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id_freelancer);
                ptm.setString(2, "rejected a job " + title);
                ptm.setInt(3, 3);
                ptm.setInt(4, id);
                ptm.setInt(5, 1);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
    }

    public List<NotificationDTO> showAllNotificationFreelancerUnread(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<NotificationDTO> list = new ArrayList<>();
        String sql = "SELECT tblUser.fullname,tblUser.avatar, A.content, A.id_noti, timeAgo = case when years > 0 then concat(years,' years ago') else \n"
                + "                 case when months  > 0 then concat(months,' months ago') else\n"
                + "                 case when days    > 0 then concat(days,' days ago') else\n"
                + "                 case when hours   > 0 then concat(hours,' hours ago') else\n"
                + "                 case when minutes > 0 then concat(minutes,' minutes ago') else \n"
                + "                 case when seconds > 0 then concat(seconds,' seconds ago') else 'just now'\n"
                + "                 end end end end end end\n"
                + "                FROM tblUser INNER JOIN tblNotification A ON A.id_sender = tblUser.id_user\n"
                + "				 Cross Apply [dbo].[tvf-Date-Elapsed] ( A.create_date,GetDate()) B\n"
                + "                WHERE A.id_status = 3 AND A.id_user = ? AND A.id_mode = 1 ORDER BY A.create_date DESC";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String employerName = rs.getString("fullname");
                    String avatar = rs.getString("avatar");
                    String content = rs.getString("content");
                    int id_noti = rs.getInt("id_noti");
                    String timeAgo = rs.getString("timeAgo");
                    list.add(new NotificationDTO(id_noti, id, content, employerName, avatar, timeAgo));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }

    public List<NotificationDTO> showAllNotificationAdminUnread(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<NotificationDTO> list = new ArrayList<>();
        String sql = "SELECT tblUser.fullname,tblUser.avatar, A.content, A.id_noti, timeAgo = case when years > 0 then concat(years,' years ago') else \n"
                + "                 case when months  > 0 then concat(months,' months ago') else\n"
                + "                 case when days    > 0 then concat(days,' days ago') else\n"
                + "                 case when hours   > 0 then concat(hours,' hours ago') else\n"
                + "                 case when minutes > 0 then concat(minutes,' minutes ago') else \n"
                + "                 case when seconds > 0 then concat(seconds,' seconds ago') else 'just now'\n"
                + "                 end end end end end end\n"
                + "                FROM tblUser INNER JOIN tblNotification A ON A.id_sender = tblUser.id_user\n"
                + "				 Cross Apply [dbo].[tvf-Date-Elapsed] ( A.create_date,GetDate()) B\n"
                + "                WHERE A.id_status = 3 AND A.id_user = ? ORDER BY A.create_date DESC";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String employerName = rs.getString("fullname");
                    String avatar = rs.getString("avatar");
                    String content = rs.getString("content");
                    int id_noti = rs.getInt("id_noti");
                    String timeAgo = rs.getString("timeAgo");
                    list.add(new NotificationDTO(id_noti, id, content, employerName, avatar, timeAgo));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }

    public List<NotificationDTO> showAllNotificationEmployerUnread(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<NotificationDTO> list = new ArrayList<>();
        String sql = "SELECT tblUser.fullname,tblUser.avatar, A.content, A.id_noti, timeAgo = case when years > 0 then concat(years,' years ago') else \n"
                + "                 case when months  > 0 then concat(months,' months ago') else\n"
                + "                 case when days    > 0 then concat(days,' days ago') else\n"
                + "                 case when hours   > 0 then concat(hours,' hours ago') else\n"
                + "                 case when minutes > 0 then concat(minutes,' minutes ago') else \n"
                + "                 case when seconds > 0 then concat(seconds,' seconds ago') else 'just now'\n"
                + "                 end end end end end end\n"
                + "                FROM tblUser INNER JOIN tblNotification A ON A.id_sender = tblUser.id_user\n"
                + "				 Cross Apply [dbo].[tvf-Date-Elapsed] ( A.create_date,GetDate()) B\n"
                + "                WHERE A.id_status = 3 AND A.id_user = ? AND A.id_mode = 2 ORDER BY A.create_date DESC";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String employerName = rs.getString("fullname");
                    String avatar = rs.getString("avatar");
                    String content = rs.getString("content");
                    int id_noti = rs.getInt("id_noti");
                    String timeAgo = rs.getString("timeAgo");
                    list.add(new NotificationDTO(id_noti, id, content, employerName, avatar, timeAgo));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }

    public List<NotificationDTO> showAllNotificationFreelancerRead(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<NotificationDTO> list = new ArrayList<>();
        String sql = "SELECT tblUser.fullname,tblUser.avatar, A.content, A.id_noti, timeAgo = case when years > 0 then concat(years,' years ago') else \n"
                + "                 case when months  > 0 then concat(months,' months ago') else\n"
                + "                 case when days    > 0 then concat(days,' days ago') else\n"
                + "                 case when hours   > 0 then concat(hours,' hours ago') else\n"
                + "                 case when minutes > 0 then concat(minutes,' minutes ago') else \n"
                + "                 case when seconds > 0 then concat(seconds,' seconds ago') else 'just now'\n"
                + "                 end end end end end end\n"
                + "                FROM tblUser INNER JOIN tblNotification A ON A.id_sender = tblUser.id_user\n"
                + "				 Cross Apply [dbo].[tvf-Date-Elapsed] ( A.create_date,GetDate()) B\n"
                + "                WHERE A.id_status = 2 AND A.id_user = ? AND A.id_mode = 1 ORDER BY A.create_date DESC";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String employerName = rs.getString("fullname");
                    String avatar = rs.getString("avatar");
                    String content = rs.getString("content");
                    int id_noti = rs.getInt("id_noti");
                    String timeAgo = rs.getString("timeAgo");
                    list.add(new NotificationDTO(id_noti, id, content, employerName, avatar, timeAgo));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }

    public List<NotificationDTO> showAllNotificationAdminRead(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<NotificationDTO> list = new ArrayList<>();
        String sql = "SELECT tblUser.fullname,tblUser.avatar, A.content, A.id_noti, timeAgo = case when years > 0 then concat(years,' years ago') else \n"
                + "                 case when months  > 0 then concat(months,' months ago') else\n"
                + "                 case when days    > 0 then concat(days,' days ago') else\n"
                + "                 case when hours   > 0 then concat(hours,' hours ago') else\n"
                + "                 case when minutes > 0 then concat(minutes,' minutes ago') else \n"
                + "                 case when seconds > 0 then concat(seconds,' seconds ago') else 'just now'\n"
                + "                 end end end end end end\n"
                + "                FROM tblUser INNER JOIN tblNotification A ON A.id_sender = tblUser.id_user\n"
                + "				 Cross Apply [dbo].[tvf-Date-Elapsed] ( A.create_date,GetDate()) B\n"
                + "                WHERE A.id_status = 1 AND A.id_user = ? ORDER BY A.create_date DESC";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String employerName = rs.getString("fullname");
                    String avatar = rs.getString("avatar");
                    String content = rs.getString("content");
                    int id_noti = rs.getInt("id_noti");
                    String timeAgo = rs.getString("timeAgo");
                    list.add(new NotificationDTO(id_noti, id, content, employerName, avatar, timeAgo));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }

    public List<NotificationDTO> showAllNotificationEmployerRead(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<NotificationDTO> list = new ArrayList<>();
        String sql = "SELECT tblUser.fullname,tblUser.avatar, A.content, A.id_noti, timeAgo = case when years > 0 then concat(years,' years ago') else \n"
                + "                 case when months  > 0 then concat(months,' months ago') else\n"
                + "                 case when days    > 0 then concat(days,' days ago') else\n"
                + "                 case when hours   > 0 then concat(hours,' hours ago') else\n"
                + "                 case when minutes > 0 then concat(minutes,' minutes ago') else \n"
                + "                 case when seconds > 0 then concat(seconds,' seconds ago') else 'just now'\n"
                + "                 end end end end end end\n"
                + "                FROM tblUser INNER JOIN tblNotification A ON A.id_sender = tblUser.id_user\n"
                + "				 Cross Apply [dbo].[tvf-Date-Elapsed] ( A.create_date,GetDate()) B\n"
                + "                WHERE A.id_status = 2 AND A.id_user = ? AND A.id_mode = 2 ORDER BY A.create_date DESC";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String employerName = rs.getString("fullname");
                    String avatar = rs.getString("avatar");
                    String content = rs.getString("content");
                    int id_noti = rs.getInt("id_noti");
                    String timeAgo = rs.getString("timeAgo");
                    list.add(new NotificationDTO(id_noti, id, content, employerName, avatar, timeAgo));
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }

    public boolean addANotificationApply(int id, String title, int id_employer) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "INSERT INTO [dbo].[tblNotification]\n"
                + "           ([id_user]\n"
                + "           ,[content]\n"
                + "           ,[id_status]\n"
                + "           ,[id_sender]\n"
                + "           ,[id_mode])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id_employer);
                ptm.setString(2, "applied a the job " + title);
                ptm.setInt(3, 3);
                ptm.setInt(4, id);
                ptm.setInt(5, 2);
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }

    public boolean setStatus(int parseInt) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE [dbo].[tblNotification]\n"
                + "   SET [id_status] = 2\n"
                + " WHERE id_noti = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, parseInt);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }

    public void setStatusV2(int parseInt) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE [dbo].[tblNotification]\n"
                + "   SET [id_status] = 2\n"
                + " WHERE id_noti = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, parseInt);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
    }

    public void setAllStatus(int id, int id_mode, int status) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE [dbo].[tblNotification]\n"
                + "   SET [id_status] = 2\n"
                + " WHERE [tblNotification].id_user = ? AND tblNotification.id_mode = ? AND tblNotification.id_status = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.setInt(2, id_mode);
                ptm.setInt(3, status);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
    }

    public void setAllStatusV2(int id, int id_mode) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE [dbo].[tblNotification]\n"
                + "   SET [id_status] = 2\n"
                + " WHERE [tblNotification].id_user = ? AND tblNotification.id_mode = ? AND tblNotification.id_status NOT IN (1)";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.setInt(2, id_mode);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
    }

    public void deleteAllNotifications(int id, int id_mode, int status) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE [dbo].[tblNotification]\n"
                + "   SET [id_status] = 1\n"
                + " WHERE [tblNotification].id_user = ? AND tblNotification.id_mode = ? AND tblNotification.id_status = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.setInt(2, id_mode);
                ptm.setInt(3, status);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
    }

    public void deleteAllNotificationsV2(int id, int id_mode) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE [dbo].[tblNotification]\n"
                + "   SET [id_status] = 1\n"
                + " WHERE [tblNotification].id_user = ? AND tblNotification.id_mode = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.setInt(2, id_mode);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
    }

    public void deleteNotificationsByIdNoti(int id, int id_mode, int id_noti, int id_status) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE [dbo].[tblNotification]\n"
                + "   SET [id_status] = 1\n"
                + " WHERE [tblNotification].id_user = ? AND tblNotification.id_mode = ? "
                + "AND tblNotification.id_noti = ? AND tblNotification.id_status = ? ";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.setInt(2, id_mode);
                ptm.setInt(3, id_noti);
                ptm.setInt(4, id_status);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
    }

    public void deleteNotificationsByIdNotiV2(int id, int id_mode, int id_noti) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE [dbo].[tblNotification]\n"
                + "   SET [id_status] = 1\n"
                + " WHERE [tblNotification].id_user = ? AND tblNotification.id_mode = ? "
                + "AND tblNotification.id_noti = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.setInt(2, id_mode);
                ptm.setInt(3, id_noti);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
    }

    public void readNotificationsByIdNoti(int id, int id_mode, int parseInt, int id_status) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE [dbo].[tblNotification]\n"
                + "   SET [id_status] = 2\n"
                + " WHERE [tblNotification].id_user = ? AND tblNotification.id_mode = ?"
                + " AND tblNotification.id_noti = ? AND tblNotification.id_status = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.setInt(2, id_mode);
                ptm.setInt(3, parseInt);
                ptm.setInt(4, id_status);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
    }

    public void readNotificationsByIdNotiV2(int id, int id_mode, int parseInt) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE [dbo].[tblNotification]\n"
                + "   SET [id_status] = 2\n"
                + " WHERE [tblNotification].id_user = ? AND tblNotification.id_mode = ?"
                + " AND tblNotification.id_noti = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.setInt(2, id_mode);
                ptm.setInt(3, parseInt);
                ptm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
    }

}
