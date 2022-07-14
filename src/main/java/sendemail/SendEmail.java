/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sendemail;

import com.sendgrid.Method;
import com.sendgrid.Request;
import com.sendgrid.Response;
import com.sendgrid.SendGrid;
import com.sendgrid.helpers.mail.Mail;
import com.sendgrid.helpers.mail.objects.Content;
import com.sendgrid.helpers.mail.objects.Email;
import common.Key;
import java.io.IOException;
import jobs.JobDTO;
import users.UserDTO;


/**
 *
 * @author Tung Nguyen
 */
public class SendEmail {
    
    private static final String EMAIL_NAME = "FPT Freelance Job Team";

    public static boolean sendEmailSpam(JobDTO job, UserDTO user) throws IOException {
        boolean check = false;
        Email from = new Email(Key.EMAIL_SENDER);
        from.setName(EMAIL_NAME);
        String subject = "JOB'S POST ANNOUCEMENT";
        Email to = new Email(user.getEmail());
        Content content = new Content("text/html", prepareMessageSpam(job, user));
        Mail mail = new Mail(from, subject, to, content);
        SendGrid sg = new SendGrid(Key.SENDGRID_API_KEY);
        Request request = new Request();
        try {
            request.setMethod(Method.POST);
            request.setEndpoint("mail/send");
            request.addHeader("Content-Type", "text/html; charset=UTF-8");
            request.setBody(mail.build());
            Response response = sg.api(request);
            if (response.getStatusCode() == 200 || response.getStatusCode() == 202) {
                check = true;
            }
        } catch (IOException ex) {
            throw ex;
        }
        return check;
    }

    public static boolean sendEmailBanUser(UserDTO user, String reason) throws IOException {
        boolean check = false;
        Email from = new Email(Key.EMAIL_SENDER);
        from.setName(EMAIL_NAME);
        String subject = "Ban Account Annoucement";
        Email to = new Email(user.getEmail());
        Content content = new Content("text/html", prepareMessageBanUser(user, reason));
        Mail mail = new Mail(from, subject, to, content);
        SendGrid sg = new SendGrid(Key.SENDGRID_API_KEY);
        Request request = new Request();
        try {
            request.setMethod(Method.POST);
            request.setEndpoint("mail/send");
            request.addHeader("Content-Type", "text/html; charset=UTF-8");
            request.setBody(mail.build());
            Response response = sg.api(request);
            if (response.getStatusCode() == 200 || response.getStatusCode() == 202) {
                check = true;
            }
        } catch (IOException ex) {
            throw ex;
        }
        return check;
    }

    public static boolean sendEmailUnbanUser(UserDTO user) throws IOException {
        boolean check = false;
        Email from = new Email(Key.EMAIL_SENDER);
        from.setName(EMAIL_NAME);
        String subject = "Recovery Account Annoucement";
        Email to = new Email(user.getEmail());
        Content content = new Content("text/html", prepareMessageUnbanUser(user));
        Mail mail = new Mail(from, subject, to, content);
        SendGrid sg = new SendGrid(Key.SENDGRID_API_KEY);
        Request request = new Request();
        try {
            request.setMethod(Method.POST);
            request.setEndpoint("mail/send");
            request.addHeader("Content-Type", "text/html; charset=UTF-8");
            request.setBody(mail.build());
            Response response = sg.api(request);
            if (response.getStatusCode() == 200 || response.getStatusCode() == 202) {
                check = true;
            }
        } catch (IOException ex) {
            throw ex;
        }
        return check;
    }

    private static String prepareMessageSpam(JobDTO job, UserDTO user) {
        String mess = "";
        mess = "<!DOCTYPE html>\n"
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
                + "                <a href=\"\" style=\"font-size:1.4em;color: #f27229;text-decoration:none;font-weight:600\">FPT Freelance \n"
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
        return mess;
    }

    private static String prepareMessageBanUser(UserDTO user, String reason) {
        String mess = "";
        mess = "<!DOCTYPE html>\n"
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
                + "                <a href=\"\" style=\"font-size:1.4em;color: #f27229;text-decoration:none;font-weight:600\">FPT Freelance \n"
                + "                    Job</a>\n"
                + "            </div>\n"
                + "            <p style=\"font-size:1.1em\">Dear, " + user.getName() + "</p>\n"
                + "            <p>After reviewing your account activity on the system, we found that your account is in violation of our terms of use of the system. Therefore, your account has been disabled for the following reasons: <strong>" + reason + "</strong></p>\n"
                + "            <p>Any questions or complaints regarding for account deactivation, please reply to this email for consideration!</p>\n"
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
        return mess;
    }

    private static String prepareMessageUnbanUser(UserDTO user) {
        String mess = "";
        mess = "<!DOCTYPE html>\n"
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
                + "                <a href=\"\" style=\"font-size:1.4em;color: #f27229;text-decoration:none;font-weight:600\">FPT Freelance \n"
                + "                    Job</a>\n"
                + "            </div>\n"
                + "            <p style=\"font-size:1.1em\">Dear, " + user.getName() + "</p>\n"
                + "            <p>The account <strong>" + user.getEmail() + "</strong> has been reactivated. Please strictly comply with the terms of use of the FPT Freelance Job system, to avoid the account being disabled unfortunately.</p>\n"
                + "            <p style=\"font-size:0.9em;\">Sincerely,<br />FPT Freelance Job Team</p>\n"
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
        return mess;
    }

}
