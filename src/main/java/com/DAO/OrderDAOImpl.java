package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Order;

public class OrderDAOImpl implements OrderDAO {
	private Connection connection;

	// Constructor
	public OrderDAOImpl(Connection connection) {
		super();
		this.connection = connection;
	}

//	@Override
//	public int getOrderNumber() {
//		int i = 1;
//		try {
//			String sql = "SELECT * FROM orders ";
//
//			PreparedStatement preparedStatement = connection.prepareStatement(sql);
//			ResultSet resultSet = preparedStatement.executeQuery();
//
//			while (resultSet.next()) {
//				i++;
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return i;
//	}

	@Override
	public boolean saveOrder(List<Order> order) {
		boolean f = false;
		try {
			String sql = "INSERT INTO orders (orders_id, user_name, email, address, phone, book_name, author, price, payment) VALUES (?,?,?,?,?,?,?,?,?) ";
			
			connection.setAutoCommit(false);
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			for (Order book_order : order) {
				preparedStatement.setString(1, book_order.getOrderId());
				preparedStatement.setString(2, book_order.getUserName());
				preparedStatement.setString(3, book_order.getEmail());
				preparedStatement.setString(4, book_order.getFullAddress());
				preparedStatement.setString(5, book_order.getPhone());
				preparedStatement.setString(6, book_order.getBookName());
				preparedStatement.setString(7, book_order.getAuthor());
				preparedStatement.setString(8, book_order.getPrice());
				preparedStatement.setString(9, book_order.getPaymentType());
				preparedStatement.addBatch();
			}
			int [] count = preparedStatement.executeBatch();
			connection.commit();
			f = true;
			connection.setAutoCommit(true);
			
	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Order> getBook(String email) {
		
		List<Order> list = new ArrayList<Order>();
		Order order = null;
		
		try {
			String sql = "SELECT * FROM orders WHERE email=?";
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, email);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				order = new Order();
				order.setId(resultSet.getInt(1));
				order.setOrderId(resultSet.getString(2));
				order.setUserName(resultSet.getString(3));
				order.setEmail(resultSet.getString(4));
				order.setFullAddress(resultSet.getString(5));
				order.setPhone(resultSet.getString(6));
				order.setBookName(resultSet.getString(7));
				order.setAuthor(resultSet.getString(8));
				order.setPrice(resultSet.getString(9));
				order.setPaymentType(resultSet.getString(10));
				
				list.add(order);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Order> getAllOrder() {
		List<Order> list = new ArrayList<Order>();
		Order order = null;
		
		try {
			String sql = "SELECT * FROM orders";
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				order = new Order();
				order.setId(resultSet.getInt(1));
				order.setOrderId(resultSet.getString(2));
				order.setUserName(resultSet.getString(3));
				order.setEmail(resultSet.getString(4));
				order.setFullAddress(resultSet.getString(5));
				order.setPhone(resultSet.getString(6));
				order.setBookName(resultSet.getString(7));
				order.setAuthor(resultSet.getString(8));
				order.setPrice(resultSet.getString(9));
				order.setPaymentType(resultSet.getString(10));
				
				list.add(order);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}



}
