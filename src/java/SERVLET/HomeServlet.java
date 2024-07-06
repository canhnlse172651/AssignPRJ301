/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SERVLET;

import DAO.Cate_DAO;
import DAO.Product_DAO;
import MODEL.Cate_Model;
import MODEL.Product_Model;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thinkpad
 */
@WebServlet(name = "HomeServlet", urlPatterns = {"/HomeServlet"})
public class HomeServlet extends HttpServlet {

    private final String HOME_PAGE = "web/view/HomePage/homePage.jsp";

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
            throws ServletException, IOException, Exception {
        //1 get all infor of client

       String url = HOME_PAGE;
        try {
            // Step 1: Get all categories
            Cate_DAO cateDao = new Cate_DAO();
            List<Cate_Model> cateList = cateDao.getAllCate();
            
            if (cateList != null && !cateList.isEmpty()) {
                request.setAttribute("categories", cateList);
                
                // Step 2: Check if a categoryId is passed (indicating a category is selected)
                
                String categoryIdParam = request.getParameter("category_id");
                int categoryId = 1 ;
                if (categoryIdParam != null && !categoryIdParam.isEmpty()) {
                     categoryId = Integer.parseInt(categoryIdParam);
                }
                    // Step 3: Get products by category
                    Product_DAO productDao = new Product_DAO();
                     List<Product_Model>   productList = (List<Product_Model>)productDao.getProductsByCategory(categoryId);
                    
                    if (productList != null) {
                        request.setAttribute("productLists", productList);
                        System.out.println(productList);
                    }
            }

        } catch (NamingException ex) {
            log("SearchServlet_Naming" + ex.getMessage());

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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(HomeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
