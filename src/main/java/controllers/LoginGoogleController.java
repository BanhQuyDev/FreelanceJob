/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import utils.GoogleUtils;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import users.GoogleUserDTO;
import users.UserDAO;
import users.UserDTO;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "LoginGoogleController", urlPatterns = {"/LoginGoogleController"})
public class LoginGoogleController extends HttpServlet {


    private static final String ERROR = "index.jsp";
    private static final String INDEX_PAGE = "ChangeModeController";
    private static final String ADMIN_PAGE = "GetAllJob";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String code = request.getParameter("code");
            String accessToken = GoogleUtils.getToken(code);
            GoogleUserDTO googleUser = GoogleUtils.getUserInfo(accessToken);
            UserDTO user = new UserDTO(googleUser.getName(), googleUser.getEmail(), googleUser.getPicture());
            UserDAO dao = new UserDAO();
            HttpSession session = request.getSession();
            String[] email = user.getEmail().split("@");
            if (email[1].equals("fpt.edu.vn")) {
                boolean check = dao.checkDuplicate(user.getEmail());
                if (check) {
                    user = dao.getUserByEmail(user.getEmail());
                    if (user != null) {
                        boolean checkRole = dao.checkRole(user.getId());
                        if (checkRole) {
                            session.setAttribute("LOGIN_USER", user);
                            session.setAttribute("TYPE", "admin");
                            url = ADMIN_PAGE;
                        } else {
                            session.setAttribute("LOGIN_USER", user);
                            session.setAttribute("TYPE", "user");
                            session.setAttribute("MODE", "FREELANCER");
                            url = INDEX_PAGE;
                        }
                    }
                } else {
                    user = new UserDTO(user.getName(), user.getEmail(), user.getPicture());
                    boolean checkCreate = dao.createUser(user);
                    if (checkCreate) {
                        session.setAttribute("LOGIN_USER", user);
                        session.setAttribute("TYPE", "user");
                        url = INDEX_PAGE;
                    }
                }
            } else {
                request.setAttribute("ERROR_MESSAGE", "Email must have the extension fpt.edu.vn");
                url = ERROR;
            }
        } catch (Exception e) {
            log("Error at LoginGoogleController: " + e.toString());
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
