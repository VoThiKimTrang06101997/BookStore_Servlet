package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO {
	
	private Connection connection;
	
	/* Constructor */
	public CartDAOImpl(Connection connection) {
		super();
		this.connection = connection;
	}



	@Override
	public boolean addCart(Cart cart) {
		boolean f = false;
		try {
			String sql = "INSERT INTO cart(bookId, userId, bookName, author, price, total_price) VALUES (?,?,?,?,?,?)";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, cart.getBookId());
			preparedStatement.setInt(2, cart.getUserId());
			preparedStatement.setString(3, cart.getBookName());
			preparedStatement.setString(4, cart.getAuthor());
			preparedStatement.setDouble(5, cart.getPrice());
			preparedStatement.setDouble(6, cart.getTotalPrice());
			
			int i = preparedStatement.executeUpdate();
			if(i==1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}



	@Override
	public List<Cart> getBookByUser(int userId) {
		List<Cart> listCart = new ArrayList<Cart>();
		Cart cart = null;
		
		double totalPrice = 0;
		
		try {
			String sql = "SELECT * FROM cart WHERE userId=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, userId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				cart = new Cart();
				cart.setCartId(resultSet.getInt(1));
				cart.setBookId(resultSet.getInt(2));
				cart.setUserId(resultSet.getInt(3));
				cart.setBookName(resultSet.getString(4));
				cart.setAuthor(resultSet.getString(5));
				cart.setPrice(resultSet.getDouble(6));
				
				totalPrice = totalPrice + resultSet.getDouble(7);
				cart.setTotalPrice(totalPrice);
				
				listCart.add(cart);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCart;
	}



	@Override
	public boolean deleteBooks(int bookId, int userId, int cartId) {
		boolean f = false;
		
		try {
			String sql = "DELETE FROM cart WHERE bookId=? and userId= ? and cartId=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, bookId);
			preparedStatement.setInt(2, userId);
			preparedStatement.setInt(3, cartId);
			
			int index = preparedStatement.executeUpdate();
			
			if(index == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return f;
	}

}
