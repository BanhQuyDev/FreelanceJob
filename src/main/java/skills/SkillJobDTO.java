/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package skills;

/**
 *
 * @author QUANG HUY
 */
public class SkillJobDTO {
    private int idSkillJob;
    private int idSkill;
    private int idJob;

    public SkillJobDTO(int idSkillJob, int idSkill, int idJob) {
        this.idSkillJob = idSkillJob;
        this.idSkill = idSkill;
        this.idJob = idJob;
    }

    public SkillJobDTO() {
    }

    public int getIdSkillJob() {
        return idSkillJob;
    }

    public void setIdSkillJob(int idSkillJob) {
        this.idSkillJob = idSkillJob;
    }

    public int getIdSkill() {
        return idSkill;
    }

    public void setIdSkill(int idSkill) {
        this.idSkill = idSkill;
    }

    public int getIdJob() {
        return idJob;
    }

    public void setIdJob(int idJob) {
        this.idJob = idJob;
    }
    
}
