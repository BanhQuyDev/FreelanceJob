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
public class SkillDTO {
    private int skillId;
    private String name;

    public SkillDTO() {
    }
    public SkillDTO(int skillId, String name) {
        this.skillId = skillId;
        this.name = name;
    }

    public int getSkillId() {
        return skillId;
    }

    public void setSkillId(int skillId) {
        this.skillId = skillId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "SkillDTO{" + "id=" + skillId + ", name=" + name + '}';
    }
    
    
}
