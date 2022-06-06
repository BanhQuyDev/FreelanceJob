/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package majors;


public class MajorDTO {
    
    private String id_major;
    private String major_name;
    private String image_major;

    public MajorDTO() {
    }

    public MajorDTO(String id_major, String major_name,String image_major) {
        this.id_major = id_major;
        this.major_name = major_name;
        this.image_major = image_major;
    }
    public MajorDTO(String id_major, String major_name) {
        this.id_major = id_major;
        this.major_name = major_name;
    }

    public String getId_major() {
        return id_major;
    }

    public void setId_major(String id_major) {
        this.id_major = id_major;
    }

    public String getMajor_name() {
        return major_name;
    }

    public void setMajor_name(String major_name) {
        this.major_name = major_name;
    }   

    public String getImage_major() {
        return image_major;
    }

    public void setImage_major(String image_major) {
        this.image_major = image_major;
    }
    
    @Override
    public String toString() {
        return "MajorDTO{" + "id=" + id_major + ", name=" + major_name + '}';
    }
}
