package status;

public class StatusDTO {
    private int id_status;
    private String status_name;

    public StatusDTO() {
    }

    public StatusDTO(int id_status, String status_name) {
        this.id_status = id_status;
        this.status_name = status_name;
    }

    public int getId_status() {
        return id_status;
    }

    public void setId_status(int id_status) {
        this.id_status = id_status;
    }

    public String getStatus_name() {
        return status_name;
    }

    public void setStatus_name(String status_name) {
        this.status_name = status_name;
    }
}
