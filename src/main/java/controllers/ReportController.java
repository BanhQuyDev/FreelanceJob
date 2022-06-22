/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jobs.JobDTO;
import reports.JobReportDAO;
import reports.JobReportDTO;
import users.UserDTO;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "ReportController", urlPatterns = {"/ReportController"})
public class ReportController extends HttpServlet {

    private static final String ERROR = "JobDetailController";
    private static final String SUCCESS = "JobDetailController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            String content = request.getParameter("content");
            String job_title = request.getParameter("title");
            int idJob = Integer.parseInt(request.getParameter("id_job"));
            JobDTO job_report = new JobDTO(idJob, job_title);
            UserDTO user_report = (UserDTO) session.getAttribute("LOGIN_USER");
            int id_user_report = user_report.getId();
            JobReportDTO report = new JobReportDTO(job_report, content, id_user_report);
            boolean check = new JobReportDAO().createReport(report);
            if (check) {
                request.setAttribute("SUCCESS_MESSAGE", "Report this job successfully!");
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at ReportController: " + e.toString());
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
