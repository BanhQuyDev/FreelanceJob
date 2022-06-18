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
import jobs.JobDAO;
import jobs.JobDTO;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "GetAllJob", urlPatterns = {"/GetAllJob"})
public class GetAllJob extends HttpServlet {

    private static final String ERROR = "admin.jsp";
    private static final String SUCCESS = "admin.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            JobDAO dao = new JobDAO();
            List<JobDTO> listJoblistJobProcessing = dao.getAllJobUnappropriated();
            List<JobDTO> listJobAccepted = dao.getAllJobAccepted();
             List<JobDTO> listJobUnappropriatedDetail = new ArrayList<>();
             List<JobDTO> listJobAcceptedDetail = new ArrayList<>();
            for (JobDTO jobUnappropriated : listJoblistJobProcessing) {
                listJobUnappropriatedDetail.add(dao.getAJobByID(jobUnappropriated.getIdJob()));
            }
            for (JobDTO jobAccepted : listJobAccepted) {
                listJobAcceptedDetail.add(dao.getAJobByID(jobAccepted.getIdJob()));
            }
            request.setAttribute("JOB_UNAPPROPRIATED_DETAIL", listJobUnappropriatedDetail);
            request.setAttribute("JOB_ACCEPTED_DETAIL", listJobAcceptedDetail);
            request.setAttribute("LIST_JOB_UNAPPROPRIATED", listJoblistJobProcessing);
            request.setAttribute("LIST_JOB_ACCEPTED", listJobAccepted);
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
