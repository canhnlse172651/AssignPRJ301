/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SERVLET.ADMIN.ACCOUNT;

import DAO.ADMIN.Account_DAO;
import MODEL.User_Model;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LA DAT
 */
@WebServlet(name = "AdminUpdateAccountServlet", urlPatterns = {"/AdminUpdateAccountServlet"})
public class AdminUpdateAccountServlet extends HttpServlet {

    private static String ADMIN_ACCOUNT_MANAGE_SERVLET = "/AccountServlet";
    String url = "";
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
            int userId = Integer.parseInt(request.getParameter("userId"));
            int numberOrdered = Integer.parseInt(request.getParameter("numberOrdered"));
            String username = request.getParameter("username");
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            boolean role = Integer.parseInt(request.getParameter("role"))==1;
            boolean status = Integer.parseInt(request.getParameter("status")) == 1;
            url = "/MainServlet?btn=adminAddAccount&userId="+userId;
            User_Model user = new User_Model(userId, username, password, fullName, email, numberOrdered, phone, status, address, role);
            if(accountDao.updateUser(user)){
               url = ADMIN_ACCOUNT_MANAGE_SERVLET;
            }
        } catch (Exception e) {
            System.out.println("SERVLET.ADMIN.ACCOUNT.AddAccountServlet.processRequest()" + e);
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
