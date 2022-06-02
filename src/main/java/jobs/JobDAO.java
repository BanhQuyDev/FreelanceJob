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
import majors.MajorDAO;
import utils.DBUtils;

/**
 *
 * @author QUANG HUY
 */
public class JobDAO {

    private static final String GET_ALL_JOB_PROCESSING = "SELECT j.id_job,j.title,j.salary,j.description,j.duration,j.start_date,s.status_name,u.fullname,j.id_major, j.create_date\n"
            + "  FROM tblJob j,tblJobStatus s,tblEmployer e,tblUser u\n"
            + "  WHERE j.id_status = s.id_status AND j.id_employer = e.id_employer AND e.id_employer = u.id_user AND j.id_status = 1";
    private static final String GET_ALL_JOB_ACCEPTED = "SELECT j.id_job,j.title,j.salary,j.description,j.duration,j.start_date,s.status_name,u.fullname,j.id_major\n"
            + "  FROM tblJob j,tblJobStatus s,tblEmployer e,tblUser u\n"
            + "  WHERE j.id_status = s.id_status AND j.id_employer = e.id_employer AND e.id_employer = u.id_user AND j.id_status = 2";
    private static final String GET_A_JOB_BY_ID = "SELECT j.id_job, j.title, j.salary, j.description, j.duration, j.start_date, s.status_name, u.fullname, j.id_major, j.create_date\n"
            + "FROM tblJob j, tblJobStatus s, tblEmployer e, tblUser u\n"
            + "WHERE j.id_status = s.id_status AND j.id_employer = e.id_employer AND e.id_employer = u.id_user AND j.id_job = ?";
    private static final String UPDATE_STATUS_JOB = "UPDATE tblJob SET id_status = 2 WHERE id_job = ?";
    private static final String DELETE_JOB = "DELETE tblJob WHERE id_job = ?";
    private static final String INSERT_JOB = "INSERT INTO tblJob(title, salary, description, duration, start_date, id_status, id_employer, id_major)\n"
            + "VALUES (?,?,?,?,?,?,?,?)";
    public static final String GET_TOP_4_LATEST_JOB = "SELECT J.id_job, J.title, J.duration, J.salary, U.fullname, J.create_date FROM tblJob J, tblEmployer E, tblUser U \n"
            + "WHERE E.id_employer = U.id_user AND E.id_employer = J.id_employer AND id_status = 2 ORDER BY DATEDIFF(HOUR, create_date, GETDATE()) DESC";
    public static final String GET_ALL_JOB = "SELECT J.id_job, J.title, J.duration, J.salary, U.fullname, J.create_date FROM tblJob J, tblEmployer E, tblUser U \n"
            + "WHERE E.id_employer = U.id_user AND E.id_employer = J.id_employer AND id_status = 2";
    public static final String GET_JOB_BY_MAJOR = "SELECT J.id_job, J.title, J.duration, J.salary, U.fullname, J.create_date FROM tblJob J, tblEmployer E, tblUser U, tblMajor M\n"
            + "WHERE E.id_employer = U.id_user AND E.id_employer = J.id_employer AND J.id_major = M.id_major AND id_status = 2 AND M.id_major = ?";
    public static final String GET_JOB_DETAIL = "SELECT J.id_job, J.title, J.salary, J.description, J.duration, J.start_date, J.create_date, U.fullname FROM tblJob J, tblEmployer E, tblUser U\n"
            + "WHERE E.id_employer = U.id_user AND E.id_employer = J.id_employer AND J.id_status = 2 AND J.id_job = ?";

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
                    String create_date = rs.getString("create_date");
                    listJob.add(new JobDTO(jobId, title, salary, description, duration, startDate, status, fullName, major, create_date));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
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
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return listJob;
    }

    public JobDTO getAJobByID(int id) throws SQLException {
        JobDTO job = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_A_JOB_BY_ID);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int idJob = rs.getInt("id_job");
                    String title = rs.getString("title");
                    double salary = rs.getDouble("salary");
                    String description = rs.getString("description");
                    double duration = rs.getDouble("duration");
                    String startDate = rs.getString("start_date");
                    String status = rs.getString("status_name");
                    String nameEmployer = rs.getString("fullname");
                    String major_name = MajorDAO.convertMajorName(rs.getString("id_major"));
                    String create_date = rs.getString("create_date");
                    job = new JobDTO(idJob, title, salary, description, duration, startDate, status, nameEmployer, major_name, create_date);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return job;
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
            DBUtils.closeConnection(conn, ptm);
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
            DBUtils.closeConnection(conn, ptm);
        }
        return result;
    }

    public boolean createJob(JobDTO job) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String title = job.getTitle();
                double salary = job.getSalary();
                double duration = job.getDuration();
                String major = job.getIdMajor().trim();
                String description = job.getDescription();
                String startDate = job.getStartDate();
                String status = "1";
                int idEmployer = job.getIdEmployer();
                ptm = conn.prepareStatement(INSERT_JOB);
                ptm.setString(1, title);
                ptm.setDouble(2, salary);
                ptm.setString(3, description);
                ptm.setDouble(4, duration);
                ptm.setString(5, startDate);
                ptm.setString(6, status);
                ptm.setInt(7, idEmployer);
                ptm.setString(8, major);
                result = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return result;
    }

    public List<JobDTO> getTop4LatestJob() throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_TOP_4_LATEST_JOB);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_job = rs.getInt("id_job");
                    String title = rs.getString("title");
                    Double duration = rs.getDouble("duration");
                    Double salary = rs.getDouble("salary");
                    String fullname = rs.getString("fullname");
                    String create_date = rs.getString("create_date");
                    listJob.add(new JobDTO(id_job, title, salary, "", duration, "", "", fullname, "", create_date));
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

    public List<JobDTO> getAllJob() throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_JOB);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_job = rs.getInt("id_job");
                    String title = rs.getString("title");
                    Double duration = rs.getDouble("duration");
                    Double salary = rs.getDouble("salary");
                    String fullname = rs.getString("fullname");
                    String create_date = rs.getString("create_date");
                    listJob.add(new JobDTO(id_job, title, salary, "", duration, "", "", fullname, "", create_date));
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

    public List<JobDTO> getJobByMajor(String idMajor) throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_JOB_BY_MAJOR);
                ptm.setString(1, idMajor);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_job = rs.getInt("id_job");
                    String title = rs.getString("title");
                    Double duration = rs.getDouble("duration");
                    Double salary = rs.getDouble("salary");
                    String fullname = rs.getString("fullname");
                    String create_date = rs.getString("create_date");
                    listJob.add(new JobDTO(id_job, title, salary, "", duration, "", "", fullname, "", create_date));
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

    public JobDTO getDetailJob(int idJob) throws SQLException {
        JobDTO job = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_JOB_DETAIL);
                ptm.setInt(1, idJob);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    int id_job = rs.getInt("id_job");
                    String title = rs.getString("title");
                    Double salary = rs.getDouble("salary");
                    String description = rs.getString("description");
                    Double duration = rs.getDouble("duration");
                    String start_date = rs.getString("start_date");
                    String create_date = rs.getString("create_date");
                    String fullname = rs.getString("fullname");
                    job = new JobDTO(id_job, title, salary, description, duration, start_date, "", fullname, "", create_date);
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
        return job;
    }
}
