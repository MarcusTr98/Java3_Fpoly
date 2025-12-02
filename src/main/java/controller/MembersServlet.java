package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

import dao.MemberDAO;
import entity.MembersEntity;

/**
 * Servlet implementation class MembersServlet
 */
@WebServlet({ "/signup", "/list-members" })
public class MembersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MembersServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberDAO mbDAO = new MemberDAO();
		String uri = request.getRequestURI();
		if (uri.contains("list-members")) {

			List<MembersEntity> list = mbDAO.findAll();
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/list-members.jsp").forward(request, response);

		} else {
			request.getRequestDispatcher("/views/signup-members.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MembersEntity member = new MembersEntity();
		try {
			BeanUtils.populate(member, request.getParameterMap());
			MemberDAO mbDAO = new MemberDAO();
			mbDAO.insert(member);
			request.setAttribute("message", "Inser thành công member!");
			response.sendRedirect(request.getContextPath() + "/list-members");
			return;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Lỗi Member Servlet: " + e);
			request.setAttribute("message", "Lỗi Insert Member!");
		}
		request.getRequestDispatcher("/views/signup-members.jsp").forward(request, response);

	}

}
