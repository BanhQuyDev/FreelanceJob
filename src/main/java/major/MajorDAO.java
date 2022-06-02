/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package major;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Thiep Ngo
 */
public class MajorDAO {

    public static final String GET_LIST_MAJOR
            = "SELECT [id_major]\n"
            + "      ,[major_name]\n"
            + "  FROM [dbo].[tblMajor]";

    public List<MajorDTO> getAllMajor() throws SQLException {
        List<MajorDTO> listMajor = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_MAJOR);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("id_major");
                    String majorName = rs.getString("major_name");
                    listMajor.add(new MajorDTO(id, majorName));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listMajor;
    }

    public MajorDTO getMajorName(String majorId) throws SQLException {
        MajorDTO major = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT [tblMajor].[id_major],\n"
                + "                 [tblMajor].[major_name]\n"
                + "               FROM [dbo].[tblMajor] \n"
                + "              WHERE [tblMajor].[id_major] LIKE ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "%" + majorId + "%");
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String id = rs.getString("id_major").trim();
                    String majorName = rs.getString("major_name");
                    major = new MajorDTO(id, majorName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return major;
    }
}
