/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package home;

import contracts.ContractDAO;
import feedbacks.FeedbackDAO;
import file.FileDAO;
import file.FileDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jobs.JobDAO;
import jobs.JobDTO;
import notifications.NotificationDAO;
import utils.S3Util;
import utils.Utils;

/**
 *
 * @author Admin
 */
@WebServlet(name = "FeedbackController", urlPatterns = {"/FeedbackController"})
public class FeedbackController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "WorkspaceController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String contentFeedback = request.getParameter("contentFeedback");
            int starRating = 0;
            if (request.getParameter("star-rating") != null) {
                starRating = Integer.parseInt(request.getParameter("star-rating"));
            }
            int idFreelancer = Integer.parseInt(request.getParameter("idFreelancer"));
            int idEmployer = Integer.parseInt(request.getParameter("idEmployer"));
            int idJob = Integer.parseInt(request.getParameter("idJob"));
            double price = Double.parseDouble(Utils.convertPrice(request.getParameter("price")));
            FeedbackDAO feedbackDao = new FeedbackDAO();
            ContractDAO contractDao = new ContractDAO();
            JobDAO dao = new JobDAO();
            JobDTO job = dao.getAJobByIDV2(idJob);
            String content = "notify you that a job " + job.getTitle() + " has been completed";
            String content_price = " has been added " + showPrice(price) + " in your balance";
            boolean check_noti = new NotificationDAO().createNotificationV2(idFreelancer, content, 3, idEmployer, 1);
            boolean check_noti_price = new NotificationDAO().createNotificationV2(idFreelancer, content_price, 3, idEmployer, 1);
            if (feedbackDao.createFeedback(contentFeedback, starRating, idFreelancer, idEmployer)) {
                if (contractDao.updateContractAfterFeedback(idJob)) {
                    List<FileDTO> listFile = new FileDAO().getListFileOfJob(idJob);
                    for (FileDTO file : listFile) {
                        new FileDAO().deleteFile(file.getId());
                        String keyName = S3Util.getKeyName(file.getUrlS3());
                        S3Util.deleteFile(keyName);
                    }
                    feedbackDao.tranferMoneyForFreelancer(idFreelancer, price);
                    if (check_noti && check_noti_price) {
                        request.setAttribute("SUCCESS_MESSAGE", "Your job has been finish !!");
                        url = SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            log("Error at WorkspaceController : " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    public String showPrice(double price) {
        return Utils.convertPrice(price);
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
