package btth.controller.user;

import java.io.IOException;
import java.util.List;

import btth.entity.Category;
import btth.entity.Video;
import btth.services.CategoryServices;
import btth.services.VideoServices;
import btth.services.impl.CategoryServicesImpl;
import btth.services.impl.VideoServicesImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet({"/user/category", "/user/video","/user/home"})
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CategoryServices categoryService = new CategoryServicesImpl();
    private VideoServices videoService = new VideoServicesImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String uri = req.getRequestURI();

        if (uri.endsWith("/category") || uri.endsWith("/home")) {
            // Lấy tất cả category
            List<Category> list = categoryService.findAll();
            req.setAttribute("categories", list);
            req.getRequestDispatcher("/views/web/home.jsp").forward(req, resp);

        } else if (uri.endsWith("/video")) {
            // Lấy tất cả video đang active
            List<Video> list = videoService.findAll();
            req.setAttribute("videos", list);
            req.getRequestDispatcher("/views/web/videolist.jsp").forward(req, resp);
        }
    }
}
