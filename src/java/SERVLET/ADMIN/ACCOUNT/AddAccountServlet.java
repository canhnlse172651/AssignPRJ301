/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SERVLET.ADMIN.ACCOUNT;

import DAO.ADMIN.Account_DAO;
import MODEL.User_Model;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LA DAT
 */
@WebServlet(name = "AddAccountServlet", urlPatterns = {"/AddAccountServlet"})
public class AddAccountServlet extends HttpServlet {

    private static String ADMIN_ADD_ACCOUNT_PAGE = "/MainServlet?btn=adminAddAccount";
    private static String ADMIN_ACCOUNT_MANAGE_SERVLET = "/AccountServlet";
    private final String LOGIN_PAGE = "/web/view/Login/login.html";
    String url = LOGIN_PAGE;
    Account_DAO accountDao = new Account_DAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("USER") != null) {
                User_Model userAdmin = (User_Model) session.getAttribute("USER");
                if (userAdmin.isRole() == true) {
                    String username = request.getParameter("username");
                    String fullName = request.getParameter("fullName");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    int role = Integer.parseInt(request.getParameter("role"));
                    User_Model user = new User_Model(-1, username, password, fullName, email, 0, phone, true, address, role == 1 ? true : false);
                    System.out.println("SERVLET.ADMIN.ACCOUNT.AddAccountServlet.processRequest()" + user.getFullName());
                    if (accountDao.insertUser(user)) {
                        url = ADMIN_ACCOUNT_MANAGE_SERVLET;
                    } else {
                        url = ADMIN_ADD_ACCOUNT_PAGE;
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            url = "web/error.jsp";
            request.setAttribute("ERROR_MESSAGE", "Database error: " + e.getMessage());
        } finally {
            response.sendRedirect(request.getContextPath() + url);
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
