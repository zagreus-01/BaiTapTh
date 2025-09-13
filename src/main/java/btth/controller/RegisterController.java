package btth.controller;

import btth.entity.Users;
import btth.services.UserServices;
import btth.services.impl.UserServicesImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserServices userService = new UserServicesImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/web/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        try {
            Users user = new Users();
            user.setUsername(username);
            user.setPassword(password);
            user.setFullname(fullname);
            user.setEmail(email);
            user.setPhone(phone);
            user.setRole(0); // mặc định user thường
            user.setStatus(true);

            userService.create(user);
            resp.sendRedirect(req.getContextPath() + "/login");
        } catch (Exception e) {
            req.setAttribute("error", "Đăng ký thất bại: " + e.getMessage());
            req.getRequestDispatcher("/views/web/register.jsp").forward(req, resp);
        }
    }
}
