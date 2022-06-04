/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jobs.JobDAO;
import jobs.JobDTO;
import majors.MajorDAO;
import majors.MajorDTO;
import skills.SkillDTO;
import users.UserDTO;

/**
 *
 * @author Tung Nguyen
 */
public class PostJobController extends HttpServlet {

    private final String SUCCESS = "HomeController";
    private final String ERROR = "HomeController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        try {
            String title = request.getParameter("title");
            double salary = Double.parseDouble(request.getParameter("salary"));
            double duration = Double.parseDouble(request.getParameter("duration"));
            String major = request.getParameter("cmbMajor");
            String description = request.getParameter("description");
            String startDate = request.getParameter("startDate");
            String[] skillList = request.getParameterValues("skillJob");
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            int idEmployer = user.getId();
            JobDTO job = new JobDTO(title, salary, description, duration, startDate, "2", idEmployer, major, skillList);
            JobDAO jDao = new JobDAO();
            boolean check = jDao.createJob(job);
            if (check) {
                request.setAttribute("SUCCESS_MESSAGE", "Your post has been successfully posted");
                url = SUCCESS;
//                session.removeAttribute("MAJOR");
            } else {
                request.setAttribute("ERROR_MESSAGE", "An unknown error");
//                session.removeAttribute("MAJOR");
            }

        } catch (Exception e) {
            log("Error at PostJobController: " + e.toString());
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
