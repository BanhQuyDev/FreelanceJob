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
import majors.MajorDAO;
import majors.MajorDTO;
import skills.SkillDAO;
import skills.SkillDTO;
import users.UserDTO;

/**
 *
 * @author Thiep Ngo
 */
@WebServlet(name = "FilterMajorController", urlPatterns = {"/FilterMajorController"})
public class FilterMajorController extends HttpServlet {

    private static final String ERROR = "freelancer_update_skill.jsp";
    private static final String SUCCESS = "freelancer_update_skill.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        try {
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String majorId = request.getParameter("majorID").trim();
            if (request.getParameter("majorID") == null) {
                url = ERROR;
            } else {
                List<SkillDTO> listSkillByMajor = new SkillDAO().getListSkillByMajor(user.getId(), majorId);
                request.setAttribute("LIST_SKILL_MAJOR", listSkillByMajor);
                List<SkillDTO> listSkillByUser = new SkillDAO().getAllSkillUserByMajor(user.getId(), majorId);
                request.setAttribute("SKILL_MAJOR", listSkillByUser);
                 MajorDTO major = new MajorDAO().getMajorName(majorId);
                request.setAttribute("MAJOR", major);
                url = SUCCESS;
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
