/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package milestones;

import java.sql.CallableStatement;
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
public class MilestoneDAO {

    private final String INSERT_MILESTONE = "INSERT INTO tblMilestone(tittle, start_date, end_date, status, id_job) VALUES(?,?,?,1,?)";
    private final String GET_ALL_ID_MILESTONE = "SELECT M.id_milestone FROM tblMilestone M ";
    private final String CHECK_AUTO_STATUS = "{call Check_Milestone_Status(?)}";
    private String GET_ALL_MILESTONE_BY_ID_JOB = "SELECT M.id_milestone, M.tittle, M.start_date, M.end_date, M.status FROM tblJob J, tblMilestone M WHERE J.id_job = M.id_job AND M.id_job = ? "
            + "ORDER BY start_date ASC";

    public boolean insertListMilestone(List<MilestoneDTO> listMilestone) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_MILESTONE);
                for (MilestoneDTO milestoneDTO : listMilestone) {
                    if (milestoneDTO.getTittle() != null && milestoneDTO.getStartDate() != null && milestoneDTO.getEndDate() != null) {
                        ptm.setString(1, milestoneDTO.getTittle());
                        ptm.setString(2, milestoneDTO.getStartDate());
                        ptm.setString(3, milestoneDTO.getEndDate());
                        ptm.setInt(4, milestoneDTO.getIdJob());
                        if (ptm.executeUpdate() > 0) {
                            check = true;
                        } else {
                            check = false;
                            break;
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }

    public void autoSetStatusByDay() throws SQLException {
        Connection conn = null;
        CallableStatement cs = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_ID_MILESTONE);
                cs = conn.prepareCall(CHECK_AUTO_STATUS);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_milestone = rs.getInt("id_milestone");
                    cs.setInt(1, id_milestone);
                    cs.execute();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
            if (cs != null) {
                cs.close();
            }
        }
    }

    public List<MilestoneDTO> getAllMilestoneByIdJob(int idJob) throws SQLException {
        List<MilestoneDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_MILESTONE_BY_ID_JOB);
                ptm.setInt(1, idJob);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_milestone = rs.getInt("id_milestone");
                    String tittle = rs.getString("tittle");
                    String start_date = rs.getString("start_date");
                    String end_date = rs.getString("end_date");
                    int status = rs.getInt("status");
                    list.add(new MilestoneDTO(id_milestone, tittle, start_date, end_date, status, idJob));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }
}
