/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package home;

import feedbacks.FeedbackDAO;
import feedbacks.FeedbackDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jobs.JobDAO;
import jobs.JobDTO;
import majors.MajorDAO;
import majors.MajorDTO;
import notifications.NotificationDAO;
import notifications.NotificationDTO;
import users.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeController extends HttpServlet {

    private static final String ERROR = "index.jsp";
    private static final String SUCCESS = "index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            MajorDAO majorDao = new MajorDAO();
            List<MajorDTO> listMajor = majorDao.getAllMajorList();
            request.setAttribute("LIST_MAJOR", listMajor);
            JobDAO jobDao = new JobDAO();
            FeedbackDAO feedbackDao = new FeedbackDAO();     
            if (loginUser != null) {
                int totalStar = feedbackDao.getTotalStar(loginUser.getId());
                int totalJob = feedbackDao.getTotalJob(loginUser.getId());
                List<FeedbackDTO> listAllFeedback = feedbackDao.getAllFeedbackByUser(loginUser.getId());
                String mode = (String) session.getAttribute("MODE");
                if (mode.equals("FREELANCER")) {
                    List<NotificationDTO> listNotificationsFreelancerUnread = new NotificationDAO().showAllNotificationFreelancerUnread(loginUser.getId());
                    List<NotificationDTO> listNotificationsFreelancerRead = new NotificationDAO().showAllNotificationFreelancerRead(loginUser.getId());
                    session.setAttribute("LIST_NOTIFICATIONS_FREELANCER_UNREAD", listNotificationsFreelancerUnread);
                    session.setAttribute("LIST_NOTIFICATIONS_FREELANCER_READ", listNotificationsFreelancerRead);
                }
                if (mode.equals("EMPLOYER")) {
                    List<NotificationDTO> listNotificationsEmployerUnread = new NotificationDAO().showAllNotificationEmployerUnread(loginUser.getId());
                    List<NotificationDTO> listNotificationsEmployerRead = new NotificationDAO().showAllNotificationEmployerRead(loginUser.getId());
                    session.setAttribute("LIST_NOTIFICATIONS_EMPLOYER_UNREAD", listNotificationsEmployerUnread);
                    session.setAttribute("LIST_NOTIFICATIONS_EMPLOYER_READ", listNotificationsEmployerRead);
                }
                List<JobDTO> listJob = jobDao.getTop4LatestJob(loginUser.getId());
                request.setAttribute("LIST_TOP_4_LATEST_JOB", listJob);
                List<FeedbackDTO> listFeedbackFreelancer = feedbackDao.getTop4Freelancer();
                request.setAttribute("LIST_TOP_4_FREELACER", listFeedbackFreelancer);
                session.setAttribute("TOTAl_STAR", totalStar);
                session.setAttribute("TOTAl_JOB", totalJob);
                session.setAttribute("ALL_FEEDBACK", listAllFeedback);
                url = SUCCESS;
            } else {
                List<JobDTO> listJob = jobDao.getTop4LatestJob();
                request.setAttribute("LIST_TOP_4_LATEST_JOB", listJob);
                List<FeedbackDTO> listFeedbackFreelancer = feedbackDao.getTop4Freelancer();
                request.setAttribute("LIST_TOP_4_FREELACER", listFeedbackFreelancer);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at HomeController : " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
