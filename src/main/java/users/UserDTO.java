/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

/**
 *
 * @author QUANG HUY
 */
public class UserDTO {
    private int id;
    private String name;
    private String email;
    private String dob;
    private String address;
    private String bio;
    private String phone;
    private String picture;
    private int numOfSpam;

    public UserDTO() {
    }

    public UserDTO(int id, String name, String email, String dob, String address, String bio, String phone, String picture) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.dob = dob;
        this.address = address;
        this.bio = bio;
        this.phone = phone;
        this.picture = picture;
    }

    public UserDTO(int id, String name, String email, String dob, String address, String bio, String phone, String picture, int numOfSpam) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.dob = dob;
        this.address = address;
        this.bio = bio;
        this.phone = phone;
        this.picture = picture;
        this.numOfSpam = numOfSpam;
    }

    public UserDTO(String name, String email, String picture) {
        this.name = name;
        this.email = email;
        this.picture = picture;
    }
    public UserDTO(String name, String email) {
        this.name = name;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getNumOfSpam() {
        return numOfSpam;
    }

    public void setNumOfSpam(int numOfSpam) {
        this.numOfSpam = numOfSpam;
    }

}
