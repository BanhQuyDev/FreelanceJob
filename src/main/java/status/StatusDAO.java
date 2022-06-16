package status;

import utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StatusDAO {
    
    private final String GET_ALL_JOB_STATUS = "SELECT id_status, status_name FROM tblJobStatus";
    private final String GET_ID_STATUS = "SELECT id_status FROM tblJobStatus WHERE status_name = ?";

    public List<StatusDTO> getAllJobStatus() throws SQLException {
        List<StatusDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_ALL_JOB_STATUS);
                rs = ptm.executeQuery();
                while(rs.next()) {
                    int id_status = rs.getInt("id_status");
                    String status_name = rs.getString("status_name");
                    list.add(new StatusDTO(id_status, status_name));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }
    
    public int getStatusId(String status_name) {
        int id_status = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if(conn != null) {
                ptm = conn.prepareStatement(GET_ID_STATUS);
                ptm.setString(1, status_name);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    id_status = rs.getInt("id_status");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            
        }
        return id_status;
    }
}
