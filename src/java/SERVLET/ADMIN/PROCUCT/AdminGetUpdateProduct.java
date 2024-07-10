/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SERVLET.ADMIN.PROCUCT;

import DAO.ADMIN.Category_DAO;
import DAO.ADMIN.Product_DAO;
import MODEL.Cate_Model;
import MODEL.Product_Model;
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

/**
 *
 * @author LA DAT
 */
@WebServlet(name = "AdminGetUpdateProduct", urlPatterns = {"/AdminGetUpdateProduct"})
public class AdminGetUpdateProduct extends HttpServlet {
    private static String ADMIN_PRODUCT_MANAGE_SERVLET = "/AdminProductServlet";
    private static String ADMIN_UPDATE_PRODUCT_PAGE = "web/view/admin/product/updateProduct.jsp";
    String url = ADMIN_PRODUCT_MANAGE_SERVLET;
    Category_DAO cateDAO = new Category_DAO();
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
        try  {
           if (request.getParameter("productId") != null) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                Product_Model product = product_DAO.findOneById(productId);
               
                List<Cate_Model> listCate = cateDAO.findAll();  
                if (product != null && listCate.size()>0) {
                    request.setAttribute("ProUpdate", product);
                    request.setAttribute("listCate", listCate);
                    url = ADMIN_UPDATE_PRODUCT_PAGE;
                }
            }
        }catch (Exception e) {
            System.out.println("SERVLET.ADMIN.ACCOUNT.AdminGetUpdateAccount.processRequest()" + e);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
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
