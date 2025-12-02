package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;

@MultipartConfig
@WebServlet("/uploads")
public class AlbumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AlbumServlet() {
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
		request.getRequestDispatcher("/views/album.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Part part = request.getPart("avatar");

			if (part == null || part.getSize() == 0) {
				request.setAttribute("messenger", "Cần chọn file tải lên!");
				request.getRequestDispatcher("/views/album.jsp").forward(request, response);
				return;
			}
			String fileName = Path.of(part.getSubmittedFileName()).getFileName().toString();

			String uploadPath = request.getServletContext().getRealPath("/uploads");
			File uploadDir = new File(uploadPath);
			if (!uploadDir.exists()) {
				uploadDir.mkdir();
			}
			part.write(uploadPath + File.separator + fileName);
			request.setAttribute("messenger", "Upload " + fileName + " thành công!");
			request.setAttribute("fileName", fileName);
		} catch (Exception e) {
			System.out.println("Có lỗi Servlet: " + e);
			request.setAttribute("messenger", "Lỗi update!");
		}
		request.getRequestDispatcher("/views/album.jsp").forward(request, response);
	}

}
