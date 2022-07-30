/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jobs.JobDAO;
import jobs.JobDTO;
import notifications.NotificationDAO;
import notifications.NotificationDTO;
import users.UserDTO;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "SearchJob", urlPatterns = {"/SearchJob"})
public class SearchJob extends HttpServlet {

    private static final String ERROR = "admin.jsp";
    private static final String SUCCESS = "admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String search = request.getParameter("search");
            JobDAO dao = new JobDAO();
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            List<JobDTO> listJob = dao.getListJobByEmail(search);
            List<JobDTO> listJobAcceptedDetail = new ArrayList<>();
            List<JobDTO> listJobSpam = dao.getListJobSpamByEmail(search);
            List<JobDTO> listJobUnappropriatedDetail = new ArrayList<>();
            List<NotificationDTO> listNotificationsAdminUnread = new NotificationDAO().showAllNotificationAdminUnread(loginUser.getId());
            List<NotificationDTO> listNotificationsAdminRead = new NotificationDAO().showAllNotificationAdminRead(loginUser.getId());
            for (JobDTO jobUnappropriated : listJobSpam) {
                listJobUnappropriatedDetail.add(dao.getAJobByID(jobUnappropriated.getIdJob()));
            }
            for (JobDTO jobAccepted : listJob) {
                listJobAcceptedDetail.add(dao.getAJobByID(jobAccepted.getIdJob()));
            }
            request.setAttribute("LIST_JOB_ACCEPTED", listJob);
            request.setAttribute("JOB_ACCEPTED_DETAIL", listJobAcceptedDetail);
            request.setAttribute("LIST_JOB_UNAPPROPRIATED", listJobSpam);
            request.setAttribute("JOB_ACCEPTED_DETAIL", listJobAcceptedDetail);
            request.setAttribute("JOB_UNAPPROPRIATED_DETAIL", listJobUnappropriatedDetail);
            session.setAttribute("LIST_NOTIFICATIONS_ADMIN_UNREAD", listNotificationsAdminUnread);
            session.setAttribute("LIST_NOTIFICATIONS_ADMIN_READ", listNotificationsAdminRead);
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at SearchUser" + e.toString());
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
