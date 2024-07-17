/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SERVLET.ADMIN.PROCUCT;

import DAO.ADMIN.Product_DAO;
import MODEL.Product_Model;
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
@WebServlet(name = "AdminAddProductServlet", urlPatterns = {"/AdminAddProductServlet"})
public class AdminAddProductServlet extends HttpServlet {

    private static String ADMIN_ADD_PRODUCT_PAGE = "/MainServlet?btn=adminAddProduct";
    private static String ADMIN_PRODUCT_MANAGE_SERVLET = "/AdminProductServlet";
    private final String LOGIN_PAGE = "/web/view/Login/login.html";
    String url = LOGIN_PAGE;
    Product_DAO product_DAO = new Product_DAO();

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
                    url = ADMIN_ADD_PRODUCT_PAGE;
                    String name = request.getParameter("name");
                    int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                    double price = Double.parseDouble(request.getParameter("price"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    String size = request.getParameter("size");
                    String description = request.getParameter("description");
                    String image = request.getParameter("image");
                    Product_Model product = product_DAO.findOneByName(name, size);
                    if (product.getName() == null) {
                        product = new Product_Model(0, categoryId, name, true, size, price, quantity, description, image);
                        if (product_DAO.insertProduct(product)) {
                            url = ADMIN_PRODUCT_MANAGE_SERVLET;
                        } else {
                            url = ADMIN_ADD_PRODUCT_PAGE;
                        }
                    } else {
                        url = ADMIN_ADD_PRODUCT_PAGE;
                    }
                }
            }
        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            System.out.println("SERVLET.ADMIN.ACCOUNT.AddAccountServlet.processRequest()" + e.getMessage());
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
