/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import file.FileDAO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import utils.S3Util;

@WebServlet(name = "UploadFileS3", urlPatterns = {"/UploadFileS3"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 20, // 20MB
        maxRequestSize = 1024 * 1024 * 21 // 21MB
)
public class UploadFileS3 extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public UploadFileS3() {
        super();
    }
    private static final String ERROR = "error.jsp";
    private static final String WORK_SPACE = "WorkspaceController";
    private static final String FILE_MANAGEMENT = "GetAllFileOfJob";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            Collection<Part> parts = request.getParts();
            int idJob = Integer.parseInt(request.getParameter("idJob"));
            String position = request.getParameter("position");
            FileDAO fileDao = new FileDAO();
            for (Part filePart : parts) {
                String fileName = getFileName(filePart);
                if (fileName != null) {
                    if (fileName.contains("idJob")||fileName.contains("position")) {
                    } else {
                        S3Util.uploadFile(fileName, filePart.getInputStream());
                        String urlFile = S3Util.getURL(fileName);
                        fileDao.uploadFile(urlFile, idJob);
                    }
                }
            }
            if (position.equals("workSpace")) {
                url = WORK_SPACE;
            }else{
                 url = FILE_MANAGEMENT;
            }
            request.setAttribute("SUCCESS_MESSAGE", "Upload SuccessFully !!!");
        } catch (Exception ex) {
            log("Error uploading file:" + ex.getMessage());
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

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        int beginIndex = contentDisposition.indexOf("filename=") + 10;
        int endIndex = contentDisposition.length() - 1;

        return contentDisposition.substring(beginIndex, endIndex);
    }
}
