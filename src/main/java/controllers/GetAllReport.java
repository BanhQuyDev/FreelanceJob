/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jobs.JobDTO;
import reports.JobReportDAO;
import reports.JobReportDTO;

/**
 *
 * @author Tung Nguyen
 */
public class GetAllReport extends HttpServlet {

    private final String ADMIN_PAGE = "admin.jsp";
    private final String RENDER_PAGE = "report.jsp";
    private final String ERROR = "HomeController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String action = request.getParameter("action");
        try {
            if (action == null) {
                List<JobReportDTO> listJobReport = new JobReportDAO().getAllJobReport();
                request.setAttribute("LIST_JOB_REPORT", listJobReport);
                url = ADMIN_PAGE;
            } else if (action.equals("render")) {
                int idJob = Integer.parseInt(request.getParameter("id_job"));
                List<JobReportDTO> listReport = new JobReportDAO().getAllReportByJob(idJob);
                JobReportDTO thisJob = new JobReportDAO().getAJobReport(idJob);
                request.setAttribute("THIS_JOB", thisJob);
                request.setAttribute("LIST_REPORT", listReport);
                url = RENDER_PAGE;
            }
        } catch (Exception e) {
            log("Error at GetAllReport: " + e.toString());
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
