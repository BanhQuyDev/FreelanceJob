/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package feedbacks;

/**
 *
 * @author Admin
 */
public class FeedbackDTO {

    private int id_feedback;
    private String feedback_content;
    private int feedback_rating;
    private String feedback_id_freelancer;
    private String feedback_id_employer;
    private int feedback_status;
    private int feedback_avg_rating;
    private String feedback_freelancer_name;
    private String feedback_freelancer_avatar;
    private int feedback_job_done;

    public FeedbackDTO() {
    }

    public FeedbackDTO(int id_feedback, String feedback_content, int feedback_rating, String feedback_id_freelancer, String feedback_id_employer, int feedback_status) {
        this.id_feedback = id_feedback;
        this.feedback_content = feedback_content;
        this.feedback_rating = feedback_rating;
        this.feedback_id_freelancer = feedback_id_freelancer;
        this.feedback_id_employer = feedback_id_employer;
        this.feedback_status = feedback_status;
    }

    public FeedbackDTO(int feedback_avg_rating, String feedback_freelancer_name, String feedback_freelancer_avatar, int feedback_job_done) {
        this.feedback_avg_rating = feedback_avg_rating;
        this.feedback_freelancer_name = feedback_freelancer_name;
        this.feedback_freelancer_avatar = feedback_freelancer_avatar;
        this.feedback_job_done = feedback_job_done;
    }

    public int getId_feedback() {
        return id_feedback;
    }

    public void setId_feedback(int id_feedback) {
        this.id_feedback = id_feedback;
    }

    public String getFeedback_content() {
        return feedback_content;
    }

    public void setFeedback_content(String feedback_content) {
        this.feedback_content = feedback_content;
    }

    public int getFeedback_rating() {
        return feedback_rating;
    }

    public void setFeedback_rating(int feedback_rating) {
        this.feedback_rating = feedback_rating;
    }

    public String getFeedback_id_freelancer() {
        return feedback_id_freelancer;
    }

    public void setFeedback_id_freelancer(String feedback_id_freelancer) {
        this.feedback_id_freelancer = feedback_id_freelancer;
    }

    public String getFeedback_id_employer() {
        return feedback_id_employer;
    }

    public void setFeedback_id_employer(String feedback_id_employer) {
        this.feedback_id_employer = feedback_id_employer;
    }

    public int getFeedback_status() {
        return feedback_status;
    }

    public void setFeedback_status(int feedback_status) {
        this.feedback_status = feedback_status;
    }

    public int getFeedback_avg_rating() {
        return feedback_avg_rating;
    }

    public void setFeedback_avg_rating(int feedback_avg_rating) {
        this.feedback_avg_rating = feedback_avg_rating;
    }

    public String getFeedback_freelancer_name() {
        return feedback_freelancer_name;
    }

    public void setFeedback_freelancer_name(String feedback_freelancer_name) {
        this.feedback_freelancer_name = feedback_freelancer_name;
    }

    public String getFeedback_freelancer_avatar() {
        return feedback_freelancer_avatar;
    }

    public void setFeedback_freelancer_avatar(String feedback_freelancer_avatar) {
        this.feedback_freelancer_avatar = feedback_freelancer_avatar;
    }

    public int getFeedback_job_done() {
        return feedback_job_done;
    }

    public void setFeedback_job_done(int feedback_job_done) {
        this.feedback_job_done = feedback_job_done;
    }

}
