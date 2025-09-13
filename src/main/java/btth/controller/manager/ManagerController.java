package btth.controller.manager;

import java.io.File;
import java.io.IOException;
import java.util.List;

import btth.entity.Category;
import btth.entity.Users;
import btth.services.CategoryServices;
import btth.services.impl.CategoryServicesImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet({"/manager/home", "/manager/category/add", "/manager/category/edit", "/manager/category/delete"})
@MultipartConfig
public class ManagerController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryServices categoryService = new CategoryServicesImpl();

    // Thư mục lưu ảnh ngoài project
    private static final String UPLOAD_DIR = "D:\\Ki1_Nam3\\ltWeb\\Anh_btth";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        Users manager = (Users) session.getAttribute("user");

        String uri = req.getRequestURI();

        if (uri.endsWith("home")) {
            List<Category> list = categoryService.findByUserId(manager.getId());
            req.setAttribute("categories", list);
            req.getRequestDispatcher("/views/manager/home.jsp").forward(req, resp);

        } else if (uri.endsWith("delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            categoryService.delete(id);
            resp.sendRedirect(req.getContextPath() + "/manager/home");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        Users manager = (Users) session.getAttribute("user");

        String uri = req.getRequestURI();

        if (uri.endsWith("add")) {
            String name = req.getParameter("name");
            boolean status = req.getParameter("status") != null;

            // upload ảnh
            Part filePart = req.getPart("img");
            String fileName = filePart.getSubmittedFileName();

            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) uploadDir.mkdirs();
            filePart.write(UPLOAD_DIR + File.separator + fileName);

            Category c = new Category();
            c.setName(name);
            c.setImg(fileName);
            c.setStatus(status);
            c.setUser(manager);

            categoryService.create(c);
            resp.sendRedirect(req.getContextPath() + "/manager/home");

        } else if (uri.endsWith("edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Category c = categoryService.findById(id);

            c.setName(req.getParameter("name"));
            c.setStatus(req.getParameter("status") != null);

            // Nếu có upload ảnh mới thì thay
            Part filePart = req.getPart("img");
            String fileName = filePart.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                File uploadDir = new File(UPLOAD_DIR);
                if (!uploadDir.exists()) uploadDir.mkdirs();
                filePart.write(UPLOAD_DIR + File.separator + fileName);
                c.setImg(fileName);
            }

            categoryService.update(c);
            resp.sendRedirect(req.getContextPath() + "/manager/home");
        }
    }
}
