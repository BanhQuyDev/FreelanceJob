/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sendemail;

import common.Key;
import jobs.JobDTO;
import users.UserDTO;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/**
 *
 * @author Tung Nguyen
 */
public class SendEmail {

    public static boolean sendEmailSpam(JobDTO job, UserDTO user) throws MessagingException {
        boolean check = false;
        Properties pr = new Properties();
        pr.put("mail.smtp.auth", "true");
        pr.put("mail.smtp.starttls.enable", "true");
        pr.put("mail.smtp.host", "smtp.gmail.com");
        pr.put("mail.smtp.port", "587");

        final String myAccountEmail = Key.SEND_EMAIL_USER;
        final String password = Key.SEND_EMAIL_PASSWORD;

        Session session = Session.getInstance(pr, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myAccountEmail, password);

            }
        });

        Message message = prepareMessageSpam(session, myAccountEmail, job, user);
        Transport.send(message);
        check = true;
        return check;
    }

    private static Message prepareMessageSpam(Session session, String myAccountEmail, JobDTO job, UserDTO user) {
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail, "FPT Freelance Job Team"));
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail()));
            message.setSubject("JOB'S POST ANNOUCEMENT");
            String mess = "<!DOCTYPE html>\n"
                    + "<html lang=\"en\">\n"
                    + "\n"
                    + "<head>\n"
                    + "    <meta charset=\"utf-8\">\n"
                    + "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
                    + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                    + "    <title>SPAM</title>\n"
                    + "</head>\n"
                    + "\n"
                    + "<body>\n"
                    + "    <div style=\"font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2\">\n"
                    + "        <div style=\"margin:50px auto;width:70%;padding:20px 0\">\n"
                    + "            <div style=\"border-bottom:1px solid #eee\">\n"
                    + "                <a href=\"\" style=\"font-size:1.4em;color: #9aaf86;text-decoration:none;font-weight:600\">FPT Freelance \n"
                    + "                    Job</a>\n"
                    + "            </div>\n"
                    + "            <p style=\"font-size:1.1em\">Hi, " + user.getName() + "</p>\n"
                    + "            <p> <strong>" + job.getTitle() + "</strong>  has been flagged for inappropriate content. Please update the post information wait to be moderated again!</p>\n"
                    + "            <p style=\"font-size:0.9em;\">Regards,<br />FPT Freelance Job Team</p>\n"
                    + "            <hr style=\"border:none;border-top:1px solid #eee\" />\n"
                    + "            <div style=\"float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300\">\n"
                    + "                <p>FPT Freelance Job Team</p>\n"
                    + "                <p>daihoc.hcm@fpt.edu.vn</p>\n"
                    + "                <p>+84 9999 9999</p>\n"
                    + "            </div>\n"
                    + "        </div>\n"
                    + "    </div>\n"
                    + "</body>\n"
                    + "\n"
                    + "</html>";
            message.setContent(mess, "text/html");
            return message;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
