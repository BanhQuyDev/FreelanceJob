/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import Payment.PaymentDAO;
import com.stripe.Stripe;
import com.stripe.model.Charge;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.Utils;

/**
 *
 * @author QUANG HUY
 */
@WebServlet(name = "PaymentController", urlPatterns = {"/PaymentController"})
public class PaymentController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "WorkspaceController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            Stripe.apiKey = getServletContext().getInitParameter("stripeSecretKey");
            Map<String, String[]> httpParameters = request.getParameterMap();
            PaymentDAO payment = new PaymentDAO();
            int idJob = Integer.parseInt(request.getParameter("idJob"));
            double price = Double.parseDouble(Utils.convertPrice(request.getParameter("price")));
            int salary = (int)price;
            Map<String, Object> userBillingData = new HashMap<>();
            String userEmail = httpParameters.get("stripeEmail")[0];
            userBillingData.put("email", userEmail);
            userBillingData.put("stripeToken", httpParameters.get("stripeToken")[0]);
            Map<String, Object> params = new HashMap<>();
            params.put("amount", salary); // or get from request
            params.put("currency", "vnd");  // or get from request
            params.put("source", userBillingData.get("stripeToken"));// or get from request
            params.put("receipt_email", userEmail);
            Charge.create(params);
            payment.updateStatusPayment(idJob);
            request.setAttribute("SUCCESS_MESSAGE", "Payment Successfully");
            url = SUCCESS;
        } catch (Exception ex) {
            log("Error at PaymentController:" + ex.getMessage());
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
