package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.UserDAO;
import entity.UserEntity;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet({ "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/views/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		UserDAO dao = new UserDAO();
		// 1. Kiểm tra user từ Database
		UserEntity userEntity = dao.checkLogin(username, password);

		// 2. Logic check phải dựa vào user entity
		if (userEntity != null) {
			HttpSession session = request.getSession();

			// 3. Lưu toàn bộ Object User vào session với key thống nhất là "userInfo"
			session.setAttribute("userInfo", userEntity);

			// 4. Xử lý Redirect
			Object targetUrl = session.getAttribute("secureUrl");
			if (targetUrl != null) {
				session.removeAttribute("secureUrl");
				response.sendRedirect(targetUrl.toString());
			} else {
				// phân quyền
				if (userEntity.isRole()) {
					response.sendRedirect(request.getContextPath() + "/admin/dashboard");
				} else {
					response.sendRedirect(request.getContextPath() + "/home");
				}
			}
		} else {
			request.setAttribute("message", "Sai tài khoản hoặc mật khẩu!");
			request.getRequestDispatcher("/views/login.jsp").forward(request, response);
		}
	}

}
