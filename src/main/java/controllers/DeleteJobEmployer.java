/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jobs.JobDAO;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "DeleteJobEmployer", urlPatterns = {"/DeleteJobEmployer"})
public class DeleteJobEmployer extends HttpServlet {

    private static final String ERROR = "RenderJobPostController";
    private static final String SUCCESS = "RenderJobPostController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int idJob = Integer.parseInt(request.getParameter("idJob"));
            JobDAO dao = new JobDAO();
            dao.deleteContractJob(idJob);
             dao.deleteJobSkill(idJob);
             dao.deleteJobApplication(idJob);
             dao.deleteJobMileStone(idJob);
             dao.deleteJobReport(idJob);
             dao.deleteJobStorage(idJob);
            boolean checkDeleteJob = dao.deleteJob(idJob);
            if (checkDeleteJob) {
                request.setAttribute("SUCCESS_MESSAGE", "Delete Successfully!!");
                url = SUCCESS;
            } else {
                request.setAttribute("ERROR_MESSAGE", "Delete Failed!!");
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at AcceptJobController:" + e.toString());
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
