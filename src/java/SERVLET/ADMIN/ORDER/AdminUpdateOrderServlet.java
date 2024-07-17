/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SERVLET.ADMIN.ORDER;

import DAO.ADMIN.Order_DAO;
import MODEL.User_Model;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "AdminUpdateOrderServlet", urlPatterns = {"/AdminUpdateOrderServlet"})
public class AdminUpdateOrderServlet extends HttpServlet {

    private static String ADMIN_ORDER_MANAGE_SERVLET = "/AdminOrderServlet";
    Order_DAO orderDAO = new Order_DAO();
    private final String LOGIN_PAGE = "/web/view/Login/login.html";
    String url = LOGIN_PAGE;

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
                    int orderId = Integer.parseInt(request.getParameter("orderId"));
                    int status = Integer.parseInt(request.getParameter("status"));
                    boolean paymentStatus = Integer.parseInt(request.getParameter("paymentStatus")) == 1;
                    if (orderDAO.updateOrderStatus(orderId, status) && orderDAO.updatePaymentStatus(orderId, paymentStatus));
                    url = ADMIN_ORDER_MANAGE_SERVLET;
                }
            }
        } catch (NumberFormatException | SQLException e) {
            System.out.println("SERVLET.ADMIN.ACCOUNT.AddAccountServlet.processRequest()" + e);
        } finally {
            response.sendRedirect(request.getContextPath() +url );
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
