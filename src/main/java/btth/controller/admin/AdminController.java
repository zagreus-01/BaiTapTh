package btth.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import btth.entity.Category;
import btth.entity.Users;
import btth.services.CategoryServices;
import btth.services.UserServices;
import btth.services.impl.CategoryServicesImpl;
import btth.services.impl.UserServicesImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet({
    "/admin/home",
    "/admin/category/list", "/admin/category/add", "/admin/category/edit", "/admin/category/delete",
    "/admin/user/list", "/admin/user/add", "/admin/user/edit", "/admin/user/delete"
})
@MultipartConfig
public class AdminController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CategoryServices categoryService = new CategoryServicesImpl();
    private UserServices userService = new UserServicesImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String uri = req.getRequestURI();

        // Trang home = list category
        if (uri.endsWith("home") || uri.endsWith("category/list")) {
            List<Category> list = categoryService.findAll();
            req.setAttribute("categories", list);
            req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);

        } else if (uri.endsWith("category/add")) {
            req.getRequestDispatcher("/views/admin/addCategory.jsp").forward(req, resp);

        } else if (uri.endsWith("category/edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Category c = categoryService.findById(id);
            req.setAttribute("category", c);
            req.getRequestDispatcher("/views/admin/editCategory.jsp").forward(req, resp);

        } else if (uri.endsWith("category/delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            categoryService.delete(id);
            resp.sendRedirect(req.getContextPath() + "/admin/home");
        }

        // Quản lý User
        else if (uri.endsWith("user/list")) {
            List<Users> list = userService.findAll();
            req.setAttribute("users", list);
            req.getRequestDispatcher("/views/admin/listUser.jsp").forward(req, resp);

        } else if (uri.endsWith("user/add")) {
            req.getRequestDispatcher("/views/admin/addUser.jsp").forward(req, resp);

        } else if (uri.endsWith("user/edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Users u = userService.findById(id);
            req.setAttribute("user", u);
            req.getRequestDispatcher("/views/admin/editUser.jsp").forward(req, resp);

        } else if (uri.endsWith("user/delete")) {
            int id = Integer.parseInt(req.getParameter("id"));
            userService.delete(id);
            resp.sendRedirect(req.getContextPath() + "/admin/user/list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String uri = req.getRequestURI();
        HttpSession session = req.getSession(false);
        Users currentAdmin = (Users) session.getAttribute("user");

        // === Category ===
        if (uri.endsWith("category/add")) {
            String name = req.getParameter("name");
            boolean status = req.getParameter("status") != null;

            Part filePart = req.getPart("img");
            String fileName = filePart.getSubmittedFileName();

            String uploadPath = "D:\\Ki1_Nam3\\ltWeb\\Anh_btth";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();
            if (fileName != null && !fileName.isEmpty()) {
                filePart.write(uploadPath + File.separator + fileName);
            }

            Category c = new Category();
            c.setName(name);
            c.setImg(fileName);
            c.setStatus(status);
            c.setUser(currentAdmin); // 👈 bắt buộc gán vì userId NOT NULL

            categoryService.create(c);
            resp.sendRedirect(req.getContextPath() + "/admin/home");

        } else if (uri.endsWith("category/edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Category c = categoryService.findById(id);

            c.setName(req.getParameter("name"));
            c.setStatus(req.getParameter("status") != null);

            Part filePart = req.getPart("img");
            String fileName = filePart.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                String uploadPath = "D:\\Ki1_Nam3\\ltWeb\\Anh_btth";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();
                filePart.write(uploadPath + File.separator + fileName);
                c.setImg(fileName);
            }

            c.setUser(currentAdmin); // 👈 vẫn gán lại admin khi edit

            categoryService.update(c);
            resp.sendRedirect(req.getContextPath() + "/admin/home");
        }

        // === User ===
        else if (uri.endsWith("user/add")) {
            Users u = new Users();
            u.setUsername(req.getParameter("username"));
            u.setPassword(req.getParameter("password"));
            u.setFullname(req.getParameter("fullname"));
            u.setEmail(req.getParameter("email"));
            u.setPhone(req.getParameter("phone"));
            u.setRole(Integer.parseInt(req.getParameter("role")));
            u.setStatus(req.getParameter("status") != null);

            userService.create(u);
            resp.sendRedirect(req.getContextPath() + "/admin/user/list");

        } else if (uri.endsWith("user/edit")) {
            int id = Integer.parseInt(req.getParameter("id"));
            Users u = userService.findById(id);

            u.setUsername(req.getParameter("username"));
            u.setPassword(req.getParameter("password"));
            u.setFullname(req.getParameter("fullname"));
            u.setEmail(req.getParameter("email"));
            u.setPhone(req.getParameter("phone"));
            u.setRole(Integer.parseInt(req.getParameter("role")));
            u.setStatus(req.getParameter("status") != null);

            userService.update(u);
            resp.sendRedirect(req.getContextPath() + "/admin/user/list");
        }
    }
}
