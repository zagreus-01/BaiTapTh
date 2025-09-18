package btth.controller;

import btth.entity.Category;
import btth.entity.Users;
import btth.services.CategoryServices;
import btth.services.impl.CategoryServicesImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryServices categoryService = new CategoryServicesImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Users user = (session != null) ? (Users) session.getAttribute("user") : null;
        // Lấy toàn bộ category đang active
        List<Category> categories = categoryService.findAll();
        req.setAttribute("categories", categories);
        req.setAttribute("user", user);
        req.getRequestDispatcher("/views/web/home.jsp").forward(req, resp);
    }
}
