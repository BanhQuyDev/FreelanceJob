package utils;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import common.Key;
import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import users.GoogleUserDTO;

public class GoogleUtils {
     public static String getToken(final String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Key.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Key.GOOGLE_CLIENT_ID)
                        .add("client_secret", Key.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Key.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Key.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GoogleUserDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Key.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        GoogleUserDTO user = new Gson().fromJson(response, GoogleUserDTO.class);
        System.out.println(user);
        return user;
    }
}
