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
import skills.SkillDAO;
import skills.SkillDTO;
import users.UserDTO;

/**
 *
 * @author Thiep Ngo
 */
    @WebServlet(name = "UpdateUserSkillController", urlPatterns = {"/UpdateUserSkillController"})
public class UpdateUserSkillController extends HttpServlet {

    private static final String ERROR = "freelancer_update_skill.jsp";
    private static final String SUCCESS = "freelancer_update_skill.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        try {
            int skillId = Integer.parseInt(request.getParameter("skillId"));
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String add = request.getParameter("add");
            String delete = request.getParameter("delete");
            boolean checkAdd = false;
            boolean checkDelete = false;
            SkillDAO dao = new SkillDAO();
            List<SkillDTO> listSkillDuplicate = dao.getSkillUserDuplicate(user.getId(), skillId); 
            if (listSkillDuplicate.isEmpty()) {
               if (add != null) {
               checkAdd = dao.addSkill(user.getId(), skillId);
               }
            } else if(listSkillDuplicate.size() > 0) {
                checkAdd = false;
            }
            if (delete != null) {
                checkDelete = dao.deleteSkill(user.getId(), skillId);
            }
            if (checkDelete) {    
                List<SkillDTO> listSkillDelete = dao.getAllSkillByUser(user.getId());
                session.setAttribute("SKILL", listSkillDelete);
                List<SkillDTO> listSkillDiffrence = dao.getListSkillDifference(user.getId());
                session.setAttribute("LIST_SKILL", listSkillDiffrence);
                url = SUCCESS;
            } 
            if (checkAdd) {
                List<SkillDTO> listSkillAdd = dao.getAllSkillByUser(user.getId());
                session.setAttribute("SKILL", listSkillAdd);
                List<SkillDTO> listSkillDiffrence = dao.getListSkillDifference(user.getId());
                session.setAttribute("LIST_SKILL", listSkillDiffrence);
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at UpdateProductController" + e.toString());
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
