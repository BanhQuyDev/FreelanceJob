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
 * @author QUANG HUY
 */
@WebServlet(name = "ChangeModeController", urlPatterns = {"/ChangeModeController"})
public class ChangeModeController extends HttpServlet {

    private static final String ERROR = "HomeController";
    private static final String SUCCESS = "HomeController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        try {
            String type = request.getParameter("type");
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            SkillDAO dao = new SkillDAO();
            MajorDAO majorDao = new MajorDAO();
            List<SkillDTO> listSkillByUser = dao.getAllSkillByUser(user.getId());
            session.setAttribute("SKILL", listSkillByUser);
            List<SkillDTO> listSkill = dao.getListSkillDifference(user.getId());
            session.setAttribute("LIST_SKILL", listSkill);
            List<MajorDTO> listMajor = majorDao.getAllMajor();
            session.setAttribute("LIST_MAJOR", listMajor);     
            if (type == null) {
                url = SUCCESS;
            } else {
                if (type.equals("freelancer")) {
                    session.setAttribute("MODE", "FREELANCER");                  
                    url = SUCCESS;
                } else {
                    session.setAttribute("MODE", "EMPLOYER");
                    MajorDAO mDao = new MajorDAO();
                    List<MajorDTO> listMajorUser = mDao.getAllMajor();
                    session.setAttribute("MAJOR", listMajorUser);
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
