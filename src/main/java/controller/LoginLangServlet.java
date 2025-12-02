package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import dao.UserDAO;
import entity.UserEntity;

/**
 * Servlet implementation class LoginLangServlet
 */
@WebServlet("/login-lang")
public class LoginLangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginLangServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/views/login-I8N.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. SET UTF-8 CHO RESPONSE (Fix lỗi hiển thị tên)
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 2. SET UTF-8 CHO REQUEST (Để nhận dữ liệu từ form tiếng Việt không bị lỗi)
		request.setCharacterEncoding("UTF-8");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// KHỞI TẠO BỘ TỪ ĐIỂN I18N (Dùng chung cho cả hàm)
		String lang = (String) request.getSession().getAttribute("lang");
		Locale locale = (lang != null && lang.equals("vi")) ? new Locale("vi", "VN") : Locale.ENGLISH;
		ResourceBundle bundle = ResourceBundle.getBundle("resources.global", locale);

		// 1. VALIDATION
		if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
			String errorMsg = bundle.getString("error.empty"); // Lấy từ file properties
			request.setAttribute("message", errorMsg);
			request.setAttribute("username", username);
			request.getRequestDispatcher("/views/login-I8N.jsp").forward(request, response);
			return;
		}

		// 2. TRIGGER BUG (Test lỗi 500)
		if ("bug".equals(username)) {
			int a = 1 / 0;
		}

		// 3. BUSINESS LOGIC
		UserDAO dao = new UserDAO();
		UserEntity userEntity = dao.checkLogin(username, password);

		if (userEntity != null) {
			// Login thành công
			response.getWriter().println("LOGIN SUCCESS! Welcome " + userEntity.getFullname());
		} else {
			// Login thất bại -> Lấy câu lỗi đa ngôn ngữ
			String errorMsg = bundle.getString("error.login.fail");

			request.setAttribute("message", errorMsg);
			request.setAttribute("username", username); // Giữ lại username để user đỡ phải gõ lại
			request.getRequestDispatcher("/views/login-I8N.jsp").forward(request, response);
		}
	}
}
