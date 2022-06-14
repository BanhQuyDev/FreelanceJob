package notifications;

public class NotificationDTO {
    private int id_noti;
    private int id_user;
    private String content;
    private int id_status;

    public NotificationDTO() {
    }

    public NotificationDTO(int id_noti, int id_user, String content, int id_status) {
        this.id_noti = id_noti;
        this.id_user = id_user;
        this.content = content;
        this.id_status = id_status;
    }

    public NotificationDTO(int id_user, String content, int id_status) {
        this.id_user = id_user;
        this.content = content;
        this.id_status = id_status;
    }

    public int getId_noti() {
        return id_noti;
    }

    public void setId_noti(int id_noti) {
        this.id_noti = id_noti;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId_status() {
        return id_status;
    }

    public void setId_status(int id_status) {
        this.id_status = id_status;
    }
}
