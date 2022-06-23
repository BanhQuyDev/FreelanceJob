/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package chat;

/**
 *
 * @author QUANG HUY
 */
public class ChatDTO {

    private int id;
    private String message;
    private int idSend;
    private String nameSend;
    private int idReceive;
    private String nameReceive;
    private String time;

    public ChatDTO() {
        this.id = 0;
        this.message = "";
        this.idSend = 0;
        this.idReceive = 0;
        this.time = "";
    }

    public ChatDTO( String message, String nameSend,int idSend, String nameReceive,int idRecevice, String time) {
        this.message = message;
        this.nameSend = nameSend;
        this.nameReceive = nameReceive;
        this.idSend = idSend;
        this.idReceive = idRecevice;
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getIdSend() {
        return idSend;
    }

    public void setIdSend(int idSend) {
        this.idSend = idSend;
    }

    public int getIdReceive() {
        return idReceive;
    }

    public void setIdReceive(int idReceive) {
        this.idReceive = idReceive;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getNameSend() {
        return nameSend;
    }

    public void setNameSend(String nameSend) {
        this.nameSend = nameSend;
    }

    public String getNameReceive() {
        return nameReceive;
    }

    public void setNameReceive(String nameReceive) {
        this.nameReceive = nameReceive;
    }
    

}
