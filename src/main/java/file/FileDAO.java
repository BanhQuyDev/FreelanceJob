/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author QUANG HUY
 */
public class FileDAO {
    private final String UPLOAD = "INSERT INTO tblStorage(urlS3,id_job) VALUES(?, ?)";
    private final String COUNTFILE = "SELECT COUNT(id_job) AS numOfFile FROM tblStorage WHERE id_job = ? GROUP BY id_job";
    private final String GET_ALL_FILE_BY_ID_JOB = "  SELECT s.id_file, s.urlS3,j.title FROM tblStorage S , tblJob J WHERE s.id_job = j.id_job AND s.id_job = ?";
    private final String DELETE_FILE = "DELETE tblStorage WHERE id_file = ?";
    public boolean uploadFile(String urlS3, int id_job) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPLOAD);
                ptm.setString(1, urlS3);
                ptm.setInt(2, id_job);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }
    public int countFile(int id_job) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int total = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNTFILE);
                ptm.setInt(1, id_job);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int totalFile = rs.getInt("numOfFile");
                    total = totalFile;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return total;
    }
    
    public List<FileDTO> getListFileOfJob(int idJob) throws SQLException {
        List<FileDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_FILE_BY_ID_JOB);
                ptm.setInt(1, idJob);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int idFile = rs.getInt("id_file");
                    String urlS3 = rs.getString("urlS3");
//                    String titleJob = rs.getString("title");
                    list.add(new FileDTO(idFile, urlS3, idJob));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }
     public boolean deleteFile(int idFile) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_FILE);
                ptm.setInt(1, idFile);
                int value = ptm.executeUpdate();
                result = value > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return result;
    }
}
