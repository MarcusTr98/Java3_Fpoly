package filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import entity.UserEntity;

// Nên filter theo URL pattern của Controller
@WebFilter({ "/admin/*" })
public class AuthFilter extends HttpFilter implements Filter {

	/**
	 * @see HttpFilter#HttpFilter()
	 */
	public AuthFilter() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		// Lấy đường dẫn hiện tại user đang muốn vào (VD: /Java3/admin/dashboard)
		String requestUri = req.getRequestURI();
		
		HttpSession session = req.getSession(false);

		// 1. Kiểm tra đăng nhập (Authentication)
		// Ktra xen đã lưu ở session chưa
		if (session == null || session.getAttribute("userInfo") == null) {
			// Logic UX: Lưu lại đường dẫn họ đang muốn vào để tí login xong trả về đó
            // Phải tạo session mới (true) để lưu trữ
			req.getSession(true).setAttribute("secureUrl", requestUri);
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}
		
		// 2. Kiểm tra tiếp quyền hạn (Authorization)
		UserEntity user = (UserEntity) session.getAttribute("userInfo");
		
		// Nếu đang cố vào trang admin (/admin/...) mà Role lại là User (false)
		if (requestUri.contains("/dashboard") && !user.isRole()) {
			// ĐÁ VỀ TRANG CỦA USER HOẶC TRANG LỖI 403
			resp.sendRedirect(req.getContextPath() + "/home");
			return;
		}
		
		// Đã đăng nhập + kiểm tra role
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
