package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookAdmin;


@WebServlet("/edit_books")
@MultipartConfig
public class EditBooksServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("book_name");
			String author = req.getParameter("author_name");
			// Double price = Double.parseDouble(req.getParameter("price"));
			String price = req.getParameter("price");
			String status = req.getParameter("book_status");
			
			Part part = req.getPart("book_image");
			String fileName = part.getSubmittedFileName();

			BookAdmin bookAdmin = new BookAdmin();
			
			bookAdmin.setBookId(id);
			bookAdmin.setBookName(bookName);
			bookAdmin.setAuthor(author);
			bookAdmin.setPrice(price);
			bookAdmin.setStatus(status);
			bookAdmin.setPhoto(fileName);
			
			BookDAOImpl bookDAOImpl = new BookDAOImpl(DBConnect.getConnection());
			boolean f = bookDAOImpl.updateEditBooks(bookAdmin);
			
			HttpSession session = req.getSession();
			
			if(f) {
				String path = getServletContext().getRealPath("") + "book_img";

				File file = new File(path);
				part.write(path + File.separator + fileName);

				System.out.println(path);
				
				session.setAttribute("successMessage", "Book Update Successfully...");
				resp.sendRedirect("admin/all_books.jsp");
			} else {
				session.setAttribute("failedMessage", "Something wrong on Server...");
				resp.sendRedirect("admin/all_books.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
