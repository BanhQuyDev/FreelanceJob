/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package majors;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class MajorDAO {

    private final String GET_ALL_MAJOR = "  SELECT id_major, major_name,img_major,(SELECT COUNT(J.id_major) as numOfJob\n"
            + "  FROM tblJob J \n"
            + "  WHERE J.id_major = M.id_major AND J.id_status = 2\n"
            + "  GROUP BY J.id_major)as numOfJob FROM tblMajor M";
    private static final String GET_MAJOR_NAME = "SELECT major_name FROM tblMajor WHERE id_major = ?";

    public List<MajorDTO> getAllMajor() throws SQLException {
        List<MajorDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_MAJOR);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String id_major = rs.getString("id_major").trim();
                    String major_name = rs.getString("major_name");
                    list.add(new MajorDTO(id_major, major_name));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }


    public List<MajorDTO> getAllMajorList() throws SQLException {
        List<MajorDTO> majorList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            int totalJob = 0;
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_MAJOR);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String majorId = rs.getString("id_major");
                    String majorName = rs.getString("major_name");
                    String img_major = rs.getString("img_major");
                    totalJob = rs.getInt("numOfJob");
                    majorList.add(new MajorDTO(majorId, majorName, img_major,totalJob));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return majorList;
    }

    public static String convertMajorName(String id) throws SQLException {
        String major_name = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_MAJOR_NAME);
                ptm.setString(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    major_name = rs.getString("major_name");
                    return major_name;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return major_name;
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
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return major;
    }

}
