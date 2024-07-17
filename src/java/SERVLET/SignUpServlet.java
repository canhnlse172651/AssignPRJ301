package SERVLET;

import DAO.User_DAO;
import MODEL.User_Model;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SignUpServlet", urlPatterns = {"/SignUpServlet"})
public class SignUpServlet extends HttpServlet {

    private final String LOGIN_PAGE = "web/view/Login/login.html";
    private final String SIGN_UP_PAGE = "/web/view/Login/SignUp.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SIGN_UP_PAGE;
        String username = request.getParameter("txtUsername");
        String fullName = request.getParameter("txtFullName");
        String email = request.getParameter("txtEmail");
        String phone = request.getParameter("txtPhone");
        String password = request.getParameter("txtPassword");
        String confirm = request.getParameter("txtConfirmPassword");

        try {
            if (username == null || fullName == null || email == null || phone == null || password == null || confirm == null) {
                request.setAttribute("errorMessage", "All fields are required!");
            } else if (!password.equals(confirm)) {
                request.setAttribute("errorMessage", "Passwords do not match!");
            } else {
                // Consider hashing the password before storing it
                User_Model user = new User_Model(0, username, password, fullName, email, 0, phone, true, phone, true);

                User_DAO user_dao = new User_DAO();
                if (user_dao.isUserExist(username, email, phone)) {
                    request.setAttribute("errorMessage", "Username or email or phone already exists!");
                } else {
                    boolean result = user_dao.createAccount(user);
                    if (result) {
                        url = LOGIN_PAGE;
                    } else {
                        request.setAttribute("errorMessage", "Failed to create account!");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Regiter fail !");
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "SignUp Servlet";
    }
}
