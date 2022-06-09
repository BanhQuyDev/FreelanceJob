/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package home;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jobs.JobDAO;
import jobs.JobDTO;
import users.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "JobDetailController", urlPatterns = {"/JobDetailController"})
public class JobDetailController extends HttpServlet {

    private static final String ERROR = "job_details.jsp";
    private static final String SUCCESS = "job_details.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int jobId = Integer.parseInt(request.getParameter("jobId"));

            JobDAO jobDao = new JobDAO();
            JobDTO jobDetail = jobDao.getDetailJob(jobId);
            List<String> listSkill = jobDao.getSkillJob(jobId);

            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser != null) {
                int jobApplicationId = jobDao.getJobApplicationId(loginUser.getId(), jobId);
                request.setAttribute("JOB_APPLICATION_ID", jobApplicationId);
            }

            int countFreelancer = jobDao.countFreelancerIn1Job(jobId);

            request.setAttribute("JOB_DETAIL", jobDetail);
            request.setAttribute("SKILL_JOB", listSkill);
            request.setAttribute("COUNTING_FREELANCER", countFreelancer);
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at JobDetailController : " + e.toString());
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
