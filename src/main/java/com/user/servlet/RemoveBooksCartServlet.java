package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/remove_books")
public class RemoveBooksCartServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bookId = Integer.parseInt(req.getParameter("bookId"));
		int userId = Integer.parseInt(req.getParameter("userId"));
		int cartId = Integer.parseInt(req.getParameter("cartId"));
		
		CartDAOImpl cartDAOImpl = new CartDAOImpl(DBConnect.getConnection());
		
		boolean f = cartDAOImpl.deleteBooks(bookId, userId, cartId);
		
		HttpSession session = req.getSession();
		
		if(f) {
			session.setAttribute("successMessage", "Books were removed from Cart");
			resp.sendRedirect("checkout.jsp");
		} else {
			session.setAttribute("failedMessage", "Something was wrong on Server");
			resp.sendRedirect("checkout.jsp");
		}
		
	}
}
