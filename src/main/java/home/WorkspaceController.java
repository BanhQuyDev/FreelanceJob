/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package home;

import contracts.ContractDAO;
import contracts.ContractDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import milestones.MilestoneDAO;
import milestones.MilestoneDTO;
import users.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "WorkspaceController", urlPatterns = {"/WorkspaceController"})
public class WorkspaceController extends HttpServlet {

    private static final String ERROR = "work_space.jsp";
    private static final String SUCCESS = "work_space.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            MilestoneDAO milestoneDao = new MilestoneDAO();
            milestoneDao.autoSetStatusByDay();
            List<MilestoneDTO> listMilestone = new ArrayList<>();

            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String mode = (String) session.getAttribute("MODE");

            ContractDAO contractDao = new ContractDAO();
            List<ContractDTO> listContract = new ArrayList<>();
            if (mode.equals("FREELANCER")) {
                listContract = contractDao.getContractForWorkspace(loginUser.getId());
            } else if (mode.equals("EMPLOYER")) {
                listContract = contractDao.getContractForWorkspaceForEmployer(loginUser.getId());
            }

            List<ContractDTO> listContractDetail = new ArrayList<>();
            for (ContractDTO contractDTO : listContract) {
                if (mode.equals("FREELANCER")) {
                    listContractDetail.add(contractDao.getContractDetailForWorkspace(loginUser.getId(), contractDTO.getContract_job_id()));
                } else if (mode.equals("EMPLOYER")) {
                    listContractDetail.add(contractDao.getContractDetailForWorkspaceForEmployer(loginUser.getId(), contractDTO.getContract_job_id()));
                }
                listMilestone = milestoneDao.getAllMilestoneByIdJob(contractDTO.getContract_job_id());
            }

            request.setAttribute("LIST_CONTRACT_FREELANCER", listContract);
            request.setAttribute("LIST_CONTRACT_DETAIL_FREELANCER", listContractDetail);
            request.setAttribute("CONTRACT_DETAIL_SIZE", listContractDetail.size());
            request.setAttribute("LIST_MILESTONE", listMilestone);
            url = SUCCESS;
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
