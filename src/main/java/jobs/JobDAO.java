/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jobs;

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
public class JobDAO {
    public static final String GET_ALL_JOB_PROCESSING = "SELECT j.id_job,j.title,j.salary,j.description,j.duration,j.start_date,s.status_name,u.fullname,j.id_major\n" 
                                                        +"  FROM tblJob j,tblJobStatus s,tblEmployer e,tblUser u\n" 
                                                        +"  WHERE j.id_status = s.id_status AND j.id_employer = e.id_employer AND e.id_employer = u.id_user AND j.id_status = 1";
     public static final String GET_ALL_JOB_ACCEPTED = "SELECT j.id_job,j.title,j.salary,j.description,j.duration,j.start_date,s.status_name,u.fullname,j.id_major\n" 
                                                        +"  FROM tblJob j,tblJobStatus s,tblEmployer e,tblUser u\n" 
                                                        +"  WHERE j.id_status = s.id_status AND j.id_employer = e.id_employer AND e.id_employer = u.id_user AND j.id_status = 2";
    public static final String UPDATE_STATUS_JOB = "UPDATE tblJob SET id_status = 2 WHERE id_job = ?";
    public static final String DELETE_JOB = "DELETE tblJob WHERE id_job = ?";
       public List<JobDTO> getAllJobProcessing() throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_JOB_PROCESSING);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int jobId = rs.getInt("id_job");
                    String title = rs.getString("title");
                    double salary = rs.getDouble("salary");
                    String description = rs.getString("description");
                    double duration = rs.getDouble("duration");
                    String startDate = rs.getString("start_date");
                    String status = rs.getString("status_name");
                    String fullName = rs.getString("fullname");
                    String major = rs.getString("id_major");
                    listJob.add(new JobDTO(jobId, title, salary, description, duration, startDate, status, fullName, major));
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
        return listJob;
    }
       public List<JobDTO> getAllJobAccepted() throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_JOB_ACCEPTED);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int jobId = rs.getInt("id_job");
                    String title = rs.getString("title");
                    double salary = rs.getDouble("salary");
                    String description = rs.getString("description");
                    double duration = rs.getDouble("duration");
                    String startDate = rs.getString("start_date");
                    String status = rs.getString("status_name");
                    String fullName = rs.getString("fullname");
                    String major = rs.getString("id_major");
                    listJob.add(new JobDTO(jobId, title, salary, description, duration, startDate, status, fullName, major));
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
        return listJob;
    }
       
     public boolean acceptJob(int idJob) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_STATUS_JOB);
                ptm.setInt(1, idJob);
                int value = ptm.executeUpdate();
                result = value > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
     public boolean deleteJob(int idJob) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_JOB);
                ptm.setInt(1, idJob);
                int value = ptm.executeUpdate();
                result = value > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }
}
