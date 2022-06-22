/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package reports;

import jobs.JobDTO;

/**
 *
 * @author Tung Nguyen
 */
public class JobReportDTO {
    private int id_report;
    private JobDTO jobReport;
    private String content_report;
    private int id_user_report;
    private String fullname_user_report;
    private String avatar_user_report;
    private int numOfReport;
    private String create_date;

    public JobReportDTO() {
    }

    public JobReportDTO(JobDTO jobReport, int numOfReport) {
        this.jobReport = jobReport;
        this.numOfReport = numOfReport;
    }

    public JobReportDTO(int id_report, JobDTO jobReport, String content_report, int id_user_report, String fullname_user_report, String avatar_user_report, int numOfReport, String create_date) {
        this.id_report = id_report;
        this.jobReport = jobReport;
        this.content_report = content_report;
        this.id_user_report = id_user_report;
        this.fullname_user_report = fullname_user_report;
        this.avatar_user_report = avatar_user_report;
        this.numOfReport = numOfReport;
        this.create_date = create_date;
    }

    public JobReportDTO(JobDTO jobReport, String content_report, int id_user_report) {
        this.jobReport = jobReport;
        this.content_report = content_report;
        this.id_user_report = id_user_report;
    }
    
    public int getId_report() {
        return id_report;
    }

    public void setId_report(int id_report) {
        this.id_report = id_report;
    }

    public JobDTO getJobReport() {
        return jobReport;
    }

    public void setJobReport(JobDTO jobReport) {
        this.jobReport = jobReport;
    }

    public String getContent_report() {
        return content_report;
    }

    public void setContent_report(String content_report) {
        this.content_report = content_report;
    }

    public int getId_user_report() {
        return id_user_report;
    }

    public void setId_user_report(int id_user_report) {
        this.id_user_report = id_user_report;
    }

    public String getCreate_date() {
        return create_date;
    }

    public void setCreate_date(String create_date) {
        this.create_date = create_date;
    }

    public String getFullname_user_report() {
        return fullname_user_report;
    }

    public void setFullname_user_report(String fullname_user_report) {
        this.fullname_user_report = fullname_user_report;
    }

    public int getNumOfReport() {
        return numOfReport;
    }

    public void setNumOfReport(int numOfReport) {
        this.numOfReport = numOfReport;
    }

    public String getAvatar_user_report() {
        return avatar_user_report;
    }

    public void setAvatar_user_report(String avatar_user_report) {
        this.avatar_user_report = avatar_user_report;
    }
    
    
}
