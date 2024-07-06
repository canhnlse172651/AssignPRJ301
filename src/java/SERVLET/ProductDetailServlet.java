package SERVLET;

import DAO.Product_DAO;
import MODEL.Product_Model;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductDetailServlet", urlPatterns = {"/ProductDetailServlet"})
public class ProductDetailServlet extends HttpServlet {

    private static final String PRODUCT_PAGE = "web/view/ProductPgae/productPage.jsp";
    private static final String ERROR_PAGE = "web/error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = ERROR_PAGE;
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            
            System.out.println(productId);

            Product_DAO dao = new Product_DAO();
            Product_Model product = dao.getProductById(productId);
            
            System.out.println(product.toString());

            if (product != null) {
                request.setAttribute("product", product);
                url = PRODUCT_PAGE;
            }

        } catch (NumberFormatException e) {
            request.setAttribute("ERROR_MESSAGE", "Invalid product ID: " + e.getMessage());
        } catch (Exception e) {
            request.setAttribute("ERROR_MESSAGE", "Database error: " + e.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Product detail servlet";
    }
}
