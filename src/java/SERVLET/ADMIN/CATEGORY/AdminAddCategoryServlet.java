/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package SERVLET.ADMIN.CATEGORY;
import DAO.ADMIN.Category_DAO;
import MODEL.Cate_Model;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.tomcat.util.codec.binary.Base64;

/**
 *
 * @author LA DAT
 */
@WebServlet(name = "AdminAddCategoryServlet", urlPatterns = {"/AdminAddCategoryServlet"})
public class AdminAddCategoryServlet extends HttpServlet {

    private static String ADMIN_ADD_CATEGORY_PAGE = "/MainServlet?btn=adminAddCategory";
    private static String ADMIN_CATEGORY_MANAGE_SERVLET = "/AdminCategoryServlet";
    String url = ADMIN_ADD_CATEGORY_PAGE;
    Category_DAO cateDAO = new Category_DAO();

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
             String name = request.getParameter("name");
          String image = request.getParameter("image");  
            if (name != null && image != null) {             
                Cate_Model category = new Cate_Model();
                category.setName(name);
                category.setImage(image);
                category.setStatus(true);
                if (cateDAO.insertCategory(category)) {
                    url = ADMIN_CATEGORY_MANAGE_SERVLET;
                }else{
                    url = ADMIN_ADD_CATEGORY_PAGE;
                }
            }
        } catch (Exception e) {            
            System.out.println("SERVLET.ADMIN.ACCOUNT.AddAccountServlet.processRequest()" + e.getMessage());
        }  finally {
            
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
