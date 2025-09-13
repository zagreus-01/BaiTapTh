package btth.filter;

import java.io.IOException;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import btth.entity.Users;



@WebFilter(urlPatterns = {"/user/*","/admin/*", "/manager/*"})
public class RoleFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		if(session == null || session.getAttribute("user") == null) {
			res.sendRedirect(req.getContextPath() + "/login");
			return;
		}
		
		Users user = (Users) session.getAttribute("user");
		String path= req.getServletPath();
		int role = user.getRole();
		boolean allowed = false;
		
		if(path.startsWith("/admin/") && role == 2) {
			allowed = true;}
		else if(path.startsWith("/manager/") && role ==1) {
			allowed = true;}
		else if(path.startsWith("/user/") && role == 0) {
			allowed = true;}
		if(allowed) {
			chain.doFilter(req, res);
		}
		else {
			res.sendRedirect(req.getContextPath() + "/login");
		}
		
	}
	
	@Override
	public void destroy() {
	}
	
}
