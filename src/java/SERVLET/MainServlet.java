/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SERVLET;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thinkpad
 */
@WebServlet(name = "MainServlet", urlPatterns = {"/MainServlet"})
public class MainServlet extends HttpServlet {
<<<<<<< HEAD

    private final String LOGIN_SERVLET = "LoginServlet";
    private final String HOME_SERVLET = "HomeServlet";
    private final String PRODUCT_DETAIL_SERVLET = "ProductDetailServlet";
    private final String LOGIN_PAGE = "web/view/Login/login.html";
    private final String ADMIN_ADD_ACCOUNT_SERVLET = "/AddAccountServlet";
    private final String ADMIN_ADD_CATEGORY_SERVLET = "/AdminAddCategoryServlet";   
    private final String ADMIN_ADD_PRODUCT_SERVLET = "/AdminAddProductServlet";   
    private final String ADMIN_UPADTE_ACCOUNT_SERVLET = "/AdminUpdateAccountServlet";
    private final String ADMIN_UPADTE_CATEGORY_SERVLET = "/AdminUpdateCategoryServlet";
    private final String ADMIN_UPADTE_PRODUCT_SERVLET = "/AdminUpdateProductServlet";
    private final String ADMIN_UPADTE_ORDER_SERVLET = "/AdminUpdateOrderServlet";
    private final String ADMIN_ADD_ACCOUNT_PAGE = "web/view/admin/account/addAccount.jsp";
    private final String ADMIN_ADD_CATEGORY_PAGE = "web/view/admin/category/addCategory.jsp";
    private final String ADMIN_ADD_PRODUCT_PAGE = "web/view/admin/product/addProduct.jsp";
    private final String ADMIN_GET_ADD_PRODUCT_SERVLET = "/AdminGetAddProductServlet";
    private final String ADMIN_GET_UPDATE_ACCOUNT_SERVLET = "/AdminGetUpdateAccount";
    private final String ADMIN_GET_UPDATE_CATEGORY_SERVLET = "/AdminGetUpdateCategory";
    private final String ADMIN_GET_UPDATE_PRODUCT_SERVLET = "/AdminGetUpdateProduct";
    private final String ADMIN_UPDATE_ACCOUNT_PAGE = "web/view/admin/account/updateAccount.jsp";
    private final String ADMIN_GET_DELETE_ACCOUNT_SERVLET = "/AdminGetDeleteAccount";
    private final String ADMIN_GET_DELETE_CATEGORY_SERVLET = "/AdminGetDeleteCategory";
    private final String ADMIN_GET_DELETE_PRODUCT_SERVLET = "/AdminGetDeleteProduct";
    private final String ADMIN_ACCOUNT_SERVLET = "/AccountServlet";

=======
   
    
     private final String LOGIN_SERVLET = "LoginServlet";
      private final String ADD_TO_CART_SERVLET = "AddToCart";
      private final String HOME_SERVLET = "HomeServlet";
      private final String PRODUCT_DETAIL_SERVLET = "ProductDetailServlet";
     private final String LOGIN_PAGE = "web/view/Login/login.html";
     private final String ADMIN_ADD_ACCOUNT_SERVLET = "/AddAccountServlet";
     private final String ADMIN_UPADTE_ACCOUNT_SERVLET = "/AdminUpdateAccountServlet";
     private final String ADMIN_ADD_ACCOUNT_PAGE = "web/view/admin/account/addAccount.jsp";
     private final String ADMIN_GET_UPDATE_ACCOUNT_SERVLET = "/AdminGetUpdateAccount";
     private final String ADMIN_UPDATE_ACCOUNT_PAGE = "web/view/admin/account/updateAccount.jsp";
     private final String VIEW_CART_SERVLET = "ViewCartServlet";
     
>>>>>>> 1051d80 (view cart)
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String url = LOGIN_PAGE;
        try {
            if (request.getParameter("btn") != null) {
                String button = request.getParameter("btn");
                System.out.println("SERVLET.MainServlet.processRequest()" + button);
               
                if (button.equals("Login")) {
                    url = LOGIN_SERVLET;
                } else if (button.equals("productDetail")) {
                    url = PRODUCT_DETAIL_SERVLET;
                } else if (button.equals("AddNewAccount")) {
                    url = ADMIN_ADD_ACCOUNT_SERVLET;
                } else if (button.equals("AdminUpdateAccount")) {
                    url = ADMIN_UPADTE_ACCOUNT_SERVLET;
                } else if (button.equals("adminAddAccount")) {
                    url = ADMIN_ADD_ACCOUNT_PAGE;
                } else if (button.equals("adminGetUpdateAccount")) {
                    url = ADMIN_GET_UPDATE_ACCOUNT_SERVLET;
                } else if (button.equals("adminGetDeleteAccount")) {
                    url = ADMIN_GET_DELETE_ACCOUNT_SERVLET;
                } else if (button.equals("adminAddCategory")) {
                    url = ADMIN_ADD_CATEGORY_PAGE;
                } else if (button.equals("adminAddNewCategory")) {
                    url = ADMIN_ADD_CATEGORY_SERVLET;
                }else if (button.equals("adminGetUpdateCategory")) {
                    url = ADMIN_GET_UPDATE_CATEGORY_SERVLET;
                }else if (button.equals("AdminUpdateCategory")) {
                    url = ADMIN_UPADTE_CATEGORY_SERVLET;
                }else if (button.equals("adminGetDeleteCategory")) {
                    url = ADMIN_GET_DELETE_CATEGORY_SERVLET;
                }else if (button.equals("adminAddProduct")) {
                    url = ADMIN_GET_ADD_PRODUCT_SERVLET;
                }else if (button.equals("adminAddNewProduct")) {
                    url = ADMIN_ADD_PRODUCT_SERVLET;
                }else if (button.equals("adminGetUpdateProduct")) {
                    url = ADMIN_GET_UPDATE_PRODUCT_SERVLET;
                }else if (button.equals("adminUpdateProduct")) {
                    url = ADMIN_UPADTE_PRODUCT_SERVLET;
                }else if (button.equals("adminGetDeleteProduct")) {
                    url = ADMIN_GET_DELETE_PRODUCT_SERVLET;
                }else if (button.equals("AdminUpdateOrder")) {
                    url = ADMIN_UPADTE_ORDER_SERVLET;
                }
            }else{
                url = LOGIN_PAGE; 
            }
<<<<<<< HEAD

        } finally {
=======
           
           if(action!=null && action.equals("adminAddAccount")){
               url = ADMIN_ADD_ACCOUNT_PAGE;
           }else if(action!=null && action.equals("adminGetUpdateAccount")){
               url = ADMIN_GET_UPDATE_ACCOUNT_SERVLET;
           }else if(button.equals("addToCart")){
               url = ADD_TO_CART_SERVLET;
           }else if(button.equals("viewCart")){
               url = VIEW_CART_SERVLET;
           }
           
        }finally {
>>>>>>> 1051d80 (view cart)
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
