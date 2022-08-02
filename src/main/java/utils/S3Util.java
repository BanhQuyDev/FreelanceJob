/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * @author QUANG HUY
 */
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import software.amazon.awssdk.awscore.exception.AwsServiceException;
import software.amazon.awssdk.core.exception.SdkClientException;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.S3Exception;
import software.amazon.awssdk.services.s3.model.GetUrlRequest;

public class S3Util {

    private static final String BUCKET = "***";
    public static void uploadFile(String fileName, InputStream inputStream)
            throws S3Exception, AwsServiceException, SdkClientException, IOException {

        S3Client client = S3Client.builder().build();
        PutObjectRequest request = PutObjectRequest.builder()
                .bucket(BUCKET)
                .key(fileName)
                .acl("public-read")
                .build();
        client.putObject(request,
                RequestBody.fromInputStream(inputStream, inputStream.available()));
    }

    public static void deleteFile(String fileName)
            throws S3Exception, AwsServiceException, SdkClientException, IOException {        
        S3Client client = S3Client.builder().build();        
        DeleteObjectRequest request = DeleteObjectRequest.builder()
                            .bucket(BUCKET)
                            .key(fileName)
                            .build();         
        client.deleteObject(request);
    }

    public static String getURL(String keyName) {

        S3Client s3 = S3Client.builder().build();
        GetUrlRequest request = GetUrlRequest.builder()
                .bucket(BUCKET)
                .key(keyName)
                .build();

        URL url = s3.utilities().getUrl(request);
        String urlPatern = url.toExternalForm();
        return urlPatern;
    }
    public static String getKeyName(String urlFile) {
        String arrayUrl[] = urlFile.split("com/");
        return arrayUrl[1];
    }
}
