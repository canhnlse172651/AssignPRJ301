/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SERVLET;

import DAO.Cart_DAO;
import MODEL.Cart_Model;
import MODEL.Product_Model;
import MODEL.User_Model;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {
     
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
      private final String LOGIN_PAGE = "web/view/Login/login.html";
    private static final String ERROR_PAGE = "web/error.jsp";
  

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          
        Cart_DAO dao = new Cart_DAO();
        String url = "";
        try {
             HttpSession session = request.getSession(false);
             if(session != null && session.getAttribute("USER")!= null){
                 
                 int productId = Integer.parseInt(request.getParameter("productId"));
                 int quantity = 1; // hoặc lấy số lượng từ request nếu có
                 User_Model user = (User_Model) session.getAttribute("USER");
                 int userId = user.getUserId();
                 
                Cart_Model cart = dao.findOneCart(userId, productId);
                
                 if (cart != null) {

                     cart.setQuantity(cart.getQuantity() + 1);
                     dao.updateCart(cart);
                 } else {
                     Product_Model product = new Product_Model(); //  create cart for user
                     Cart_Model cart1 = new Cart_Model(productId, userId, 1);
                     dao.insertCart(cart1);
                 }
                 
                 url = "ProductDetailServlet?productId="+productId;   // gọi lại tính năng trước đó (gọi lại trang product page)
                 
             }else {
                 url =  LOGIN_PAGE;
             }
           

            
        } catch (Exception e) {
           request.setAttribute("ERROR_MESSAGE", "Database error: " + e.getMessage());
           url = ERROR_PAGE;
        }finally {
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
