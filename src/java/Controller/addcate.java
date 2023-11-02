package Controller;

import DAO.CategoryDAO;
import DTO.CategoryDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "addcate", urlPatterns = {"/addcate"})
public class addcate extends HttpServlet {

    private static final String ERROR_PAGE = "error.jsp";
    private static final String SUCCESS_PAGE = "MainController?action=pro";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        String url = ERROR_PAGE;

        CategoryDAO categoryDAO = new CategoryDAO();

        try {
            String categoryName = request.getParameter("detail");

            // Kiểm tra xem category có tồn tại hay không
            boolean categoryExists = categoryDAO.Instestid(categoryName);

            if (categoryExists) { 
            String mess ="thêm thành công";
            request.setAttribute(mess, mess);

                url = SUCCESS_PAGE;
            } else {
              String mess ="thêm ko  thành công";
            request.setAttribute(mess, mess);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher(url).forward(request, response);
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
        return "Short description";
    }
}
