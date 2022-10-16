package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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



}
