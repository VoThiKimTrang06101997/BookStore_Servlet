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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			UserDAOImpl userDAOImpl = new UserDAOImpl(DBConnect.getConnection());
			
			HttpSession session = req.getSession();
			
			
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			// System.out.println(email + " " + password);
			
			if("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User user = new User();
				user.setName("Admin");
				
				session.setAttribute("UserObjective", user);
				resp.sendRedirect("admin/home.jsp");
			} else {
				User user = userDAOImpl.login(email, password);
				
				if(user != null) {
					session.setAttribute("UserObjective", user);
					resp.sendRedirect("index.jsp");
				} else {
					session.setAttribute("FailedMessage", "Email & Password Invalid");
					resp.sendRedirect("login.jsp");
				}
				resp.sendRedirect("home.jsp");
			}
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
