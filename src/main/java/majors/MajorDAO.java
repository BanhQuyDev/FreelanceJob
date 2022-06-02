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

/**
 *
 * @author Admin
 */
public class MajorDAO {

    public static final String GET_ALL_MAJOR = "SELECT id_major, major_name FROM tblMajor";

    public List<MajorDTO> getAllMajorList() throws SQLException {
        List<MajorDTO> majorList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_MAJOR);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String majorId = rs.getString("id_major");
                    String majorName = rs.getString("major_name");
                    majorList.add(new MajorDTO(majorId, majorName));
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
        return majorList;
    }

}
