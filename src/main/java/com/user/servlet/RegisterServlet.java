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


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		
		try {
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone_number = req.getParameter("phone_number");
			String password = req.getParameter("password");
			String check = req.getParameter("check");
			
			// System.out.println(name + " " + email + " " + phone_number + " " + password + " " + check);
			
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPhone_number(phone_number);
			user.setPassword(password);
			
			HttpSession session = req.getSession();
						
//			if(check != null) {
//
//				UserDAOImpl userDAOImpl = new UserDAOImpl(DBConnect.getConnection());
//				boolean f = userDAOImpl.userRegister(user);
//				
//				if(f) {
//					// System.out.println("User Register Success...");
//					session.setAttribute("SuccessMessage", "User Registration Successfully..");
//					resp.sendRedirect("register.jsp");
//				} else {
//					// System.out.println("Something wrong on server...");
//					session.setAttribute("FailedMessage", "Something wrong on server...");
//					resp.sendRedirect("register.jsp");
//				}
//			} else {
//				// System.out.println("Please Check Agree Terms & Conditions");
//				session.setAttribute("FailedMessage", "Please Check Agree Terms & Conditions !!");
//				resp.sendRedirect("register.jsp");
//			}
			

			UserDAOImpl userDAOImpl = new UserDAOImpl(DBConnect.getConnection());
			boolean f = userDAOImpl.userRegister(user);
			
			if(f) {
				// System.out.println("User Register Success...");
				session.setAttribute("SuccessMessage", "User Registration Successfully..");
				resp.sendRedirect("register.jsp");
			} else {
				// System.out.println("Something wrong on server...");
				session.setAttribute("FailedMessage", "Please Check Agree Terms & Conditions !!");
				resp.sendRedirect("register.jsp");
			}
			
		} catch (Exception e) {;
			e.printStackTrace();
		}
	}
}
