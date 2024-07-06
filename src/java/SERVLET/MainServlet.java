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
   
    
     private final String LOGIN_SERVLET = "LoginServlet";
      private final String HOME_SERVLET = "HomeServlet";
      private final String PRODUCT_DETAIL_SERVLET = "ProductDetailServlet";
     private final String LOGIN_PAGE = "web/view/Login/login.html";
     private final String ADMIN_ADD_ACCOUNT_SERVLET = "/AddAccountServlet";
     private final String ADMIN_UPADTE_ACCOUNT_SERVLET = "/AdminUpdateAccountServlet";
     private final String ADMIN_ADD_ACCOUNT_PAGE = "web/view/admin/account/addAccount.jsp";
     private final String ADMIN_GET_UPDATE_ACCOUNT_SERVLET = "/AdminGetUpdateAccount";
     private final String ADMIN_UPDATE_ACCOUNT_PAGE = "web/view/admin/account/updateAccount.jsp";
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
          
         //1. which button did user click
        String button = request.getParameter("btn");
          //NULL default
         String url = LOGIN_PAGE;
        
         String action = request.getParameter("action");
        
        try  {
           if (button == null) {  // frist time and app start up
                // transfer Home page 
                 url = HOME_SERVLET;
               
            }else if(button.equals("Login")){
                url = LOGIN_SERVLET;
            }else if(button.equals("productDetail")){
                url = PRODUCT_DETAIL_SERVLET;
            }else if(button.equals("AddNewAccount")){
                url = ADMIN_ADD_ACCOUNT_SERVLET;
            }else if(button.equals("AdminUpdateAccount")){
                url = ADMIN_UPADTE_ACCOUNT_SERVLET;
            }
           
           if(action!=null && action.equals("adminAddAccount")){
               url = ADMIN_ADD_ACCOUNT_PAGE;
           }else if(action!=null && action.equals("adminGetUpdateAccount")){
               url = ADMIN_GET_UPDATE_ACCOUNT_SERVLET;
           }
           
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
