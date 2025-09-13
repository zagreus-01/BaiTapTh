package btth.controller;

import btth.entity.Users;
import btth.services.UserServices;
import btth.services.impl.UserServicesImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserServices userService = new UserServicesImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Users user = userService.findByUsernamePassword(username, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            // điều hướng theo role
            if (user.getRole() == 0) {
                resp.sendRedirect(req.getContextPath() + "/user/home");
            } else if (user.getRole() == 1) {
                resp.sendRedirect(req.getContextPath() + "/manager/home");
            } else if (user.getRole() == 2) {
                resp.sendRedirect(req.getContextPath() + "/admin/home");
            } else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }
        } else {
            req.setAttribute("error", "Sai username hoặc password");
            req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
        }
    }
}
