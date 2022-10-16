package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DAO.OrderDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Order;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phone_number = req.getParameter("phone_number");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pin_code");
			String paymentType = req.getParameter("payment_type");
			
			String fullAddress = address + "," + landmark + "," + city + "," + state + "," + pincode;
			//System.out.println(name + " " + email + " " + phone_number + " " + fullAddress + " " + paymentType);
			
			CartDAOImpl cartDAOImpl = new CartDAOImpl(DBConnect.getConnection());
			
			List<Cart> listCarts = cartDAOImpl.getBookByUser(id);
			
//			for (Cart cart : listCarts) {
//				System.out.println(cart.getBookName());
//			}
			
			if(listCarts.isEmpty()) {
				session.setAttribute("failedMessage", "Add Item");
				resp.sendRedirect("checkout.jsp");
			} else {
				OrderDAOImpl orderDAOImpl = new OrderDAOImpl(DBConnect.getConnection());
				// int  i = orderDAOImpl.getOrderNumber();
				
				Order order = null;
				ArrayList<Order> orderList = new ArrayList<Order>();
				
				Random random = new Random();
				
				for (Cart cart : listCarts) {
					// System.out.println(cart.getBookName() + " " + cart.getAuthor() + " " + cart.getPrice());
					order = new Order();
					order.setOrderId("BOOK-ORDER-00" + random.nextInt(1000));
					order.setUserName(name);
					order.setEmail(email);
					order.setPhone(phone_number);
					order.setFullAddress(fullAddress);
					order.setBookName(cart.getBookName());
					order.setAuthor(cart.getAuthor());
					order.setPrice(cart.getPrice() + "");
					order.setPaymentType(paymentType);
					
					// i++;
					
					orderList.add(order);
					
				}
				if("no_select".equals(paymentType)) {
					session.setAttribute("failedMessage", "Please Choose a Payment Method !!");
					resp.sendRedirect("checkout.jsp");
				} else {
					boolean f = orderDAOImpl.saveOrder(orderList);
					
					if(f) {
						resp.sendRedirect("order_success.jsp");
						
					} else {
						session.setAttribute("failedMessage", "Your Order Failed !!");
						resp.sendRedirect("checkout.jsp");
					}
				}
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
