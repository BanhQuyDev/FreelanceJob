/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author QUANG HUY
 */
public class UserDAO {

    private static final String CHECK_DUPLICATE = "SELECT email FROM tblUser WHERE email=?";
    private static final String CHECK_EMAIL_LOGIN = "SELECT id_user, email, fullname, address, dob, bio, phone, avatar "
            + "FROM tblUser "
            + "WHERE email = ? AND status = 1";
    private static final String CREATE_USER = "INSERT INTO tblUser(fullname,email,avatar,status) VALUES(?,?,?,?)";
    private static final String CREATE_FREELANCER = "INSERT INTO tblFreelancer(id_freelancer,type) VALUES(?,?)";
    private static final String CREATE_EMPLOYER = "INSERT INTO tblEmployer(id_employer,type) VALUES(?,?)";
    private static final String CHECK_ROLE_ADMIN = "SELECT type FROM tblAdmin WHERE id_admin = ?";
    private static final String GET_ALL_USER = "  SELECT U.id_user, U.fullname,U.email,U.dob, U.address,U.phone FROM tblUser U , tblEmployer E, tblFreelancer F "
            + "WHERE  E.id_employer = U.id_user AND F.id_freelancer = U.id_user AND U.status = 1";
    private static final String GET_ALL_USER_BAN = "  SELECT U.id_user, U.fullname,U.email,U.dob, U.address,U.phone FROM tblUser U , tblEmployer E, tblFreelancer F "
            + "WHERE  E.id_employer = U.id_user AND F.id_freelancer = U.id_user AND U.status = 0";
    private static final String BAN_USER = "UPDATE tblUser SET status = 0 WHERE id_user = ? ";
    private static final String UNBAN_USER = "UPDATE tblUser SET status = 1 WHERE id_user = ? ";
    private static final String NUM_OF_SPAM = "  SELECT COUNT(id_employer) as NumOfSpam\n"
            + "  FROM tblJob WHERE id_status = 1 AND id_employer = ? GROUP BY id_employer";

    public boolean checkDuplicate(String email) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }

        return check;
    }

    public UserDTO getUserByEmail(String email) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_EMAIL_LOGIN);
                ptm.setString(1, email);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("id_user");
                    String fullName = rs.getString("fullname");
                    String address = rs.getString("address");
                    String dob = rs.getString("dob");
                    String bio = rs.getString("bio");
                    String phone = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    user = new UserDTO(id, fullName, email, dob, address, bio, phone, avatar);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return user;
    }

    public List<UserDTO> getAllUser() throws SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_USER);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id_user");
                    String fullName = rs.getString("fullname");
                    String email = rs.getString("email");
                    String dob = rs.getString("dob");
                    String phone = rs.getString("phone");
                    listUser.add(new UserDTO(id, fullName, email, dob, "", "", phone, "", numOfSpam(id)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return listUser;
    }

    public int numOfSpam(int idUser) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int numOfSpam = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(NUM_OF_SPAM);
                ptm.setInt(1, idUser);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    numOfSpam = rs.getInt("NumOfSpam");
                    return numOfSpam;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return numOfSpam;
    }

    public List<UserDTO> getAllUserBan() throws SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_USER_BAN);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id_user");
                    String fullName = rs.getString("fullname");
                    String email = rs.getString("email");
                    String dob = rs.getString("dob");
                    String phone = rs.getString("phone");
                    listUser.add(new UserDTO(id, fullName, email, dob, "", "", phone, "", numOfSpam(id)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return listUser;
    }

    public boolean banUser(int idUser) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(BAN_USER);
                ptm.setInt(1, idUser);
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

    public boolean unbanUser(int idUser) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UNBAN_USER);
                ptm.setInt(1, idUser);
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

    public boolean createUser(UserDTO user) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int idUser = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_USER, Statement.RETURN_GENERATED_KEYS);
                ptm.setString(1, user.getName());
                ptm.setString(2, user.getEmail());
                ptm.setString(3, user.getPicture());
                ptm.setBoolean(4, true);
                if (ptm.executeUpdate() > 0) {
                    rs = ptm.getGeneratedKeys();
                    if (rs.next()) {
                        idUser = rs.getInt(1);
                    }
                    if (createFreelancer(idUser) && createEmployer(idUser)) {
                        check = true;
                    }
                }
            }
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return check;
    }

    // if check = true user is admin else user is guess
    public boolean checkRole(int id) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_ROLE_ADMIN);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
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

    public boolean createFreelancer(int idFreelancer) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_FREELANCER);
                ptm.setInt(1, idFreelancer);
                ptm.setString(2, "Freelancer");
                check = ptm.executeUpdate() > 0;
            }
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }

    public boolean createEmployer(int idEmployer) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_EMPLOYER);
                ptm.setInt(1, idEmployer);
                ptm.setString(2, "Employer");
                check = ptm.executeUpdate() > 0;
            }
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }

    public boolean updateUser(int id, String fullName, String email, String phone, String bio, String dob, String address) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE [dbo].[tblUser]\n"
                + "   SET [fullname] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[dob] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[bio] = ?\n"
                + "      ,[phone] = ?\n"
                + " WHERE [tblUser].[id_user] = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, fullName);
                ptm.setString(2, email);
                ptm.setString(3, dob);
                ptm.setString(4, address);
                ptm.setString(5, bio);
                ptm.setString(6, phone);
                ptm.setInt(7, id);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }

    public UserDTO getUserByID(int id_freelancer) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT [id_user]\n"
                + "      ,[fullname]\n"
                + "      ,[email]\n"
                + "      ,[dob]\n"
                + "      ,[address]\n"
                + "      ,[bio]\n"
                + "      ,[phone]\n"
                + "      ,[avatar]\n"
                + "      ,[status]\n"
                + "  FROM [dbo].[tblUser] WHERE [id_user] = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id_freelancer);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int id = rs.getInt("id_user");
                    String fullName = rs.getString("fullname");
                    String email = rs.getString("email");
                    String address = rs.getString("dob");
                    String dob = rs.getString("address");
                    String bio = rs.getString("bio");
                    String phone = rs.getString("phone");
                    String avatar = rs.getString("avatar");
                    user = new UserDTO(id, fullName, email, dob, address, bio, phone, avatar);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return user;
    }
}
