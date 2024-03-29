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
import notifications.NotificationDAO;
import users.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ApplyJobController", urlPatterns = {"/ApplyJobController"})
public class ApplyJobController extends HttpServlet {

    private static final String ERROR = "job_details.jsp";
    private static final String SUCCESS = "job_details.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String jobId = request.getParameter("jobId");
            String note = "";
            if (request.getParameter("note") != null) {
                note = request.getParameter("note");
            }
            JobDAO jobDao = new JobDAO();
            if (jobDao.insertJobApplication(user.getId(), Integer.parseInt(jobId), note)) {
                int countFreelancer = jobDao.countFreelancerIn1Job(Integer.parseInt(jobId));
                request.setAttribute("COUNTING_FREELANCER", countFreelancer);
                request.setAttribute("APPLY_SUCCESS", "Waiting for employer approval...");

                JobDTO jobDetail = jobDao.getDetailJob(Integer.parseInt(jobId));
                List<String> listSkill = jobDao.getSkillJob(Integer.parseInt(jobId));
                request.setAttribute("JOB_DETAIL", jobDetail);
                request.setAttribute("SKILL_JOB", listSkill);
                JobDTO job = jobDao.getAJobByIDV2(Integer.parseInt(jobId));
                boolean checkAddNotification = new NotificationDAO().addANotificationApply(user.getId(), job.getTitle(), job.getIdEmployer());
                if (checkAddNotification) {
                    url = SUCCESS;
                }
            }

        } catch (Exception e) {
            log("Error at ApplyJobController : " + e.toString());
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
