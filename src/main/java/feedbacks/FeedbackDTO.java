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

}
