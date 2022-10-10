package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookAdmin;
import com.entity.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bookId = Integer.parseInt(req.getParameter("bookId"));
			int userId = Integer.parseInt(req.getParameter("userId"));
			
			BookDAOImpl bookDAOImpl = new BookDAOImpl(DBConnect.getConnection());
			BookAdmin bookAdmin = bookDAOImpl.getBookById(bookId);
			
			Cart cart = new Cart();
			cart.setBookId(bookId);
			cart.setUserId(userId);
			cart.setBookName(bookAdmin.getBookName());
			cart.setAuthor(bookAdmin.getAuthor());
			cart.setPrice(Double.parseDouble(bookAdmin.getPrice()));
			cart.setTotalPrice(Double.parseDouble(bookAdmin.getPrice()));
			
			CartDAOImpl cartDAOImpl = new CartDAOImpl(DBConnect.getConnection());
			boolean f = cartDAOImpl.addCart(cart);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("addCart", "Book Was Added To Cart Successfully !!");
				resp.sendRedirect("all_new_books.jsp");
			} else {
				session.setAttribute("failed", "Something is wrong on Server");
				resp.sendRedirect("all_new_books.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
