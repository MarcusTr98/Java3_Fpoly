package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class CalcServlet
 */
@WebServlet("/CalcServlet")
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CalcServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/views/calc.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String numberA = request.getParameter("a");
			String numberB = request.getParameter("b");
			String calc = request.getParameter("calc");

			int a = Integer.parseInt(numberA);
			int b = Integer.parseInt(numberB);
			int kq;
			if ("+".equals(calc)) {
				kq = a + b;
			} else {
				kq = a - b;
			}
			request.setAttribute("kq", a + calc + b + "=" + kq);
			request.getRequestDispatcher("/views/calc.jsp").forward(request, response);

		} catch (NumberFormatException e) {
			System.out.println("Lỗi servlet NumberFormatException: " + e);
		} catch (Exception e) {
			System.out.println("Lỗi servlet: " + e);
		}
	}

}
