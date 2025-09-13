package btth.controller.user;

import btth.entity.Category;
import btth.services.CategoryServices;
import btth.services.impl.CategoryServicesImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/user/home")
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryServices categoryService = new CategoryServicesImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Lấy toàn bộ category đang active
        List<Category> categories = categoryService.findAll();
        req.setAttribute("categories", categories);

        req.getRequestDispatcher("/views/user/home.jsp").forward(req, resp);
    }
}
