/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package milestones;

/**
 *
 * @author Admin
 */
public class MilestoneDTO {

    private int id;
    private String tittle;
    private String startDate;
    private String endDate;
    private int status;
    private int idJob;

    public MilestoneDTO() {
    }

    public MilestoneDTO(int id, String tittle, String startDate, String endDate, int status, int idJob) {
        this.id = id;
        this.tittle = tittle;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
        this.idJob = idJob;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getIdJob() {
        return idJob;
    }

    public void setIdJob(int idJob) {
        this.idJob = idJob;
    }


}
