/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

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
import skills.SkillDAO;
import skills.SkillDTO;
import users.UserDAO;
import users.UserDTO;

/**
 *
 * @author Thiep Ngo
 */
@WebServlet(name = "FreeLancerDetailController", urlPatterns = {"/FreeLancerDetailController"})
public class FreeLancerDetailController extends HttpServlet {

    private static final String ERROR = "index.jsp";
    private static final String SUCCESS = "freelancer_apply_detail.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            FeedbackDAO feedbackDao = new FeedbackDAO();
            int id_freelancer = Integer.parseInt(request.getParameter("id_freelancer"));
            UserDTO freelancer = new UserDAO().getUserByID(id_freelancer);
            request.setAttribute("FREELANCER_DETAIL", freelancer);
            List<SkillDTO> listSkill = new SkillDAO().getAllSkillByUser(id_freelancer);
            request.setAttribute("LIST_SKILL", listSkill);
            int totalStar = feedbackDao.getTotalStar(id_freelancer);
            int totalJob = feedbackDao.getTotalJob(id_freelancer);
            List<FeedbackDTO> listAllFeedback = feedbackDao.getAllFeedbackByUser(id_freelancer);
            request.setAttribute("TOTAl_STAR_FREELANCER", totalStar);
            request.setAttribute("TOTAl_JOB_FREELANCER", totalJob);
            request.setAttribute("ALL_FEEDBACK_FREELANCER", listAllFeedback);
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at GetAllJob:" + e.toString());
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
