/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jobs;

import utils.Utils;

/**
 *
 * @author QUANG HUY
 */
public class JobDTO {

    private int idJob;
    private String title;
    private double salary;
    private String description;
    private double duration;
    private String startDate;
    private String status;
    private int idEmployer;
    private String nameEmployer;
    private String idMajor;
    private String createDate;
    private String[]skillJob;

    public JobDTO() {

    }

    public JobDTO(int idJob) {
        this.idJob = idJob;
    }
    public JobDTO(int idJob, String title) {
        this.idJob = idJob;
        this.title = title;
    }

    public JobDTO(int idJob, String title, double salary, String description, double duration, String startDate, String status, int idEmployer, String nameEmployer, String idMajor, String createDate) {
        this.idJob = idJob;
        this.title = title;
        this.salary = salary;
        this.description = description;
        this.duration = duration;
        this.startDate = startDate;
        this.status = status;
        this.idEmployer = idEmployer;
        this.nameEmployer = nameEmployer;
        this.idMajor = idMajor;
        this.createDate = createDate;
    }

    public JobDTO(int idJob, String title, double salary, String description, double duration, String startDate, String status, String nameEmployer, String idMajor) {
        this.idJob = idJob;
        this.title = title;
        this.salary = salary;
        this.description = description;
        this.duration = duration;
        this.startDate = startDate;
        this.status = status;
        this.nameEmployer = nameEmployer;
        this.idMajor = idMajor;
    }

    public JobDTO(int idJob, String title, double salary, String description, double duration, String startDate, String status, String nameEmployer, String idMajor, String createDate) {
        this.idJob = idJob;
        this.title = title;
        this.salary = salary;
        this.description = description;
        this.duration = duration;
        this.startDate = startDate;
        this.status = status;
        this.nameEmployer = nameEmployer;
        this.idMajor = idMajor;
        this.createDate = createDate;
    }

    public JobDTO(String title, double salary, String description, double duration, String startDate, String status, int idEmployer, String idMajor, String[] skillJob) {
        this.title = title;
        this.salary = salary;
        this.description = description;
        this.duration = duration;
        this.startDate = startDate;
        this.status = status;
        this.idEmployer = idEmployer;
        this.idMajor = idMajor;
        this.skillJob = skillJob;
    }

    public int getIdJob() {
        return idJob;
    }

    public void setIdJob(int idJob) {
        this.idJob = idJob;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getDuration() {
        return duration;
    }

    public void setDuration(double duration) {
        this.duration = duration;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNameEmployer() {
        return nameEmployer;
    }

    public void setNameEmployer(String nameEmployer) {
        this.nameEmployer = nameEmployer;
    }

    public String getIdMajor() {
        return idMajor;
    }

    public void setIdMajor(String idMajor) {
        this.idMajor = idMajor;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public int getIdEmployer() {
        return idEmployer;
    }

    public void setIdEmployer(int idEmployer) {
        this.idEmployer = idEmployer;
    }

    public String[] getSkillJob() {

        return skillJob;
    }

    public void setSkillJob(String[] skillJob) {
        this.skillJob = skillJob;
    }

    
    public String showPrice(double price) {
        return Utils.convertPrice(price);
    }
}
