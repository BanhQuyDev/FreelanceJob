package home;

import jobs.JobDAO;
import jobs.JobDTO;
import majors.MajorDAO;
import majors.MajorDTO;
import status.StatusDAO;
import status.StatusDTO;
import users.UserDTO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "RenderJobPostController", value = "/RenderJobPostController")
public class RenderJobPostController extends HttpServlet {

    private final String SUCCESS = "post_management_employer.jsp";
    private final String ERROR = "HomeController";
    private boolean isCheck(int d, String [] selectedStatus) {
        if (selectedStatus == null) {
            return false;
        } else {
            for (int i = 0; i < selectedStatus.length; i++) {
                if(Integer.parseInt(selectedStatus[i]) == d) {
                    return true;
                }
            }
        }
        return false;
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String selectedMajor = request.getParameter("selectedMajor");
        try {
            HttpSession session = request.getSession();
            UserDTO employer = (UserDTO) session.getAttribute("LOGIN_USER");
            MajorDAO majorDao = new MajorDAO();
            List<MajorDTO> listMajor = majorDao.getAllMajorList();
            request.setAttribute("LIST_MAJOR", listMajor);
            List<StatusDTO> listJobStatus = new StatusDAO().getAllJobStatus();
            request.setAttribute("LIST_STATUS", listJobStatus);
            String[] selectedStatus = request.getParameterValues("chkStatus");
            boolean[] checked = new boolean[listJobStatus.size()];
            for (int i = 0; i < checked.length; i++) {
                if(isCheck(listJobStatus.get(i).getId_status(), selectedStatus)) {
                    checked[i] = true;
                } else {
                    checked[i] = false;
                }
            }
            if (selectedMajor == null || selectedMajor.equals("All Major")) {
                List<JobDTO> list = new ArrayList<>();
                if (employer != null) {
                    if(selectedStatus == null) {
                        list = new JobDAO().getAllJobByEmployeer(employer.getId());
                        request.setAttribute("POST_LIST", list);
                        request.setAttribute("SELECTED_STATUS", checked);
                        url = SUCCESS;
                    } else {
                        list = new JobDAO().getAllJobPostOfEmployerByStatus(employer.getId(), selectedStatus);
                        request.setAttribute("POST_LIST", list);
                        request.setAttribute("SELECTED_STATUS", checked);
                        url = SUCCESS;
                    }
                }
            } else {
                List<JobDTO> list = new ArrayList<>();
                if (employer != null) {
                    if (selectedStatus == null) {
                        list = new JobDAO().gettAllPostJobByMajor(employer.getId(), selectedMajor);
                        request.setAttribute("SELECTED_MAJOR", checked);
                        request.setAttribute("POST_LIST", list);
                        request.setAttribute("SELECTED_STATUS", checked);
                        url = SUCCESS;
                    } else {
                        list = new JobDAO().gettAllPostJobByMajorAndStatus(employer.getId(), selectedMajor, selectedStatus);
                        request.setAttribute("SELECTED_MAJOR", checked);
                        request.setAttribute("POST_LIST", list);
                        request.setAttribute("SELECTED_STATUS", checked);
                        url = SUCCESS;
                    }
                }
            }
        } catch (Exception e) {
            log("Error at RenderJobPostController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
