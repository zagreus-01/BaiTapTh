package btth.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import btth.entity.Users;

@WebServlet("/waiting")
public class WaitingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			// Chưa login thì quay lại login
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		Users user = (Users) session.getAttribute("user");
		int role = user.getRole();

		// Điều hướng theo role
		switch (role) {
		case 0: // user thường
			response.sendRedirect(request.getContextPath() + "/user/home");
			break;
		case 1: // manager
			response.sendRedirect(request.getContextPath() + "/manager/home");
			break;
		case 2: // admin
			response.sendRedirect(request.getContextPath() + "/admin/home");
			break;
		default:
			// Nếu role không hợp lệ thì logout
			session.invalidate();
			response.sendRedirect(request.getContextPath() + "/login");
			break;
		}
	}
}
