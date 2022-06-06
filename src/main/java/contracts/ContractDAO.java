/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package contracts;

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
public class ContractDAO {

    private final String GET_ALL_CONTRACT_FOR_HISTORY = "SELECT Cc.id_contract, Cc.create_date, Cc.status, U.fullname as freelancer_name,\n"
            + "	 (SELECT U.fullname FROM tblContract C, tblEmployer E, tblUser U WHERE C.id_employer = E.id_employer AND E.id_employer = U.id_user AND C.id_contract = Cc.id_contract) as employer_name,\n"
            + "	 (SELECT J.title FROM tblContract C, tblJob J WHERE C.id_job = J.id_job AND C.id_contract = Cc.id_contract) as job_title\n"
            + "FROM tblContract Cc, tblFreelancer F, tblUser U WHERE Cc.id_freelancer = F.id_freelancer AND F.id_freelancer = U.id_user AND U.id_user = ?";
    private final String GET_CONTRACT_BY_ID = "SELECT C.id_contract, C.create_date, C.status, J.title, J.salary, J.description, J.duration\n"
            + "FROM tblContract C, tblJob J WHERE C.id_job = J.id_job AND C.id_contract = ?";

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
}
