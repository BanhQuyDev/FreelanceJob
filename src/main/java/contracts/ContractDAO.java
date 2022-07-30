/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package contracts;

import Payment.PaymentDAO;
import file.FileDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import milestones.MilestoneDAO;
import milestones.MilestoneDTO;
import utils.DBUtils;

/**
 *
 * @author Admin
 */
public class ContractDAO {

    private final String GET_ALL_CONTRACT_FOR_HISTORY = "SELECT Cc.id_contract, Cc.create_date, Cc.status, U.fullname as freelancer_name,\n"
            + "	 (SELECT U.fullname FROM tblContract C, tblEmployer E, tblUser U WHERE C.id_employer = E.id_employer AND E.id_employer = U.id_user AND C.id_contract = Cc.id_contract) as employer_name,\n"
            + "	 (SELECT J.title FROM tblContract C, tblJob J WHERE C.id_job = J.id_job AND C.id_contract = Cc.id_contract) as job_title\n"
            + "FROM tblContract Cc, tblFreelancer F, tblUser U WHERE Cc.id_freelancer = F.id_freelancer AND F.id_freelancer = U.id_user AND U.id_user = ? ORDER BY Cc.status DESC, Cc.create_date DESC";
    private final String GET_ALL_CONTRACT_FOR_HISTORY_FOR_EMPLOYER = "SELECT Cc.id_contract, Cc.create_date, Cc.status, U.fullname as employer_name,\n"
            + "	(SELECT U.fullname FROM tblContract C, tblFreelancer F, tblUser U WHERE C.id_freelancer = F.id_freelancer AND F.id_freelancer = U.id_user AND C.id_contract = Cc.id_contract) as freelancer_name,\n"
            + "    (SELECT J.title FROM tblContract C, tblJob J WHERE C.id_job = J.id_job AND C.id_contract = Cc.id_contract) as job_title\n"
            + "FROM tblContract Cc, tblEmployer E, tblUser U WHERE Cc.id_employer = E.id_employer AND E.id_employer = U.id_user AND U.id_user = ? ORDER BY Cc.status DESC, Cc.create_date DESC";
    private final String GET_CONTRACT_BY_ID = "SELECT C.id_contract, C.create_date, C.status, J.title, J.salary, J.description, J.duration\n"
            + "FROM tblContract C, tblJob J WHERE C.id_job = J.id_job AND C.id_contract = ?";
    private final String FILTER_CONTRACT_FOR_HISTORY = "SELECT Cc.id_contract, Cc.create_date, Cc.status, U.fullname as freelancer_name,\n"
            + "	 (SELECT U.fullname FROM tblContract C, tblEmployer E, tblUser U WHERE C.id_employer = E.id_employer AND E.id_employer = U.id_user AND C.id_contract = Cc.id_contract) as employer_name,\n"
            + "	 (SELECT J.title FROM tblContract C, tblJob J WHERE C.id_job = J.id_job AND C.id_contract = Cc.id_contract) as job_title\n"
            + "FROM tblContract Cc, tblFreelancer F, tblUser U WHERE Cc.id_freelancer = F.id_freelancer AND F.id_freelancer = U.id_user AND Cc.status = ? AND U.id_user = ? ORDER BY Cc.create_date DESC";
    private final String FILTER_CONTRACT_FOR_HISTORY_FOR_EMPLOYER = "SELECT Cc.id_contract, Cc.create_date, Cc.status, U.fullname as employer_name,\n"
            + "	(SELECT U.fullname FROM tblContract C, tblFreelancer F, tblUser U WHERE C.id_freelancer = F.id_freelancer AND F.id_freelancer = U.id_user AND C.id_contract = Cc.id_contract) as freelancer_name,\n"
            + "    (SELECT J.title FROM tblContract C, tblJob J WHERE C.id_job = J.id_job AND C.id_contract = Cc.id_contract) as job_title\n"
            + "FROM tblContract Cc, tblEmployer E, tblUser U WHERE Cc.id_employer = E.id_employer AND E.id_employer = U.id_user AND Cc.status = ? AND U.id_user = ? ORDER BY Cc.create_date DESC";
    private final String GET_ALL_CONTRACT_FOR_WORKSPACE = "SELECT CC.id_contract, U.fullname, J.title, J.start_date, J.duration,J.salary,Cc.id_job, DATEDIFF(HOUR, GETDATE(), DATEADD(day,J.duration, J.start_date)) remainingTime, DATEADD(day,J.duration, J.start_date) end_date,\n"
            + "(SELECT U.fullname FROM tblEmployer E, tblUser U, tblContract C WHERE C.id_employer = E.id_employer AND E.id_employer = U.id_user AND C.id_contract = CC.id_contract) as employerName,\n"
            + "(SELECT U.id_user FROM tblEmployer E, tblUser U, tblContract C WHERE C.id_employer = E.id_employer AND E.id_employer = U.id_user AND C.id_contract = CC.id_contract) as idEmployer,\n"
            + "(SELECT U.avatar FROM tblEmployer E, tblUser U, tblContract C WHERE C.id_employer = E.id_employer AND E.id_employer = U.id_user AND C.id_contract = CC.id_contract) as employerAvatar\n"
            + "FROM tblContract Cc, tblJob J, tblFreelancer F, tblUser U WHERE Cc.id_freelancer = F.id_freelancer AND F.id_freelancer = U.id_user AND Cc.id_job = J.id_job AND Cc.status = 0 AND F.id_freelancer = ?";
    private final String GET_ALL_CONTRACT_FOR_WORKSPACE_FOR_EMPLOYER = "SELECT CC.id_contract, U.fullname, J.title, J.start_date, J.duration,J.salary, Cc.id_job, DATEDIFF(HOUR, GETDATE(), DATEADD(day,J.duration, J.start_date)) remainingTime, DATEADD(day,J.duration, J.start_date) end_date,\n"
            + "(SELECT U.fullname FROM tblFreelancer F, tblUser U, tblContract C WHERE C.id_freelancer = F.id_freelancer AND F.id_freelancer = U.id_user AND C.id_contract = CC.id_contract) as freelancerName,\n"
            + "(SELECT U.id_user FROM tblFreelancer F, tblUser U, tblContract C WHERE C.id_freelancer = F.id_freelancer AND F.id_freelancer = U.id_user AND C.id_contract = CC.id_contract) as idFreelancer,\n"
            + "(SELECT U.avatar FROM tblFreelancer F, tblUser U, tblContract C WHERE C.id_freelancer = F.id_freelancer AND F.id_freelancer = U.id_user AND C.id_contract = CC.id_contract) as freelancerAvatar\n"
            + "FROM tblContract Cc, tblJob J, tblEmployer E, tblUser U WHERE Cc.id_job = J.id_job AND E.id_employer = Cc.id_employer AND E.id_employer = J.id_employer AND E.id_employer = u.id_user AND Cc.status = 0 AND Cc.id_employer = ?";
    private final String GET_ALL_CONTRACT_DETAIL_FOR_WORKSPACE = "SELECT J.title, J.salary, J.description, J.start_date, DATEADD(day,J.duration, J.start_date) end_date, U.fullname, \n"
            + "(SELECT U.fullname FROM tblContract C, tblEmployer E, tblUser U WHERE E.id_employer = C.id_employer AND E.id_employer = U.id_user AND C.id_contract = Cc.id_contract ) employerName\n"
            + "FROM tblContract Cc, tblJob J, tblFreelancer F, tblUser U WHERE Cc.id_job = J.id_job AND Cc.id_freelancer = F.id_freelancer AND F.id_freelancer = U.id_user AND Cc.id_freelancer = ? AND Cc.id_job = ?";
    private final String GET_ALL_CONTRACT_DETAIL_FOR_WORKSPACE_FOR_EMPLOYER = "SELECT J.title, J.salary, J.description, J.start_date, DATEADD(day,J.duration, J.start_date) end_date, U.fullname, \n"
            + "(SELECT U.fullname FROM tblContract C, tblEmployer E, tblUser U WHERE E.id_employer = C.id_employer AND E.id_employer = U.id_user AND C.id_contract = Cc.id_contract ) employerName\n"
            + "FROM tblContract Cc, tblJob J, tblFreelancer F, tblUser U WHERE Cc.id_job = J.id_job AND Cc.id_freelancer = F.id_freelancer AND F.id_freelancer = U.id_user AND Cc.id_employer = ? AND Cc.id_job = ?";
    private final String UPDATE_CONTRACT_AFTER_FEEDBACK = "UPDATE tblContract SET status = 1 WHERE id_job = ?";
    private final String COUNT_JOB_DONE = "SELECT COUNT(F.id_freelancer) jobDone FROM tblContract C, tblFreelancer F\n"
            + "WHERE C.id_freelancer = F.id_freelancer AND C.status = 1 AND F.id_freelancer = ? GROUP BY F.id_freelancer";

    MilestoneDAO milestoneDao = new MilestoneDAO();

    public List<ContractDTO> getAllContractForHistory(int id_user) throws SQLException {
        List<ContractDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_CONTRACT_FOR_HISTORY);
                ptm.setInt(1, id_user);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_contract = rs.getInt("id_contract");
                    String[] split = rs.getString("create_date").split(" ");
                    String create_date = split[0];
                    int status = rs.getInt("status");
                    String job_title = rs.getString("job_title");
                    String freelancer_name = rs.getString("freelancer_name");
                    String employer_name = rs.getString("employer_name");
                    list.add(new ContractDTO(id_contract, create_date, freelancer_name, employer_name, job_title, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }

    public List<ContractDTO> getAllContractForHistoryForEmployer(int id_user) throws SQLException {
        List<ContractDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_CONTRACT_FOR_HISTORY_FOR_EMPLOYER);
                ptm.setInt(1, id_user);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_contract = rs.getInt("id_contract");
                    String[] split = rs.getString("create_date").split(" ");
                    String create_date = split[0];
                    int status = rs.getInt("status");
                    String job_title = rs.getString("job_title");
                    String freelancer_name = rs.getString("freelancer_name");
                    String employer_name = rs.getString("employer_name");
                    list.add(new ContractDTO(id_contract, create_date, freelancer_name, employer_name, job_title, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }

    public ContractDTO getContractById(int id_contract) throws SQLException {
        ContractDTO contract = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_CONTRACT_BY_ID);
                ptm.setInt(1, id_contract);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String[] split = rs.getString("create_date").split(" ");
                    String create_date = split[0];
                    int status = rs.getInt("status");
                    String title = rs.getString("title");
                    Double salary = rs.getDouble("salary");
                    String description = rs.getString("description");
                    Double duration = rs.getDouble("duration");
                    contract = new ContractDTO(id_contract, create_date, title, status, salary, description, duration);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return contract;
    }

    public boolean addAContract(int id_freelancer, int id, int id_job) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        String sql = "INSERT INTO [dbo].[tblContract]\n"
                + "           ([id_freelancer]\n"
                + "           ,[id_employer]\n"
                + "           ,[id_job]\n"
                + "           ,[status])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?)";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id_freelancer);
                ptm.setInt(2, id);
                ptm.setInt(3, id_job);
                ptm.setInt(4, 0);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }

    public List<ContractDTO> filterContractForHistory(int id_user, int contractStatus) throws SQLException {
        List<ContractDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FILTER_CONTRACT_FOR_HISTORY);
                ptm.setInt(1, contractStatus);
                ptm.setInt(2, id_user);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_contract = rs.getInt("id_contract");
                    String[] split = rs.getString("create_date").split(" ");
                    String create_date = split[0];
                    int status = rs.getInt("status");
                    String job_title = rs.getString("job_title");
                    String freelancer_name = rs.getString("freelancer_name");
                    String employer_name = rs.getString("employer_name");
                    list.add(new ContractDTO(id_contract, create_date, freelancer_name, employer_name, job_title, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }

    public List<ContractDTO> filterContractForHistoryForEmployer(int id_user, int contractStatus) throws SQLException {
        List<ContractDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(FILTER_CONTRACT_FOR_HISTORY_FOR_EMPLOYER);
                ptm.setInt(1, contractStatus);
                ptm.setInt(2, id_user);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_contract = rs.getInt("id_contract");
                    String[] split = rs.getString("create_date").split(" ");
                    String create_date = split[0];
                    int status = rs.getInt("status");
                    String job_title = rs.getString("job_title");
                    String freelancer_name = rs.getString("freelancer_name");
                    String employer_name = rs.getString("employer_name");
                    list.add(new ContractDTO(id_contract, create_date, freelancer_name, employer_name, job_title, status));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }

    public List<ContractDTO> getContractForWorkspace(int id_user) throws SQLException {
        List<ContractDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_CONTRACT_FOR_WORKSPACE);
                ptm.setInt(1, id_user);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String fullname = rs.getString("fullname");
                    String title = rs.getString("title");
                    String start_date = rs.getString("start_date");
                    Double duration = rs.getDouble("duration");
                    String employerName = rs.getString("employerName");
                    String employerAvatar = rs.getString("employerAvatar");
                    Double remainingtime = Double.valueOf(rs.getInt("remainingtime"));
                    int id_job = rs.getInt("id_job");
                    int idPartner = rs.getInt("idEmployer");
                    int idContract = rs.getInt("id_contract");
                    String end_date = rs.getString("end_date");
                    Double salary = rs.getDouble("salary");
                    list.add(new ContractDTO(fullname, employerName, title, duration, start_date, employerAvatar, remainingtime, id_job, idPartner, end_date, salary,idContract));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }

    public List<ContractDTO> getContractForWorkspaceForEmployer(int id_user) throws SQLException {
        List<ContractDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_CONTRACT_FOR_WORKSPACE_FOR_EMPLOYER);
                ptm.setInt(1, id_user);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String fullname = rs.getString("fullname");
                    String title = rs.getString("title");
                    String start_date = rs.getString("start_date");
                    Double duration = rs.getDouble("duration");
                    String freelancerName = rs.getString("freelancerName");
                    String freelancerAvatar = rs.getString("freelancerAvatar");
                    Double remainingtime = Double.valueOf(rs.getInt("remainingtime"));
                    int id_job = rs.getInt("id_job");
                    int idContract = rs.getInt("id_contract");
                    int idPartner = rs.getInt("idFreelancer");
                    String end_date = rs.getString("end_date");
                    Double salary = rs.getDouble("salary");
                    list.add(new ContractDTO(freelancerName, fullname, title, duration, start_date, freelancerAvatar, remainingtime, id_job, idPartner, end_date, salary,idContract));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return list;
    }

    public ContractDTO getContractDetailForWorkspace(int id_user, int id_job) throws SQLException {
        ContractDTO contract = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            FileDAO file = new FileDAO();
            PaymentDAO payment = new PaymentDAO();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_CONTRACT_DETAIL_FOR_WORKSPACE);
                ptm.setInt(1, id_user);
                ptm.setInt(2, id_job);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String title = rs.getString("title");
                    Double salary = rs.getDouble("salary");
                    String description = rs.getString("description");
                    String start_date = rs.getString("start_date");
                    String end_date = rs.getString("end_date");
                    String fullname = rs.getString("fullname");
                    String employerName = rs.getString("employerName");
                    List<MilestoneDTO> listMilestone = milestoneDao.getAllMilestoneByIdJob(id_job);
                    int totalFile = file.countFile(id_job);
                    int statusPayment = payment.checkStatusPayment(id_job);
                    int size = listMilestone.size();
                    contract = new ContractDTO(title, salary, description, start_date, end_date, fullname, employerName, id_job, listMilestone, totalFile, statusPayment, size);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return contract;
    }

    public ContractDTO getContractDetailForWorkspaceForEmployer(int id_user, int id_job) throws SQLException {
        ContractDTO contract = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            FileDAO file = new FileDAO();
            PaymentDAO payment = new PaymentDAO();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_ALL_CONTRACT_DETAIL_FOR_WORKSPACE_FOR_EMPLOYER);
                ptm.setInt(1, id_user);
                ptm.setInt(2, id_job);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    String title = rs.getString("title");
                    Double salary = rs.getDouble("salary");
                    String description = rs.getString("description");
                    String start_date = rs.getString("start_date");
                    String end_date = rs.getString("end_date");
                    String fullname = rs.getString("fullname");
                    String employerName = rs.getString("employerName");
                    List<MilestoneDTO> listMilestone = milestoneDao.getAllMilestoneByIdJob(id_job);
                    int totalFile = file.countFile(id_job);
                    int statusPayment = payment.checkStatusPayment(id_job);
                    int size = listMilestone.size();
                    contract = new ContractDTO(title, salary, description, start_date, end_date, fullname, employerName, id_job, listMilestone, totalFile, statusPayment, size);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm, rs);
        }
        return contract;
    }

    public boolean updateContractAfterFeedback(int id_job) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_CONTRACT_AFTER_FEEDBACK);
                ptm.setInt(1, id_job);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtils.closeConnection(conn, ptm);
        }
        return check;
    }

    public int countJobDone(int id_freelancer) throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(COUNT_JOB_DONE);
                ptm.setInt(1, id_freelancer);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    count = rs.getInt("jobDone");
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
