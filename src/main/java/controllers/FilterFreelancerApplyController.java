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
@WebServlet(name = "FilterFreelancerApplyController", urlPatterns = {"/FilterFreelancerApplyController"})
public class FilterFreelancerApplyController extends HttpServlet {

    private static final String ERROR = "list_freelancer_apply.jsp";
    private static final String SUCCESS = "list_freelancer_apply.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = "";
        HttpSession session = request.getSession();
        try {
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            int id_job = Integer.parseInt(request.getParameter("selectedJob"));
            if (request.getParameter("selectedJob") == null) {
                url = ERROR;
            } else {
                if (id_job == 0) {
                    url = "GetAllFreelancerApplyController";
                } else {
                    List<JobApplicationDTO> list = new JobDAO().getFreelancerApplyByJob(user.getId(), id_job);
                    request.setAttribute("LIST_FREELANCER_APPLY", list);
                    request.setAttribute("JOB_SELECTED", id_job);
                    url = SUCCESS;
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
