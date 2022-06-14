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
    private String nameMajor;
    private String createDate;
    private String[] skillJob;
    private int freelancerQuantity;
    private int jobApplication;
    private String createDateJobApplication;
    private int statusJobApplication;



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

    public JobDTO(int idJob, String title, double salary, String description, double duration, String startDate, String status, String nameEmployer, String idMajor, String createDate, int freelancerQuantity) {
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
        this.freelancerQuantity = freelancerQuantity;
    }
    public JobDTO(int idJob, String title, double salary, String description, double duration, String startDate, String status, String nameEmployer, String idMajor, String createDate, int freelancerQuantity,int jobApplication) {
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
        this.freelancerQuantity = freelancerQuantity;
        this.jobApplication = jobApplication;
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

    public JobDTO(int idJob, String title, double salary, String description, double duration, String startDate, String status, int idEmployer, String nameEmployer, String idMajor, String nameMajor, String createDate) {
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
        this.nameMajor = nameMajor;
        this.createDate = createDate;
    }

    public JobDTO(int idJob, String title, double salary, String description, double duration, String startDate, String nameMajor, int jobApplication, String createDateJobApplication, int statusJobApplication) {
        this.idJob = idJob;
        this.title = title;
        this.salary = salary;
        this.description = description;
        this.duration = duration;
        this.startDate = startDate;
        this.nameMajor = nameMajor;
        this.jobApplication = jobApplication;
        this.createDateJobApplication = createDateJobApplication;
        this.statusJobApplication = statusJobApplication;
    }

    public JobDTO(int idJob, String title, String status, String nameMajor, int freelancerQuantity) {
        this.idJob = idJob;
        this.title = title;
        this.status = status;
        this.nameMajor = nameMajor;
        this.freelancerQuantity = freelancerQuantity;
    }

    public JobDTO(int idJob, String title, double salary, String description, double duration, String startDate, String status, String nameEmployer, String id_major, String major_name, String createDate) {
        this.idJob = idJob;
        this.title = title;
        this.salary = salary;
        this.description = description;
        this.duration = duration;
        this.startDate = startDate;
        this.status = status;
        this.nameEmployer = nameEmployer;
        this.idMajor = id_major;
        this.nameMajor = major_name;
        this.createDate = createDate;
    }

    public JobDTO(int idJob, String title, double salary, String description, double duration, String startDate, String major) {
       this.idJob = idJob;
       this.title = title;
       this.salary = salary;
       this.description = description;
       this.duration = duration;
       this.startDate = startDate;
       this.idMajor = major;
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

    public String getNameMajor() {
        return nameMajor;
    }

    public void setNameMajor(String nameMajor) {
        this.nameMajor = nameMajor;
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

    public int getFreelancerQuantity() {
        return freelancerQuantity;
    }

    public void setFreelancerQuantity(int freelancerQuantity) {
        this.freelancerQuantity = freelancerQuantity;
    }

    public String showPrice(double price) {
        return Utils.convertPrice(price);
    }

    public String showDuration(double duration) {
        return Utils.convertPrice(duration);
    }

    public int getJobApplication() {
        return jobApplication;
    }

    public void setJobApplication(int jobApplication) {
        this.jobApplication = jobApplication;
    }

    public String getCreateDateJobApplication() {
        return createDateJobApplication;
    }

    public void setCreateDateJobApplication(String createDateJobApplication) {
        this.createDateJobApplication = createDateJobApplication;
    }

    public int getStatusJobApplication() {
        return statusJobApplication;
    }

    public void setStatusJobApplication(int statusJobApplication) {
        this.statusJobApplication = statusJobApplication;
    }


    
}
