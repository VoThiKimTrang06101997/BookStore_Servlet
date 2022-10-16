package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone_number = req.getParameter("phone_number");
			String password = req.getParameter("password");
			
			User user = new User();
			user.setId(id);
			user.setName(name);
			user.setEmail(email);
			user.setPhone_number(phone_number);
			user.setPassword(password);
			
			HttpSession session = req.getSession();
			
			UserDAOImpl userDAOImpl = new UserDAOImpl(DBConnect.getConnection());
			
			boolean f = userDAOImpl.checkPassword(id, password);
			if(f) {
				boolean update = userDAOImpl.updateProfile(user);
				if(update) {
					session.setAttribute("successMessage", "User Profile is updated Successfully...");
					resp.sendRedirect("edit_profile.jsp");
				} else {
					session.setAttribute("FailedMessage", "Something is wrong on Server");
					resp.sendRedirect("edit_profile.jsp");
				}
				
			} else {
				session.setAttribute("FailedMessage", "Your Password is Incorrect");
				resp.sendRedirect("edit_profile.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
