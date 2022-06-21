/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package reports;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import jobs.JobDTO;
import utils.DBUtils;

public class JobReportDAO {

    private final String CREATE_REPORT = "INSERT INTO tblJobReport(content_report, id_job, job_title, id_user_report) "
            + "VALUES(?,?,?,?)";
    private final String GET_ALL_JOB_REPORT = "SELECT J.id_job, J.job_title\n"
            + "FROM tblJobReport J\n"
            + "GROUP BY J.id_job, J.job_title";
    private final String GET_REPORTS_BY_JOB = "SELECT id, job_title, content_report, id_user_report, (SELECT fullname FROM tblUser WHERE id_user =  id_user_report) AS 'fullname', (SELECT avatar FROM tblUser WHERE id_user =  id_user_report) AS 'avatar', create_date\n"
            + "FROM tblJobReport \n"
            + "WHERE id_job = ?";
    private final String GET_NUMBER_OF_REPORT = "SELECT COUNT(content_report) AS 'num_of_report'\n"
            + "FROM tblJobReport\n"
            + "WHERE id_job = ?";
    private final String GET_A_JOB_REPORT = "SELECT J.id_job, J.job_title\n"
            + "FROM tblJobReport J\n"
            + "WHERE J.id_job = ?\n"
            + "GROUP BY J.id_job, J.job_title";

    public int getNumberOfReport(int idJob) throws SQLException {
        int number = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
               ptm = conn.prepareStatement(GET_NUMBER_OF_REPORT);
               ptm.setInt(1, idJob);
               rs = ptm.executeQuery();
               if(rs.next()) {
                   number = rs.getInt("num_of_report");
               }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return number;
    }

    public boolean createReport(JobReportDTO report) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CREATE_REPORT);
                String content = report.getContent_report();
                JobDTO job = report.getJobReport();
                int id_job = job.getIdJob();
                String job_title = job.getTitle();
                int id_user_report = report.getId_user_report();
                ptm.setString(1, content);
                ptm.setInt(2, id_job);
                ptm.setString(3, job_title);
                ptm.setInt(4, id_user_report);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }

    public List<JobReportDTO> getAllJobReport() throws SQLException {
        List<JobReportDTO> job = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_JOB_REPORT);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int idJob = rs.getInt("id_job");
                    String job_title = rs.getString("job_title");
                    JobDTO jobReport = new JobDTO(idJob, job_title);
                    int numOfReport = getNumberOfReport(idJob);
                    job.add(new JobReportDTO(jobReport, numOfReport));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return job;
    }

    public List<JobReportDTO> getAllReportByJob(int idJob) {
        List<JobReportDTO> report = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_REPORTS_BY_JOB);
                ptm.setInt(1, idJob);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_report = rs.getInt("id");
                    String job_title = rs.getString("job_title");
                    JobDTO job = new JobDTO(idJob, job_title);
                    String content_report = rs.getString("content_report");
                    int id_user_report = rs.getInt("id_user_report");
                    String fullName = rs.getString("fullname");
                    String create_date = rs.getString("create_date");
                    int numOfReport = getNumberOfReport(idJob);
                    String avatar = rs.getString("avatar");
                    report.add(new JobReportDTO(id_report, job, content_report, id_user_report, fullName, avatar, numOfReport, create_date));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return report;
    }
    
   public JobReportDTO getAJobReport(int idJob) {
        JobReportDTO report = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_A_JOB_REPORT);
                ptm.setInt(1, idJob);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String job_title = rs.getString("job_title");
                    JobDTO job = new JobDTO(idJob, job_title);
                    int numOfReport = getNumberOfReport(idJob);
                    report = new JobReportDTO(job, numOfReport);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        return report;
    }

}
