/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package home;

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
import majors.MajorDAO;
import majors.MajorDTO;
import users.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "JobListingController", urlPatterns = {"/JobListingController"})
public class JobListingController extends HttpServlet {

    private static final String ERROR = "job_listing.jsp";
    private static final String SUCCESS = "job_listing.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            MajorDAO majorDao = new MajorDAO();
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            List<MajorDTO> listMajor = majorDao.getAllMajorList();
            request.setAttribute("LIST_MAJOR", listMajor);
            String selectedMajor = request.getParameter("selectedMajor");
            JobDAO jobDao = new JobDAO();
            List<JobDTO> listJob = new ArrayList<>();
            if (loginUser == null) {
                if (selectedMajor == null || selectedMajor.equals("All Major")) {
                    listJob = jobDao.getAllJob();
                    request.setAttribute("LIST_JOB", listJob);
                } else {
                    listJob = jobDao.getJobByMajor(selectedMajor);
                    request.setAttribute("LIST_JOB", listJob);
                    request.setAttribute("SELECTED_MAJOR", selectedMajor);
                }
                url = SUCCESS;
            } else {
                if (selectedMajor == null || selectedMajor.equals("All Major")) {
                    listJob = jobDao.getAllJob(loginUser.getId());
                    request.setAttribute("LIST_JOB", listJob);
                } else {
                    listJob = jobDao.getJobByMajor(selectedMajor,loginUser.getId());
                    request.setAttribute("LIST_JOB", listJob);
                    request.setAttribute("SELECTED_MAJOR", selectedMajor);
                }
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at JobListingController : " + e.toString());
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
