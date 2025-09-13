package btth.controller;

import btth.entity.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/home")
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        Users user = (session != null) ? (Users) session.getAttribute("user") : null;

        req.setAttribute("user", user);
        req.getRequestDispatcher("/views/web/home.jsp").forward(req, resp);
    }
}
