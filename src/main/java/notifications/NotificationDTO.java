package notifications;

public class NotificationDTO {

    private int id_noti;
    private int id_user;
    private String content;
    private int id_status;
    private String employerName;
    private String avatar;
    private int id_sender;
    private String timeAgo;

    public NotificationDTO(int id_noti, int id_user, String content, String employerName, String avatar, String timeAgo) {
        this.id_noti = id_noti;
        this.id_user = id_user;
        this.content = content;
        this.employerName = employerName;
        this.avatar = avatar;
        this.timeAgo = timeAgo;
    }

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

    public int getId_sender() {
        return id_sender;
    }

    public void setId_sender(int id_sender) {
        this.id_sender = id_sender;
    }

    public String getEmployerName() {
        return employerName;
    }

    public void setEmployerName(String employerName) {
        this.employerName = employerName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
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

    public String getTimeAgo() {
        return timeAgo;
    }

    public void setTimeAgo(String timeAgo) {
        this.timeAgo = timeAgo;
    }
}
