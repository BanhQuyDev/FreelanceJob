/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import jobs.JobDAO;
import jobs.JobDTO;
import majors.MajorDAO;
import majors.MajorDTO;
import notifications.NotificationDAO;
import notifications.NotificationDTO;
import skills.SkillDAO;
import skills.SkillDTO;
import users.UserDTO;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import status.StatusDAO;
import utils.Utils;

/**
 *
 * @author Tung Nguyen
 */
public class UpdateJobController extends HttpServlet {

    private boolean isCheck(int d, List<SkillDTO> listSkillOfJob) {
        if (listSkillOfJob == null) {
            return false;
        } else {
            for (int i = 0; i < listSkillOfJob.size(); i++) {
                if (listSkillOfJob.get(i).getSkillId() == d) {
                    return true;
                }
            }
        }
        return false;
    }

    private final String UPDATE_PAGE = "update_post.jsp";
    private final String SUCCESS = "RenderJobPostController";
    private final String ERROR = "HomeController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String url = ERROR;
        try {
            JobDAO jDao = new JobDAO();
            MajorDAO majorDao = new MajorDAO();
            SkillDAO dao = new SkillDAO();
            List<MajorDTO> listMajor = majorDao.getAllMajorList();
            List<SkillDTO> listSkill = dao.getAllSkillByUser();
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            switch (action) {
                case "render":
                    int idJob = Integer.parseInt(request.getParameter("id_job"));
                    JobDTO job = jDao.getAJobByID(idJob);
                    List<SkillDTO> listSkillAJob = dao.getAllSkillAJob(idJob);
                    request.setAttribute("JOB_UPDATE", job);
                    request.setAttribute("LIST_MAJOR", listMajor);
                    request.setAttribute("LIST_SKILL_JOB", listSkill);
                    boolean[] checked = new boolean[listSkill.size()];
                    for (int i = 0; i < checked.length; i++) {
                        if (isCheck(listSkill.get(i).getSkillId(), listSkillAJob)) {
                            checked[i] = true;
                        } else {
                            checked[i] = false;
                        }
                    }
                    request.setAttribute("LIST_SELECTED_SKILL", checked);
                    url = UPDATE_PAGE;
                    break;
                case "Update Post":
                    int id_job = Integer.parseInt(request.getParameter("id_job"));
                    String title = request.getParameter("title");
                    double salary = Double.parseDouble(Utils.convertPrice(request.getParameter("salary")));
                    double duration = Double.parseDouble(request.getParameter("duration"));
                    String major = request.getParameter("cmbMajor");
                    String description = request.getParameter("description");
                    String startDate = request.getParameter("startDate");
                    String[] skillList = request.getParameterValues("skillJob");
                    String status_name = request.getParameter("status");
                    int id_status = new StatusDAO().getStatusId(status_name);
                    JobDTO updateJob = new JobDTO(id_job, title, salary, description, duration, startDate, major);
                    if (status_name.equals("Spam")) {
                        boolean check_update = jDao.updateJob(updateJob, new StatusDAO().getStatusId("Updated"));
                        if(check_update) {
                            boolean check_delete_old_skill = jDao.deleteJobSkill(id_job);
                            boolean check_new_skill = jDao.createSkillJob(skillList, id_job);
                            String content = "<strong>" + title + "</strong> was updated by " + user.getName();
                            NotificationDAO notiDao = new NotificationDAO();
                            boolean check_noti = notiDao.createNotification(8, content,3, user.getId());
                            if (check_delete_old_skill == true && check_new_skill == true && check_noti == true) {
                                request.setAttribute("SUCCESS_MESSAGE", "Update job's post successfully!");
                                url = SUCCESS;
                            }
                        }
                    } else {
                        boolean check_update = jDao.updateJob(updateJob, id_status);
                        if(check_update) {
                            boolean check_delete_old_skill = jDao.deleteJobSkill(id_job);
                            boolean check_new_skill = jDao.createSkillJob(skillList, id_job);
                            if (check_delete_old_skill == true && check_new_skill == true) {
                                request.setAttribute("SUCCESS_MESSAGE", "Update job's post successfully!");
                                url = SUCCESS;
                            }
                        }
                        
                    }
                    break;
            }

        } catch (Exception e) {
            log("Error at UpdateJobController: " + e.toString());
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
