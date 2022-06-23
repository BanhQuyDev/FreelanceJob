package websocket;

import java.util.Objects;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public final class Message {

    @JsonProperty("username")
    private final String userName;
    @JsonProperty
    private final String message;
    @JsonProperty
    private final String time;

    @JsonCreator
    public Message(@JsonProperty("username") final String userName, @JsonProperty("message") final String message, @JsonProperty("time") final String time) {
        Objects.requireNonNull(userName);
        Objects.requireNonNull(message);
        Objects.requireNonNull(time);
        this.userName = userName;
        this.message = message;
        this.time = time;
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
}
