/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package home;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import milestones.MilestoneDAO;
import milestones.MilestoneDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddMilestoneController", urlPatterns = {"/AddMilestoneController"})
public class AddMilestoneController extends HttpServlet {

    private static final String ERROR = "eror.jsp";
    private static final String SUCCESS = "WorkspaceController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String idJob = request.getParameter("idJob");
            List<MilestoneDTO> listMilestone = new ArrayList<>();
            for (int i = 1; i <= 5; i++) {
                String startDate = request.getParameter("startDate" + i);
                String endDate = request.getParameter("endDate" + i);
                String tittle = request.getParameter("tittle" + i);
                listMilestone.add(new MilestoneDTO(0, tittle, startDate, endDate, 1, Integer.parseInt(idJob)));
            }
            MilestoneDAO milestoneDao = new MilestoneDAO();
            if (milestoneDao.insertListMilestone(listMilestone)) {
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("Error at WorkspaceController : " + e.toString());
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
