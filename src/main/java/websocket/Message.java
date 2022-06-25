package websocket;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public final class Message {

    @JsonProperty("username")
    private final String userName;
    @JsonProperty("message")
    private final String message;
    @JsonProperty("time")
    private final String time;
    @JsonProperty("picture")
    private final String picture;

    @JsonCreator
    public Message(@JsonProperty("username") final String userName, @JsonProperty("message") final String message, 
            @JsonProperty("time") final String time,@JsonProperty("picture") final String picture) {
        Objects.requireNonNull(userName);
        Objects.requireNonNull(message);
        Objects.requireNonNull(time);
        Objects.requireNonNull(picture);
        this.userName = userName;
        this.message = message;
        this.time = time;
        this.picture = picture;
    }

    String getUserName() {
        return this.userName;
    }

    String getMessage() {
        return this.message;
    }

    String getTime() {
        return this.time;
    }
    String getPicture() {
        return this.picture;
    }
}
