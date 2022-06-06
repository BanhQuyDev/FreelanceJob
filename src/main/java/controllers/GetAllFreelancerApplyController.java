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
import jobs.JobApplicationDTO;
import jobs.JobDAO;
import jobs.JobDTO;

import users.UserDTO;

/**
 *
 * @author Thiep Ngo
 */
@WebServlet(name = "GetAllFreelancerApplyController", urlPatterns = {"/GetAllFreelancerApplyController"})

public class GetAllFreelancerApplyController extends HttpServlet {

    private static final String ERROR = "index.jsp";
    private static final String SUCCESS = "list_freelancer_apply.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        try {
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            List<JobApplicationDTO> listJoblistJobProcessing;

            JobDAO dao = new JobDAO();
            listJoblistJobProcessing = new JobDAO().getAllFreelancerApply(user.getId());
            request.setAttribute("LIST_FREELANCER_APPLY", listJoblistJobProcessing);
            List<JobDTO> listJobByEmployeer = new JobDAO().getAllJobByEmployeer(user.getId());
            session.setAttribute("LIST_JOB_EMPLOYEER", listJobByEmployeer);
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
