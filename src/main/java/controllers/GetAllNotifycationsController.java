/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import notifications.NotificationDAO;
import notifications.NotificationDTO;
import users.UserDTO;

/**
 *
 * @author Thiep Ngo
 */
@WebServlet(name = "GetAllNotifycationsController", urlPatterns = {"/GetAllNotifycationsController"})
public class GetAllNotifycationsController extends HttpServlet {

    private static final String ERROR = "HomeController";
    private static final String SUCCESS = "notifications_list.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String mode = (String) session.getAttribute("MODE");
            int idMode = 1;
            int idStatus = 3;
            if (request.getParameter("unRead") != null) {
                if (mode.equals("FREELANCER")) {
                    List<NotificationDTO> listNotificationsFreelancerUnread = new NotificationDAO().showAllNotificationFreelancerUnread(user.getId());
                    if (listNotificationsFreelancerUnread.isEmpty()) {
                        request.setAttribute("UN_READ", "unRead");
                        url = SUCCESS;
                    } else {
                        if (request.getParameter("readAll") != null) {
                            new NotificationDAO().setAllStatus(user.getId(), idMode, idStatus);
                        }
                        if (request.getParameter("read") != null && request.getParameter("id_noti") != null) {
                            new NotificationDAO().readNotificationsByIdNoti(user.getId(), idMode, Integer.parseInt(request.getParameter("id_noti")), idStatus);
                        }
                        if (request.getParameter("deleteAll") != null) {
                            new NotificationDAO().deleteAllNotifications(user.getId(), idMode, idStatus);
                        }
                        if (request.getParameter("delete") != null && request.getParameter("id_noti") != null) {
                            new NotificationDAO().deleteNotificationsByIdNoti(user.getId(), idMode, Integer.parseInt(request.getParameter("id_noti")), idStatus);
                        }
                        listNotificationsFreelancerUnread = new NotificationDAO().showAllNotificationFreelancerUnread(user.getId());
                        session.setAttribute("LIST_NOTIFICATIONS_FREELANCER_UNREAD", listNotificationsFreelancerUnread);
                        request.setAttribute("UN_READ", "unRead");
                        url = SUCCESS;
                    }
                }
                if (mode.equals("EMPLOYER")) {
                    idMode = 2;
                    idStatus = 3;
                        List<NotificationDTO> listNotificationsEmployerUnread = new NotificationDAO().showAllNotificationEmployerUnread(user.getId());
                    if (listNotificationsEmployerUnread.isEmpty()) {
                        request.setAttribute("UN_READ", "unRead");
                        url = SUCCESS;
                    } else {
                        if (request.getParameter("readAll") != null) {
                            new NotificationDAO().setAllStatus(user.getId(), idMode, idStatus);
                        }
                        if (request.getParameter("read") != null && request.getParameter("id_noti") != null) {
                            new NotificationDAO().readNotificationsByIdNoti(user.getId(), idMode, Integer.parseInt(request.getParameter("id_noti")), idStatus);
                        }
                        if (request.getParameter("deleteAll") != null) {
                            new NotificationDAO().deleteAllNotifications(user.getId(), idMode, idStatus);
                        }
                        if (request.getParameter("delete") != null && request.getParameter("id_noti") != null) {
                            new NotificationDAO().deleteNotificationsByIdNoti(user.getId(), idMode, Integer.parseInt(request.getParameter("id_noti")), idStatus);
                        }
                        listNotificationsEmployerUnread = new NotificationDAO().showAllNotificationEmployerUnread(user.getId());
                        session.setAttribute("LIST_NOTIFICATIONS_EMPLOYER_UNREAD", listNotificationsEmployerUnread);
                        request.setAttribute("UN_READ", "unRead");
                        url = SUCCESS;
                    }
                }
            } else {
                if (mode.equals("FREELANCER")) {
                    idMode = 1;
                    List<NotificationDTO> listNotificationsFreelancerUnread = new NotificationDAO().showAllNotificationFreelancerUnread(user.getId());
                    List<NotificationDTO> listNotificationsFreelancerRead = new NotificationDAO().showAllNotificationFreelancerRead(user.getId());
                    if (listNotificationsFreelancerUnread.isEmpty() && listNotificationsFreelancerRead.isEmpty()) {
                        url = SUCCESS;
                    } else {
                        if (request.getParameter("readAll") != null) {
                            new NotificationDAO().setAllStatusV2(user.getId(), idMode);
                        }
                        if (request.getParameter("deleteAll") != null) {
                            new NotificationDAO().deleteAllNotificationsV2(user.getId(), idMode);
                        }
                        if (request.getParameter("delete") != null && request.getParameter("id_noti") != null) {
                            new NotificationDAO().deleteNotificationsByIdNotiV2(user.getId(), idMode, Integer.parseInt(request.getParameter("id_noti")));
                        }
                        if (request.getParameter("read") != null && request.getParameter("id_noti") != null) {
                            new NotificationDAO().readNotificationsByIdNotiV2(user.getId(), idMode, Integer.parseInt(request.getParameter("id_noti")));
                        }
                        listNotificationsFreelancerUnread = new NotificationDAO().showAllNotificationFreelancerUnread(user.getId());
                        listNotificationsFreelancerRead = new NotificationDAO().showAllNotificationFreelancerRead(user.getId());
                        session.setAttribute("LIST_NOTIFICATIONS_FREELANCER_UNREAD", listNotificationsFreelancerUnread);
                        session.setAttribute("LIST_NOTIFICATIONS_FREELANCER_READ", listNotificationsFreelancerRead);
                        url = SUCCESS;
                    }
                }
                if (mode.equals("EMPLOYER")) {
                    idMode = 2;
                    List<NotificationDTO> listNotificationsEmployerUnread = new NotificationDAO().showAllNotificationEmployerUnread(user.getId());
                    List<NotificationDTO> listNotificationsEmployerRead = new NotificationDAO().showAllNotificationEmployerRead(user.getId());
                    if (listNotificationsEmployerUnread.isEmpty() && listNotificationsEmployerRead.isEmpty()) {
                        url = SUCCESS;
                    } else {
                        if (request.getParameter("readAll") != null) {
                            new NotificationDAO().setAllStatusV2(user.getId(), idMode);
                        }
                        if (request.getParameter("deleteAll") != null) {
                            new NotificationDAO().deleteAllNotificationsV2(user.getId(), idMode);
                        }
                        if (request.getParameter("delete") != null && request.getParameter("id_noti") != null) {
                            new NotificationDAO().deleteNotificationsByIdNotiV2(user.getId(), idMode, Integer.parseInt(request.getParameter("id_noti")));
                        }
                        if (request.getParameter("read") != null && request.getParameter("id_noti") != null) {
                            new NotificationDAO().readNotificationsByIdNotiV2(user.getId(), idMode, Integer.parseInt(request.getParameter("id_noti")));
                        }
                        listNotificationsEmployerUnread = new NotificationDAO().showAllNotificationEmployerUnread(user.getId());
                        listNotificationsEmployerRead = new NotificationDAO().showAllNotificationEmployerRead(user.getId());
                        session.setAttribute("LIST_NOTIFICATIONS_EMPLOYER_UNREAD", listNotificationsEmployerUnread);
                        session.setAttribute("LIST_NOTIFICATIONS_EMPLOYER_READ", listNotificationsEmployerRead);
                        url = SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            log("Error at ChangeModeController: " + e.toString());
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
