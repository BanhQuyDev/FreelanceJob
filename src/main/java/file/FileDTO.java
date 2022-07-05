/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package file;

/**
 *
 * @author QUANG HUY
 */
public class FileDTO {

    private int id;
    private String urlS3;
    private int idJob;
    private String titleJob;

    public FileDTO() {
        this.id = 0;
        this.urlS3 = "";
        this.idJob = 0;
    }

    public FileDTO(int id, String urlS3, int idJob) {
        this.id = id;
        this.urlS3 = urlS3;
        this.idJob = idJob;
    }

    public FileDTO(int id, String urlS3, String titleJob) {
        this.id = id;
        this.urlS3 = urlS3;
        this.titleJob = titleJob;
    }

    public String getTitleJob() {
        return titleJob;
    }

    public void setTitleJob(String titleJob) {
        this.titleJob = titleJob;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUrlS3() {
        return urlS3;
    }

    public void setUrlS3(String urlS3) {
        this.urlS3 = urlS3;
    }

    public int getIdJob() {
        return idJob;
    }

    public void setIdJob(int idJob) {
        this.idJob = idJob;
    }

}
