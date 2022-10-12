package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

@WebServlet("/delete_old_books")
public class DeleteOldBooksServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");
			int bookId = Integer.parseInt(req.getParameter("bookId"));
			
			
			BookDAOImpl bookDAOImpl = new BookDAOImpl(DBConnect.getConnection());
			
			boolean f = bookDAOImpl.oldBooksDelete(email, "Old", bookId);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("successMessage", "Old Book was deleted successfully");
				resp.sendRedirect("old_books.jsp");
			} else {
				session.setAttribute("failedMessage", "Something was wrong on Server");
				resp.sendRedirect("old_books.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
