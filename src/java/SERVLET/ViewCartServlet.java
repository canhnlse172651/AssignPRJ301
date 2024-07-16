/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SERVLET;

import DAO.Cart_DAO;
import MODEL.Cart_Model;
import MODEL.User_Model;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thinkpad
 */
@WebServlet(name = "ViewCartServlet", urlPatterns = {"/ViewCartServlet"})
public class ViewCartServlet extends HttpServlet {

    private final String VIEW_CART_PAGE = "web/view/AddToCart/cart.jsp";
    private final String LOGIN_PAGE = "web/view/Login/login.html";
    private static final String ERROR_PAGE = "web/error.jsp";

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
        String url = "";

        try {
            Cart_DAO dao = new Cart_DAO();

            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("USER") != null) {
                System.out.println("SERVLET.ViewCartServlet.processRequest()");
                User_Model user = (User_Model) session.getAttribute("USER");
                int userId = user.getUserId();

                List<Cart_Model> cart = dao.getCartsByUserId(userId);
                if (cart != null) {
                    request.setAttribute("CART", cart); // Trong trường hợp này, cart là đối tượng Cart_Model

                    url = VIEW_CART_PAGE;               //  create cart for user
                }

            } else {
                url = ERROR_PAGE;
            }

        } catch (Exception e) {
            url = ERROR_PAGE;

            request.setAttribute("ERROR_MESSAGE", "Database error: " + e.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
