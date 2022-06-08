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
import users.UserDTO;

/**
 *
 * @author Admin
 */
@WebServlet(name = "HistoryController", urlPatterns = {"/HistoryController"})
public class HistoryController extends HttpServlet {

    private static final String ERROR = "history.jsp";
    private static final String SUCCESS = "history.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String userMode = (String) session.getAttribute("MODE");
            ContractDAO contractDao = new ContractDAO();

            String selectedContractStatus = request.getParameter("selectedContractStatus");
            int contractStatus = 2;
            if (selectedContractStatus != null) {
                contractStatus = Integer.parseInt(selectedContractStatus);
            }

            List<ContractDTO> listContract = null;
            if (userMode.equalsIgnoreCase("FREELANCER")) {
                switch (contractStatus) {
                    case 0:
                        listContract = contractDao.filterContractForHistory(loginUser.getId(), contractStatus);
                        break;
                    case 1:
                        listContract = contractDao.filterContractForHistory(loginUser.getId(), contractStatus);
                        break;
                    case 2:
                        listContract = contractDao.getAllContractForHistory(loginUser.getId());
                        break;
                    default:
                        break;
                }

            } else if (userMode.equalsIgnoreCase("EMPLOYER")) {
                switch (contractStatus) {
                    case 0:
                        listContract = contractDao.filterContractForHistoryForEmployer(loginUser.getId(), contractStatus);
                        break;
                    case 1:
                        listContract = contractDao.filterContractForHistoryForEmployer(loginUser.getId(), contractStatus);
                        break;
                    case 2:
                        listContract = contractDao.getAllContractForHistoryForEmployer(loginUser.getId());
                        break;
                    default:
                        break;
                }

            }

            List<ContractDTO> listContractDetail = new ArrayList<>();
            for (ContractDTO contractDTO : listContract) {
                listContractDetail.add(contractDao.getContractById(contractDTO.getId_contract()));
            }
            request.setAttribute("CONTRACT_DETAIL", listContractDetail);

            request.setAttribute("LIST_CONTRACT", listContract);
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at HistoryController : " + e.toString());
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
