/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package skills;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

public class SkillDAO {

    public static final String GET_LIST_SKILL_BY_USER = ""
            + "SELECT [tblSkill].[id_skill],[tblSkill].[skill_name] \n"
            + "FROM ((tblUser INNER JOIN [tblFreelancerSkill] ON [tblUser].[id_user] = [tblFreelancerSkill].[id_freelancer])\n"
            + "INNER JOIN [tblSkill] ON [tblFreelancerSkill].[id_skill] = [tblSkill].[id_skill]) "
            + "WHERE [tblUser].id_user = ?";
    public static final String GET_LIST_SKILL = ""
            + "SELECT [tblSkill].[id_skill], [tblSkill].[skill_name]"
            + "FROM [tblSkill]";

    public List<SkillDTO> getAllSkillByUser(int id) throws SQLException {
        List<SkillDTO> listSkill = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_SKILL_BY_USER);
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int skillId = rs.getInt("id_skill");
                    String skillName = rs.getString("skill_name");
                    listSkill.add(new SkillDTO(skillId, skillName));
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
        return listSkill;
    }

    public List<SkillFreelancerDTO> getAllSkill() throws SQLException {
        List<SkillFreelancerDTO> listSkill = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT [tblFreelancerSkill].[id_freelancer]\n"
                + "      ,[tblSkill].[skill_name]\n"
                + "  FROM [tblFreelancerSkill] INNER JOIN [tblSkill] "
                + "  ON  [tblSkill].[id_skill] = [tblFreelancerSkill].[id_skill]";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_freelancer = rs.getInt("id_freelancer");
                    String skillName = rs.getString("skill_name");
                    listSkill.add(new SkillFreelancerDTO(id_freelancer, skillName));
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
        return listSkill;
    }


    public List<SkillDTO> getAllSkillByUser() throws SQLException {
        List<SkillDTO> listSkill = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GET_LIST_SKILL);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id_skill");
                    String skillName = rs.getString("skill_name");
                    listSkill.add(new SkillDTO(id, skillName));
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
        return listSkill;
    }

    public List<SkillDTO> getListSkillDifference(int id) throws SQLException {
        List<SkillDTO> listSkill = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(""
                        + "SELECT [tblSkill].id_skill, [tblSkill].[skill_name] FROM [tblSkill] WHERE [tblSkill].id_skill NOT IN (\n"
                        + "SELECT [tblSkill].[id_skill]\n"
                        + "                FROM ((tblUser INNER JOIN [tblFreelancerSkill] ON [tblUser].[id_user] = [tblFreelancerSkill].[id_freelancer])\n"
                        + "                INNER JOIN [tblSkill] ON [tblFreelancerSkill].[id_skill] = [tblSkill].[id_skill]) WHERE [tblUser].id_user = ?)");
                ptm.setInt(1, id);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int skillId = rs.getInt("id_skill");
                    String skillName = rs.getString("skill_name");
                    listSkill.add(new SkillDTO(skillId, skillName));
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
        return listSkill;
    }

    public boolean deleteSkill(int id, int skillId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(""
                        + "DELETE FROM [dbo].[tblFreelancerSkill]\n"
                        + "      WHERE [tblFreelancerSkill].id_freelancer = ?"
                        + " AND [tblFreelancerSkill].id_skill = ?");
                ptm.setInt(1, id);
                ptm.setInt(2, skillId);
                int value = ptm.executeUpdate();
                check = value > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }
        }
        return check;
    }

    public boolean addSkill(int id, int skillId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            String sql = "INSERT INTO [dbo].[tblFreelancerSkill]\n"
                    + "           ([id_freelancer]\n"
                    + "           ,[id_skill])\n"
                    + "     VALUES\n"
                    + "           (?, ?)";
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.setInt(2, skillId);
                check = ptm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (ptm != null) {
                ptm.close();
            }

        }
        return check;
    }

    public List<SkillDTO> getSkillUserDuplicate(int id, int skillId) throws SQLException {
        List<SkillDTO> listSkill = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT "
                + "      [id_skill]\n"
                + "  FROM [dbo].[tblFreelancerSkill] "
                + "WHERE [tblFreelancerSkill].[id_freelancer] = ? "
                + "AND [tblFreelancerSkill].[id_skill] = ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.setInt(2, skillId);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_skill = rs.getInt("id_skill");
                    listSkill.add(new SkillDTO(id_skill, ""));
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
        return listSkill;
    }

    public List<SkillDTO> getListSkillByMajor(int id, String majorId) throws SQLException {
        List<SkillDTO> listSkill = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT [tblSkill].id_skill, [tblSkill].[skill_name] FROM ([tblMajor] INNER JOIN [tblSkillByMajor]\n"
                + "ON [tblMajor].[id_major] = [tblSkillByMajor].[id_major] INNER JOIN [tblSkill] ON  [tblSkill].[id_skill] = [tblSkillByMajor].[id_skill])\n"
                + "WHERE [tblSkill].id_skill NOT IN (SELECT [tblSkill].[id_skill]\n"
                + "                 FROM ((tblUser INNER JOIN [tblFreelancerSkill] ON [tblUser].[id_user] = [tblFreelancerSkill].[id_freelancer])\n"
                + "                      INNER JOIN [tblSkill] ON [tblFreelancerSkill].[id_skill] = [tblSkill].[id_skill]\n"
                + "                       INNER JOIN [tblSkillByMajor] ON [tblSkillByMajor].id_skill = [tblSkill].id_skill\n"
                + "                  INNER JOIN [tblMajor] ON [tblMajor].id_major = [tblSkillByMajor].id_major)\n"
                + "                 WHERE [tblUser].id_user = ? AND tblMajor.id_major LIKE ?) \n"
                + "AND tblMajor.id_major LIKE ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.setString(2, "%" + majorId + "%");
                ptm.setString(3, "%" + majorId + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int id_skill = rs.getInt("id_skill");
                    String skill_name = rs.getString("skill_name");
                    listSkill.add(new SkillDTO(id_skill, skill_name));
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
        return listSkill;
    }

    public List<SkillDTO> getAllSkillUserByMajor(int id, String majorId) throws SQLException {
        List<SkillDTO> listSkill = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String sql = "SELECT [tblSkill].[id_skill],[tblSkill].[skill_name] \n"
                + "               FROM ((tblUser INNER JOIN [tblFreelancerSkill] ON [tblUser].[id_user] = [tblFreelancerSkill].[id_freelancer])\n"
                + "                      INNER JOIN [tblSkill] ON [tblFreelancerSkill].[id_skill] = [tblSkill].[id_skill]\n"
                + "                       INNER JOIN [tblSkillByMajor] ON [tblSkillByMajor].id_skill = [tblSkill].id_skill\n"
                + "                  INNER JOIN [tblMajor] ON [tblMajor].id_major = [tblSkillByMajor].id_major)\n"
                + "               WHERE [tblUser].id_user = ? AND [tblMajor].id_major LIKE ?";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(sql);
                ptm.setInt(1, id);
                ptm.setString(2, "%" + majorId + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    int skillId = rs.getInt("id_skill");
                    String skillName = rs.getString("skill_name");
                    listSkill.add(new SkillDTO(skillId, skillName));
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
        return listSkill;
    }
}
