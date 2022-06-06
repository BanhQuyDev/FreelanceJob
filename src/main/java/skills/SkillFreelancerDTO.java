/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package skills;

/**
 *
 * @author Thiep Ngo
 */
public class SkillFreelancerDTO {
    private int id_freelancer;
    private String skill_name;

    public SkillFreelancerDTO() {
    }
  
    public SkillFreelancerDTO(int id_freelancer, String skill_name) {
        this.id_freelancer = id_freelancer;
        this.skill_name = skill_name;
    }

    public int getId_freelancer() {
        return id_freelancer;
    }

    public void setId_freelancer(int id_freelancer) {
        this.id_freelancer = id_freelancer;
    }

    public String getSkill_name() {
        return skill_name;
    }

    public void setSkill_name(String skill_name) {
        this.skill_name = skill_name;
    }

}
