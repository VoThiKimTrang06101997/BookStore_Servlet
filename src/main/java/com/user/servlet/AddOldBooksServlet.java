package com.user.servlet;

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

@WebServlet("/add_old_books")
@MultipartConfig
public class AddOldBooksServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String bookName = req.getParameter("book_name");
			String author = req.getParameter("author_name");
			String price = req.getParameter("price");
			String bookCategory = "Old";
			String status = "Active";

			Part part = req.getPart("book_image");
			String fileName = part.getSubmittedFileName();
			
			String userEmail = req.getParameter("user");

			BookAdmin bookAdmin = new BookAdmin(0, bookName, author, price, bookCategory, status, fileName, userEmail);
			System.out.println(bookAdmin);
			

			BookDAOImpl bookDAOImpl = new BookDAOImpl(DBConnect.getConnection());

			boolean f = bookDAOImpl.addBooks(bookAdmin);

			HttpSession session = req.getSession();

			if (f) {
				String path = getServletContext().getRealPath("") + "book_img";

				File file = new File(path);
				part.write(path + File.separator + fileName);

				System.out.println(path);

				session.setAttribute("successMessage", "Book Add Successfully !!");
				resp.sendRedirect("sell_books.jsp");
			} else {
				session.setAttribute("failedMessage", "Something wrong on Server");
				resp.sendRedirect("sell_books.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
