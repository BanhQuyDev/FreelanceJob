/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jobs;

/**
 *
 * @author Thiep Ngo
 */
public class JobApplicationDTO {

    private int id_application;
    private int id_freelancer;
    private int id_job;
    private String fullName;
    private String email;
    private String picture;
    private String title;
    private String note;

    public JobApplicationDTO() {
    }

    public JobApplicationDTO(int id_freelancer, int id_job) {
        this.id_freelancer = id_freelancer;
        this.id_job = id_job;
    }

    public JobApplicationDTO(int id_freelancer, String fullName, String email, String title, String picture, int id_job) {
        this.id_freelancer = id_freelancer;
        this.fullName = fullName;
        this.email = email;
        this.title = title;
        this.picture = picture;
        this.id_job = id_job;
       
    }
    public JobApplicationDTO(int id_freelancer, String fullName, String email, String title, String picture, int id_job, String note) {
        this.id_freelancer = id_freelancer;
        this.fullName = fullName;
        this.email = email;
        this.title = title;
        this.picture = picture;
        this.id_job = id_job;
        this.note = note;
    }

    public JobApplicationDTO(int id_application, int id_freelancer, int id_job, String fullName, String email, String title, String picture) {
        this.id_application = id_application;
        this.id_freelancer = id_freelancer;
        this.id_job = id_job;
        this.fullName = fullName;
        this.email = email;
        this.title = title;
        this.picture = picture;
    }

    public int getId_application() {
        return id_application;
    }

    public void setId_application(int id_application) {
        this.id_application = id_application;
    }

    public int getId_freelancer() {
        return id_freelancer;
    }

    public void setId_freelancer(int id_freelancer) {
        this.id_freelancer = id_freelancer;
    }

    public int getId_job() {
        return id_job;
    }

    public void setId_job(int id_job) {
        this.id_job = id_job;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

}
