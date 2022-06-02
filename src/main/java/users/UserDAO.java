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
import utils.DBUtils;

/**
 *
 * @author QUANG HUY
 */
public class UserDAO {

    public static final String CHECK_DUPLICATE = "SELECT email FROM tblUser WHERE email=? AND status = 1";
    private static final String CHECK_EMAIL_LOGIN = "SELECT id_user, email, fullname, address, dob, bio, phone, avatar "
            + "FROM tblUser "
            + "WHERE email = ? AND status = 1";
    public static final String CREATE_USER = "INSERT INTO tblUser(fullname,email,avatar,status) VALUES(?,?,?,?)";
    public static final String CREATE_FREELANCER = "INSERT INTO tblFreelancer(id_freelancer,type) VALUES(?,?)";
    public static final String CREATE_EMPLOYER = "INSERT INTO tblEmployer(id_employer,type) VALUES(?,?)";
    public static final String CHECK_ROLE_ADMIN = "SELECT type FROM tblAdmin WHERE id_admin = ?";

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
            DBUtils.closeConnection(conn, ptm,rs);
        }
        return user;
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
           DBUtils.closeConnection(conn, ptm,rs);
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
            DBUtils.closeConnection(conn, ptm,rs);
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
}
