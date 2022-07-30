package jobs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import majors.MajorDAO;
import skills.SkillJobDTO;
import utils.DBUtils;

/**
 * @author QUANG HUY
 */
public class JobDAO {
    
    private static final String GET_ALL_JOB_UNAPPROPRIATED = "SELECT j.id_job,j.title,j.salary,j.description,j.duration,j.start_date,s.status_name,u.fullname,j.id_major, j.create_date\n"
            + "  FROM tblJob j,tblJobStatus s,tblEmployer e,tblUser u\n"
            + "  WHERE j.id_status = s.id_status AND j.id_employer = e.id_employer AND e.id_employer = u.id_user AND j.id_status != 2 AND j.id_status != 4 ";
    
    private static final String GET_ALL_JOB_ACCEPTED = "SELECT j.id_job,j.title,j.salary,j.description,j.duration,j.start_date,s.status_name,u.fullname,j.id_major,j.create_date\n"
            + "  FROM tblJob j,tblJobStatus s,tblEmployer e,tblUser u\n"
            + "  WHERE j.id_status = s.id_status AND j.id_employer = e.id_employer AND e.id_employer = u.id_user AND j.id_status != 1 AND j.id_status != 3";
    
    private static final String GET_A_JOB_BY_ID = "SELECT j.id_job, j.title, j.salary, j.description, j.duration, j.start_date, s.status_name, u.fullname, j.id_major, j.create_date\n"
            + "FROM tblJob j, tblJobStatus s, tblEmployer e, tblUser u\n"
            + "WHERE j.id_status = s.id_status AND j.id_employer = e.id_employer AND e.id_employer = u.id_user AND j.id_job = ?";
    
    private static final String UPDATE_STATUS_JOB = "UPDATE tblJob SET id_status = 2 WHERE id_job = ?";
    
    private static final String UPDATE_STATUS_JOB_UNAPPROPRIATED = "UPDATE tblJob SET id_status = 1 WHERE id_job = ?";
    private static final String UPDATE_STATUS_JOB_APPLIED = "UPDATE tblJob SET id_status = 4 WHERE id_job = ?";
    ///////////////Delete Job
    private static final String DELETE_JOB = "DELETE tblJob WHERE id_job = ?";
    
    private static final String DELETE_CONTRACT_JOB = "DELETE tblContract WHERE id_job = ?";
    
    private static final String DELETE_JOB_SKILL = "DELETE tblJobSkill WHERE id_job = ?";
    
    private static final String DELETE_JOB_APPLICATION = "DELETE tblJobApplication WHERE id_job = ?";
    
    private static final String DELETE_JOB_REPORT = "DELETE tblJobReport WHERE id_job = ?";
    
    private static final String DELETE_JOB_MILESTONE = "DELETE tblMilestone WHERE id_job = ?";
    
    private static final String DELETE_JOB_STORAGE = "DELETE tblStorage WHERE id_job = ?";
    /////////////////////////////////////////////////

    private static final String INSERT_JOB = "INSERT INTO tblJob(title, salary, description, duration, start_date, id_status, id_employer, id_major)\n"
            + "VALUES (?,?,?,?,?,?,?,?)";
    
    private static final String GET_TOP_4_LATEST_JOB = "SELECT TOP 4 Jj.id_job, Jj.title, Jj.duration, Jj.salary, U.fullname, Jj.create_date, \n"
            + "	(SELECT COUNT(JA.id_job) as freelancerQuantity FROM tblJob J, tblJobApplication JA, tblFreelancer F\n"
            + "  WHERE JA.id_job = J.id_job AND JA.id_freelancer = F.id_freelancer AND J.id_job = Jj.id_job  GROUP BY JA.id_job) as freelancerQuantity\n"
            + "FROM tblJob Jj, tblEmployer E, tblUser U WHERE E.id_employer = U.id_user AND E.id_employer = Jj.id_employer AND id_status = 2 \n"
            + "ORDER BY create_date DESC";
    
    private static final String GET_ALL_JOB = "SELECT Jj.id_job, Jj.title, Jj.duration, Jj.salary, U.fullname, Jj.create_date,(SELECT COUNT(JA.id_job) as freelancerQuantity FROM tblJob J, tblJobApplication JA, tblFreelancer F\n"
            + "WHERE JA.id_job = J.id_job AND JA.id_freelancer = F.id_freelancer AND J.id_job = Jj.id_job  GROUP BY JA.id_job) as freelancerQuantity\n"
            + "FROM tblJob Jj, tblEmployer E, tblUser U \n"
            + "WHERE E.id_employer = U.id_user AND E.id_employer = Jj.id_employer AND id_status = 2";
    
    private static final String GET_JOB_BY_MAJOR = "SELECT Ji.id_job, Ji.title, Ji.duration, Ji.salary, U.fullname, Ji.create_date,(SELECT COUNT(JA.id_job) as freelancerQuantity FROM tblJob J, tblJobApplication JA, tblFreelancer F\n"
            + "WHERE JA.id_job = J.id_job AND JA.id_freelancer = F.id_freelancer AND J.id_job = Ji.id_job  GROUP BY JA.id_job) as freelancerQuantity\n"
            + "FROM tblJob Ji, tblEmployer E, tblUser U, tblMajor M\n"
            + "WHERE E.id_employer = U.id_user AND E.id_employer = Ji.id_employer AND Ji.id_major = M.id_major AND id_status = 2 AND M.id_major = (SELECT id_major FROM tblMajor WHERE major_name = ?)";
    private static final String GET_JOB_DETAIL = "SELECT J.id_job, J.title, J.salary, J.description, J.duration,DATEADD(day,J.duration, J.start_date) as end_date, J.start_date, J.create_date, U.fullname, M.id_major, M.major_name\n"
            + "FROM tblJob J, tblEmployer E, tblUser U, tblMajor M\n"
            + "WHERE E.id_employer = U.id_user AND E.id_employer = J.id_employer AND J.id_major = M.id_major AND J.id_status = 2 AND J.id_job = ?";
    private static final String SEARCH_JOB = "SELECT j.id_job,j.title,j.salary,j.description,j.duration,j.start_date,s.status_name,u.fullname,j.id_major,j.create_date\n"
            + "  FROM tblJob j,tblJobStatus s,tblEmployer e,tblUser u\n"
            + "  WHERE j.id_status = s.id_status AND j.id_employer = e.id_employer AND e.id_employer = u.id_user AND j.id_status != 1 AND U.email like ?";
    private static final String SEARCH_JOB_SPAM = "SELECT j.id_job,j.title,j.salary,j.description,j.duration,j.start_date,s.status_name,u.fullname,j.id_major,j.create_date\n"
            + "  FROM tblJob j,tblJobStatus s,tblEmployer e,tblUser u\n"
            + "  WHERE j.id_status = s.id_status AND j.id_employer = e.id_employer AND e.id_employer = u.id_user AND j.id_status = 1 AND U.email like ?";
    private static final String APPLY_JOB = "INSERT INTO tblJobApplication(id_freelancer, id_job, note) VALUES(?, ?, ?)";
    private static final String GET_JOB_APPLICATION_ID = "SELECT JA.id_application FROM tblFreelancer F, tblJobApplication JA, tblJob J\n"
            + "WHERE JA.id_freelancer = F.id_freelancer AND JA.id_job = J.id_job AND F.id_freelancer = ? AND J.id_job = ?";
    private static final String COUNT_FREELANCER_IN_JOB = "SELECT COUNT(JA.id_job) as freelancerQuantity FROM tblJob J, tblJobApplication JA, tblFreelancer F\n"
            + "WHERE JA.id_job = J.id_job AND JA.id_freelancer = F.id_freelancer AND J.id_job = ? GROUP BY JA.id_job";
    private static final String GET_APPLIED_JOB_FOR_FREELANCER = "SELECT J.id_job, J.title, J.salary, J.description, J.duration, J.start_date, JA.id_application, JA.status, JA.create_date,\n"
            + "(SELECT M.major_name FROM tblMajor M WHERE M.id_major = J.id_major) AS major_name FROM tblJobApplication JA, tblFreelancer F, tblJob J, tblUser U\n"
            + "WHERE JA.id_freelancer = F.id_freelancer AND JA.id_job = J.id_job AND F.id_freelancer = U.id_user AND JA.status IS NULL AND U.id_user = ?\n"
            + "UNION\n"
            + "SELECT J.id_job, J.title, J.salary, J.description, J.duration, J.start_date, JA.id_application, JA.status, JA.create_date,\n"
            + "(SELECT M.major_name FROM tblMajor M WHERE M.id_major = J.id_major) AS major_name FROM tblJobApplication JA, tblFreelancer F, tblJob J, tblUser U\n"
            + "WHERE JA.id_freelancer = F.id_freelancer AND JA.id_job = J.id_job AND F.id_freelancer = U.id_user AND JA.status = 1 AND U.id_user = ?\n"
            + "ORDER BY JA.status DESC, JA.create_date DESC";
    
    private final String GET_ALL_POST_OF_EMPLOYER_APPLY = "SELECT J.id_job, J.title, M.major_name, JS.status_name\n"
            + "FROM tblMajor M inner join tblJob J on M.id_major = J.id_major inner join tblJobStatus JS ON J.id_status = JS.id_status\n"
            + "WHERE J.id_employer = ? AND J.id_status = 2";
    private final String GET_ALL_POST_OF_EMPLOYER = "SELECT J.id_job, J.title, M.major_name, JS.status_name\n"
            + "FROM tblMajor M inner join tblJob J on M.id_major = J.id_major inner join tblJobStatus JS ON J.id_status = JS.id_status\n"
            + "WHERE J.id_employer = ? ";
    private final String GET_ALL_POST_BY_MAJOR = "SELECT J.id_job, J.title, M.major_name, JS.status_name\n"
            + "FROM tblMajor M inner join tblJob J on M.id_major = J.id_major inner join tblJobStatus JS ON J.id_status = JS.id_status\n"
            + "WHERE J.id_major = (SELECT id_major FROM tblMajor WHERE major_name = ?) AND J.id_employer = ?";
    private final String UPDATE_JOB = "UPDATE tblJob\n"
            + "SET title = ?, salary = ?, duration = ?, id_major = ?, description = ?, start_date = ?, id_status = ?\n"
            + "WHERE id_job = ?";
    
    public boolean updateJob(JobDTO job, int status) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                int idJob = job.getIdJob();
                String title = job.getTitle();
                double salary = job.getSalary();
                double duration = job.getDuration();
                String major = job.getIdMajor().trim();
                String description = job.getDescription();
                String startDate = job.getStartDate();
                ptm = conn.prepareStatement(UPDATE_JOB);
                ptm.setString(1, title);
                ptm.setDouble(2, salary);
                ptm.setDouble(3, duration);
                ptm.setString(4, major);
                ptm.setString(5, description);
                ptm.setString(6, startDate);
                ptm.setInt(7, status);
                ptm.setInt(8, idJob);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }
    
    public List<JobDTO> getAllJobUnappropriated() throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_JOB_UNAPPROPRIATED);
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
                    String[] createDate = create_date.split("\\s");
                    listJob.add(new JobDTO(jobId, title, salary, description, duration, startDate, status, fullName, major, createDate[0]));
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
                    String create_date = rs.getString("create_date");
                    String[] createDate = create_date.split("\\s");
                    listJob.add(new JobDTO(jobId, title, salary, description, duration, startDate, status, fullName, major, createDate[0]));
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
                    int idJob = id;
                    String title = rs.getString("title");
                    double salary = rs.getDouble("salary");
                    String description = rs.getString("description");
                    double duration = rs.getDouble("duration");
                    String startDate = rs.getString("start_date");
                    String status = rs.getString("status_name");
                    String nameEmployer = rs.getString("fullname");
                    String id_major = rs.getString("id_major");
                    String major_name = MajorDAO.convertMajorName(id_major);
                    String create_date = rs.getString("create_date");
                    String[] createDate = create_date.split("\\s");
                    job = new JobDTO(idJob, title, salary, description, duration, startDate, status, nameEmployer, id_major, major_name, createDate[0]);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return job;
    }
    
    public boolean recoverJob(int idJob) throws SQLException {
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
    
    public boolean unappropriatedJob(int idJob) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_STATUS_JOB_UNAPPROPRIATED);
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
    
    public boolean appliedJob(int idJob) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_STATUS_JOB_APPLIED);
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
    
    public boolean deleteContractJob(int idJob) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_CONTRACT_JOB);
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
    
    public boolean deleteJobSkill(int idJob) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_JOB_SKILL);
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
    
    public boolean deleteJobApplication(int idJob) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_JOB_APPLICATION);
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
    public boolean deleteJobReport(int idJob) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_JOB_REPORT);
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
    public boolean deleteJobMileStone(int idJob) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_JOB_MILESTONE);
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
    public boolean deleteJobStorage(int idJob) throws SQLException {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE_JOB_STORAGE);
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
        ResultSet rs = null;
        int idJob = 0;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String title = job.getTitle();
                double salary = job.getSalary();
                double duration = job.getDuration();
                String major = job.getIdMajor().trim();
                String description = job.getDescription();
                String startDate = job.getStartDate();
                String status = "2";
                int idEmployer = job.getIdEmployer();
                ptm = conn.prepareStatement(INSERT_JOB, Statement.RETURN_GENERATED_KEYS);
                ptm.setString(1, title);
                ptm.setDouble(2, salary);
                ptm.setString(3, description);
                ptm.setDouble(4, duration);
                ptm.setString(5, startDate);
                ptm.setString(6, status);
                ptm.setInt(7, idEmployer);
                ptm.setString(8, major);
                if (ptm.executeUpdate() > 0) {
                    rs = ptm.getGeneratedKeys();
                    if (rs.next()) {
                        idJob = rs.getInt(1);
                    }
                    if (createSkillJob(job.getSkillJob(), idJob)) {
                        return result = true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return result;
    }
    
    public boolean createSkillJob(String[] skillJob, int idJob) throws SQLException {
        int effectedRow = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        boolean check = false;
        String sql = "INSERT INTO tblJobSkill(id_skill, id_job) VALUES (?,?)";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                SkillJobDTO skill = new SkillJobDTO();
                for (int i = 0; i < skillJob.length; i++) {
                    skill.setIdSkill(Integer.parseInt(skillJob[i]));
                    ptm.setInt(1, skill.getIdSkill());
                    ptm.setInt(2, idJob);
                    if (ptm.executeUpdate() > 0) {
                        effectedRow++;
                    }
                }
                if (effectedRow == skillJob.length) {
                    return check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }
    
    public List<JobDTO> getTop4LatestJob(int idUser) throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            int jobApplication = 0;
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
                    String[] createDate = create_date.split("\\s");
                    int freelancerQuantity = rs.getInt("freelancerQuantity");
                    jobApplication = getJobApplicationId(idUser, id_job);
                    listJob.add(new JobDTO(id_job, title, salary, "", duration, "", "", fullname, "", createDate[0], freelancerQuantity, jobApplication));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return listJob;
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
                    String[] createDate = create_date.split("\\s");
                    int freelancerQuantity = rs.getInt("freelancerQuantity");
                    listJob.add(new JobDTO(id_job, title, salary, "", duration, "", "", fullname, "", createDate[0], freelancerQuantity));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
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
                    String[] createDate = create_date.split("\\s");
                    int freelancerQuantity = rs.getInt("freelancerQuantity");
                    listJob.add(new JobDTO(id_job, title, salary, "", duration, "", "", fullname, "", createDate[0], freelancerQuantity));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return listJob;
    }
    
    public List<JobDTO> getAllJob(int idUser) throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            int jobApplication = 0;
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
                    String[] createDate = create_date.split("\\s");
                    jobApplication = getJobApplicationId(idUser, id_job);
                    int freelancerQuantity = rs.getInt("freelancerQuantity");
                    listJob.add(new JobDTO(id_job, title, salary, "", duration, "", "", fullname, "", createDate[0], freelancerQuantity, jobApplication));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return listJob;
    }
    
    public List<JobDTO> getJobByMajor(String major_name, int idUser) throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            int jobApplication = 0;
            if (conn != null) {
                ptm = conn.prepareStatement(GET_JOB_BY_MAJOR);
                ptm.setString(1, major_name);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_job = rs.getInt("id_job");
                    String title = rs.getString("title");
                    Double duration = rs.getDouble("duration");
                    Double salary = rs.getDouble("salary");
                    String fullname = rs.getString("fullname");
                    String create_date = rs.getString("create_date");
                    String[] createDate = create_date.split("\\s");
                    int freelancerQuantity = rs.getInt("freelancerQuantity");
                    jobApplication = getJobApplicationId(idUser, id_job);
                    listJob.add(new JobDTO(id_job, title, salary, "", duration, "", "", fullname, "", createDate[0], freelancerQuantity, jobApplication));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return listJob;
    }
    
    public List<JobDTO> getJobByMajor(String major_name) throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_JOB_BY_MAJOR);
                ptm.setString(1, major_name);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_job = rs.getInt("id_job");
                    String title = rs.getString("title");
                    Double duration = rs.getDouble("duration");
                    Double salary = rs.getDouble("salary");
                    String fullname = rs.getString("fullname");
                    String create_date = rs.getString("create_date");
                    String[] createDate = create_date.split("\\s");
                    int freelancerQuantity = rs.getInt("freelancerQuantity");
                    listJob.add(new JobDTO(id_job, title, salary, "", duration, "", "", fullname, "", createDate[0], freelancerQuantity));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
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
                    String endTime = rs.getString("end_date");
                    String start_date = rs.getString("start_date");
                    String create_date = rs.getString("create_date");
                    String fullname = rs.getString("fullname");
                    String[] createDate = create_date.split("\\s");
                    String majorId = rs.getString("id_major");
                    String majorName = rs.getString("major_name");
//                    job = new JobDTO(id_job, title, salary, description, duration, start_date, "", fullname, "", createDate[0]);
                    job = new JobDTO(id_job, title, salary, description, duration, start_date, "", 0, fullname, majorId, majorName, createDate[0], endTime);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return job;
    }
    
    public List<String> getSkillJob(int idJob) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        List<String> list = new ArrayList<>();
        String sql = "SELECT S.skill_name FROM tblJob J , tblJobSkill JS, tblSkill S WHERE J.id_job = JS.id_job AND JS.id_skill = S.id_skill AND J.id_job = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, idJob);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String nameSkill = rs.getString("skill_name");
                    list.add(nameSkill);
                }
                return list;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }
    
    public List<JobApplicationDTO> getAllFreelancerApply(int id) throws SQLException {
        List<JobApplicationDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT [tblJobApplication].[id_freelancer], [tblUser].[fullname], [tblUser].[email], [tblJob].[title], [tblUser].[avatar], [tblJob].[id_job], [tblJobApplication].[note]\n"
                + "  FROM ([tblUser] INNER JOIN [tblFreelancer] ON [tblUser].id_user = [tblFreelancer].[id_freelancer]\n"
                + "  INNER JOIN [tblJobApplication] ON [tblJobApplication].[id_freelancer] = [tblFreelancer].[id_freelancer] \n"
                + "  INNER JOIN [tblJob] ON [tblJob].[id_job] = [tblJobApplication].[id_job]) WHERE [tblJob].[id_employer] = ? AND [tblJobApplication].[status] IS NULL AND [tblJob].[id_status] = 2";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_freelancer = rs.getInt("id_freelancer");
                    String fullName = rs.getString("fullname");
                    String email = rs.getString("email");
                    String title_job = rs.getString("title");
                    String picture = rs.getString("avatar");
                    int id_job = rs.getInt("id_job");
                    String note = rs.getString("note");
                    listUser.add(new JobApplicationDTO(id_freelancer, fullName, email, title_job, picture, id_job, note));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return listUser;
    }
    
    public boolean updateFreelancerAppy(int id_job, int id_freelancer) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE [dbo].[tblJobApplication]\n"
                + "   SET [status] = ?\n"
                + " WHERE [id_freelancer] = ? AND [id_job] = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setBoolean(1, true);
                ptm.setInt(2, id_freelancer);
                ptm.setInt(3, id_job);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }
    
    public boolean updateFreelancerDeny(int id_job, int id_freelancer) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "UPDATE [dbo].[tblJobApplication]\n"
                + "   SET [status] = ?\n"
                + " WHERE  [id_job] = ? AND [id_freelancer] NOT IN (?)";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setBoolean(1, false);
                ptm.setInt(2, id_job);
                ptm.setInt(3, id_freelancer);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }
    
    public List<JobDTO> getAllJobByEmployeer(int id) throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_POST_OF_EMPLOYER);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_job = rs.getInt("id_job");
                    String title_job = rs.getString("title");
                    String major_name = rs.getString("major_name");
                    String status = rs.getString("status_name");
                    int freelancerQuantity = countFreelancerIn1Job(id_job);
                    listJob.add(new JobDTO(id_job, title_job, status, major_name, freelancerQuantity));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return listJob;
    }
    
    public List<JobDTO> getAllJobByEmployeerApply(int id) throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_POST_OF_EMPLOYER_APPLY);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_job = rs.getInt("id_job");
                    String title_job = rs.getString("title");
                    String major_name = rs.getString("major_name");
                    String status = rs.getString("status_name");
                    int freelancerQuantity = countFreelancerIn1Job(id_job);
                    listJob.add(new JobDTO(id_job, title_job, status, major_name, freelancerQuantity));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return listJob;
    }
    
    public List<JobDTO> gettAllPostJobByMajor(int id_employer, String major) throws SQLException {
        List<JobDTO> listPost = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_POST_BY_MAJOR);
                ptm.setString(1, major);
                ptm.setInt(2, id_employer);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_job = rs.getInt("id_job");
                    String title_job = rs.getString("title");
                    String major_name = rs.getString("major_name");
                    String status = rs.getString("status_name");
                    int freelancerQuantity = countFreelancerIn1Job(id_job);
                    listPost.add(new JobDTO(id_job, title_job, status, major_name, freelancerQuantity));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return listPost;
    }
    
    public JobDTO getAJobByEmployeer(int id, int id_job) throws SQLException {
        JobDTO job = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT [id_job]\n"
                + "      ,[title]\n"
                + "  FROM [FPTFreelanceJob].[dbo].[tblJob] WHERE [id_employer] = ? AND [id_job] = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.setInt(2, id_job);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int idJob = rs.getInt("id_job");
                    String title_job = rs.getString("title");
                    job = new JobDTO(idJob, title_job);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return job;
    }
    
    public List<JobApplicationDTO> getFreelancerApplyByJob(int id, int id_job) throws SQLException {
        List<JobApplicationDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT [tblJobApplication].[id_freelancer], [tblUser].[fullname], [tblUser].[email], [tblJob].[title], [tblUser].[avatar], [tblJob].[id_job]\n"
                + "  FROM ([tblUser] INNER JOIN [tblFreelancer] ON [tblUser].id_user = [tblFreelancer].[id_freelancer]\n"
                + "  INNER JOIN [tblJobApplication] ON [tblJobApplication].[id_freelancer] = [tblFreelancer].[id_freelancer] \n"
                + "  INNER JOIN [tblJob] ON [tblJob].[id_job] = [tblJobApplication].[id_job]) WHERE [tblJob].[id_employer] = ? AND"
                + "  [tblJob].[id_job] = ? AND [tblJobApplication].[status] IS NULL";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.setInt(2, id_job);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_freelancer = rs.getInt("id_freelancer");
                    String fullName = rs.getString("fullname");
                    String email = rs.getString("email");
                    String title_job = rs.getString("title");
                    String picture = rs.getString("avatar");
                    int idJob = rs.getInt("id_job");
                    listUser.add(new JobApplicationDTO(id_freelancer, fullName, email, title_job, picture, idJob));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return listUser;
    }
    
    public List<JobDTO> getListJobByEmail(String search) throws SQLException {
        List<JobDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_JOB);
                ptm.setString(1, "%" + search + "%");
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
                    String[] createDate = create_date.split("\\s");
                    list.add(new JobDTO(jobId, title, salary, description, duration, startDate, status, fullName, major, createDate[0]));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }
    
    public List<JobDTO> getListJobSpamByEmail(String search) throws SQLException {
        List<JobDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_JOB_SPAM);
                ptm.setString(1, "%" + search + "%");
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
                    String[] createDate = create_date.split("\\s");
                    list.add(new JobDTO(jobId, title, salary, description, duration, startDate, status, fullName, major, createDate[0]));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }
    
    public boolean insertJobApplication(int idFreelancer, int idJob, String note) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(APPLY_JOB);
                ptm.setInt(1, idFreelancer);
                ptm.setInt(2, idJob);
                ptm.setString(3, note);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }
    
    public int getJobApplicationId(int idFreelancer, int idJob) throws SQLException {
        int check = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_JOB_APPLICATION_ID);
                ptm.setInt(1, idFreelancer);
                ptm.setInt(2, idJob);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = rs.getInt("id_application");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return check;
    }
    
    public int countFreelancerIn1Job(int idJob) throws SQLException {
        int check = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_FREELANCER_IN_JOB);
                ptm.setInt(1, idJob);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = rs.getInt("freelancerQuantity");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return check;
    }
    
    public List<JobDTO> getAppliedJobForFreelancer(int idFreelancer) throws SQLException {
        List<JobDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_APPLIED_JOB_FOR_FREELANCER);
                ptm.setInt(1, idFreelancer);
                ptm.setInt(2, idFreelancer);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_job = rs.getInt("id_job");
                    String title = rs.getString("title");
                    Double salary = rs.getDouble("salary");
                    String description = rs.getString("description");
                    Double duration = rs.getDouble("duration");
                    String start_date = rs.getString("start_date");
                    int id_application = rs.getInt("id_application");
                    int status_ja = rs.getInt("status");
                    String[] split = rs.getString("create_date").split(" ");
                    String create_date_ja = split[0];
                    String major_name = rs.getString("major_name");
//                    int applicationTime = -1;
                    int applicationTime = getApplicationTime(id_job, idFreelancer);
//                    int executionTime = 9999;
                    int executionTime = getExecutionTime(id_job, idFreelancer);
                    list.add(new JobDTO(id_job, title, salary, description, duration, start_date, major_name, id_application, create_date_ja, status_ja, applicationTime, executionTime));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }
    
    public List<JobApplicationDTO> getFreelancerApplyByJob(int id_job) throws SQLException {
        List<JobApplicationDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT [id_freelancer]\n"
                + "      ,[id_job]\n"
                + "  FROM [dbo].[tblJobApplication] WHERE [id_job] = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id_job);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_freelancer = rs.getInt("id_freelancer");
                    int idJob = rs.getInt("id_job");
                    list.add(new JobApplicationDTO(id_freelancer, idJob));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }
    
    public int getApplicationTime(int idJob, int idFreelancer) throws SQLException {
        int check = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT DATEDIFF(HOUR, JA.create_date, GETDATE()) appliedDate FROM tblJob J, tblJobApplication JA, tblFreelancer F\n"
                + "WHERE J.id_job = JA.id_job AND JA.id_freelancer = F.id_freelancer AND JA.status IS NULL AND J.id_job = ? AND F.id_freelancer = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, idJob);
                ptm.setInt(2, idFreelancer);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = rs.getInt("appliedDate");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return check;
    }
    
    public int getExecutionTime(int idJob, int idFreelancer) throws SQLException {
        int check = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT DATEDIFF(HOUR, J.start_date, GETDATE()) executionTime FROM tblJob J, tblContract C, tblFreelancer F, tblJobApplication JA\n"
                + "WHERE C.id_freelancer = F.id_freelancer AND C.id_job = J.id_job AND JA.id_freelancer = F.id_freelancer AND JA.id_job = J.id_job AND JA.status = 1 AND J.id_job = ? AND F.id_freelancer = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, idJob);
                ptm.setInt(2, idFreelancer);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = rs.getInt("executionTime");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return check;
    }
    
    public List<JobDTO> getAllJobPostOfEmployerByStatus(int id, String[] status) throws SQLException {
        List<JobDTO> listJob = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT J.id_job, J.title, M.major_name, JS.status_name\n"
                + "FROM tblMajor M inner join tblJob J on M.id_major = J.id_major inner join tblJobStatus JS ON J.id_status = JS.id_status\n"
                + "WHERE J.id_employer = ? ";
        sql += "AND JS.id_status IN (";
        for (int i = 0; i < status.length; i++) {
            sql += status[i] + ",";
        }
        if (sql.endsWith(",")) {
            sql = sql.substring(0, sql.length() - 1);
        }
        sql += ")";
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_job = rs.getInt("id_job");
                    String title_job = rs.getString("title");
                    String major_name = rs.getString("major_name");
                    String status_name = rs.getString("status_name");
                    int freelancerQuantity = countFreelancerIn1Job(id_job);
                    listJob.add(new JobDTO(id_job, title_job, status_name, major_name, freelancerQuantity));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return listJob;
    }
    
    public List<JobDTO> gettAllPostJobByMajorAndStatus(int id_employer, String major, String[] status) throws SQLException {
        List<JobDTO> listPost = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT J.id_job, J.title, M.major_name, JS.status_name\n"
                + "FROM tblMajor M INNER JOIN tblJob J on M.id_major = J.id_major INNER JOIN tblJobStatus JS ON J.id_status = JS.id_status\n"
                + "WHERE J.id_major = (SELECT id_major FROM tblMajor WHERE major_name = ?) AND J.id_employer = ? ";
        sql += "AND JS.id_status IN (";
        for (int i = 0; i < status.length; i++) {
            sql += status[i] + ",";
        }
        if (sql.endsWith(",")) {
            sql = sql.substring(0, sql.length() - 1);
        }
        sql += ")";
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, major);
                ptm.setInt(2, id_employer);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_job = rs.getInt("id_job");
                    String title_job = rs.getString("title");
                    String major_name = rs.getString("major_name");
                    String status_name = rs.getString("status_name");
                    int freelancerQuantity = countFreelancerIn1Job(id_job);
                    listPost.add(new JobDTO(id_job, title_job, status_name, major_name, freelancerQuantity));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return listPost;
    }
    
    public List<JobApplicationDTO> getUserDeny(int id_freelancer, int id_job) throws SQLException {
        List<JobApplicationDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT [id_freelancer]\n"
                + "  FROM [FPTFreelanceJob].[dbo].[tblJobApplication] \n"
                + "  WHERE [id_job] = ? AND  [id_freelancer] NOT IN (?)";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id_job);
                ptm.setInt(2, id_freelancer);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_freelancerDeny = rs.getInt("id_freelancer");
                    list.add(new JobApplicationDTO(id_freelancerDeny, id_job));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }
    
    public JobDTO getAJobByIDV2(int parseInt) throws SQLException {
        JobDTO job = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT [id_job], [id_employer]\n"
                + "      ,[title]\n"
                + "  FROM [FPTFreelanceJob].[dbo].[tblJob] WHERE [id_job] = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, parseInt);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int idJob = rs.getInt("id_job");
                    int id_employer = rs.getInt("id_employer");
                    String title_job = rs.getString("title");
                    job = new JobDTO(idJob, title_job, id_employer);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return job;
    }
    
    public int getCountJobByFreelancer(int id_freelancer, int id_status) throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT (id_freelancer) AS number_job\n"
                + "     FROM tblJobApplication \n"
                + "     WHERE id_freelancer = ? AND [status] = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id_freelancer);
                ptm.setInt(2, id_status);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("number_job");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return count;
    }
}
