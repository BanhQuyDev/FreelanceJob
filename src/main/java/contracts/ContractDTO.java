/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package contracts;

import utils.Utils;

/**
 *
 * @author Admin
 */
public class ContractDTO {

    private int id_contract;
    private String contract_create_date;
    private String contract_freelancer_name;
    private String contract_employer_name;
    private String contract_job_tittle;
    private int contract_status;
    private double contract_job_price;
    private String contract_job_description;
    private double contract_job_duration;
    private String contract_job_start_date;
    private String contract_user_avatar;
    private double contract_remaining_time;
    private int contract_job_id;
    private int idPartner;
    private String contract_job_end_date;

    public ContractDTO() {
    }

    public ContractDTO(int id_contract, String contract_create_date, String contract_freelancer_name, String contract_employer_name, String contract_job_tittle, int contract_status) {
        this.id_contract = id_contract;
        this.contract_create_date = contract_create_date;
        this.contract_freelancer_name = contract_freelancer_name;
        this.contract_employer_name = contract_employer_name;
        this.contract_job_tittle = contract_job_tittle;
        this.contract_status = contract_status;
    }

    public ContractDTO(int id_contract, String contract_create_date, String contract_freelancer_name, String contract_employer_name, String contract_job_tittle, int contract_status, double contract_job_price, String contract_job_description, double contract_job_duration) {
        this.id_contract = id_contract;
        this.contract_create_date = contract_create_date;
        this.contract_freelancer_name = contract_freelancer_name;
        this.contract_employer_name = contract_employer_name;
        this.contract_job_tittle = contract_job_tittle;
        this.contract_status = contract_status;
        this.contract_job_price = contract_job_price;
        this.contract_job_description = contract_job_description;
        this.contract_job_duration = contract_job_duration;
    }

    public ContractDTO(int id_contract, String contract_create_date, String contract_job_tittle, int contract_status, double contract_job_price, String contract_job_description, double contract_job_duration) {
        this.id_contract = id_contract;
        this.contract_create_date = contract_create_date;
        this.contract_job_tittle = contract_job_tittle;
        this.contract_status = contract_status;
        this.contract_job_price = contract_job_price;
        this.contract_job_description = contract_job_description;
        this.contract_job_duration = contract_job_duration;
    }

    public ContractDTO(String contract_freelancer_name, String contract_employer_name, String contract_job_tittle, double contract_job_duration, String contract_job_start_date, String contract_user_avatar, double contract_remaining_time, int contract_job_id,int idPartner) {
        this.contract_freelancer_name = contract_freelancer_name;
        this.contract_employer_name = contract_employer_name;
        this.contract_job_tittle = contract_job_tittle;
        this.contract_job_duration = contract_job_duration;
        this.contract_job_start_date = contract_job_start_date;
        this.contract_user_avatar = contract_user_avatar;
        this.contract_remaining_time = contract_remaining_time;
        this.contract_job_id = contract_job_id;
        this.idPartner = idPartner;
    }

    public ContractDTO(String contract_job_tittle, double contract_job_price, String contract_job_description, String contract_job_start_date, String contract_job_end_date, String contract_freelancer_name, String contract_employer_name) {
        this.contract_job_tittle = contract_job_tittle;
        this.contract_job_price = contract_job_price;
        this.contract_job_description = contract_job_description;
        this.contract_job_start_date = contract_job_start_date;
        this.contract_job_end_date = contract_job_end_date;
        this.contract_freelancer_name = contract_freelancer_name;
        this.contract_employer_name = contract_employer_name;
    }

    public int getId_contract() {
        return id_contract;
    }

    public void setId_contract(int id_contract) {
        this.id_contract = id_contract;
    }

    public String getContract_create_date() {
        return contract_create_date;
    }

    public void setContract_create_date(String contract_create_date) {
        this.contract_create_date = contract_create_date;
    }

    public String getContract_freelancer_name() {
        return contract_freelancer_name;
    }

    public void setContract_freelancer_name(String contract_freelancer_name) {
        this.contract_freelancer_name = contract_freelancer_name;
    }

    public String getContract_employer_name() {
        return contract_employer_name;
    }

    public void setContract_employer_name(String contract_employer_name) {
        this.contract_employer_name = contract_employer_name;
    }

    public String getContract_job_tittle() {
        return contract_job_tittle;
    }

    public void setContract_job_tittle(String contract_job_tittle) {
        this.contract_job_tittle = contract_job_tittle;
    }

    public int getContract_status() {
        return contract_status;
    }

    public void setContract_status(int contract_status) {
        this.contract_status = contract_status;
    }

    public double getContract_job_price() {
        return contract_job_price;
    }

    public void setContract_job_price(double contract_job_price) {
        this.contract_job_price = contract_job_price;
    }

    public String getContract_job_description() {
        return contract_job_description;
    }

    public void setContract_job_description(String contract_job_description) {
        this.contract_job_description = contract_job_description;
    }

    public double getContract_job_duration() {
        return contract_job_duration;
    }

    public void setContract_job_duration(double contract_job_duration) {
        this.contract_job_duration = contract_job_duration;
    }

    public String getContract_job_start_date() {
        return contract_job_start_date;
    }

    public void setContract_job_start_date(String contract_job_start_date) {
        this.contract_job_start_date = contract_job_start_date;
    }

    public String getContract_user_avatar() {
        return contract_user_avatar;
    }

    public void setContract_user_avatar(String contract_user_avatar) {
        this.contract_user_avatar = contract_user_avatar;
    }

    public double getContract_remaining_time() {
        return contract_remaining_time;
    }

    public void setContract_remaining_time(double contract_remaining_time) {
        this.contract_remaining_time = contract_remaining_time;
    }

    public int getContract_job_id() {
        return contract_job_id;
    }

    public void setContract_job_id(int contract_job_id) {
        this.contract_job_id = contract_job_id;
    }

    public String getContract_job_end_date() {
        return contract_job_end_date;
    }

    public void setContract_job_end_date(String contract_job_end_date) {
        this.contract_job_end_date = contract_job_end_date;
    }

    public String showPrice(double price) {
        return Utils.convertPrice(price);
    }

    public String showDuration(double duration) {
        return Utils.convertPrice(duration);
    }

    public int getIdPartner() {
        return idPartner;
    }

    public void setIdPartner(int idPartner) {
        this.idPartner = idPartner;
    }
    

}
