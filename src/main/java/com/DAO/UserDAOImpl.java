package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.DB.DBConnect;
import com.entity.User;


public class UserDAOImpl implements UserDAO {
	private Connection connection;

	public UserDAOImpl(Connection connection) {
		super();
		this.connection = connection;
	}


	@Override
	public boolean userRegister(User user) {
		boolean f= false;
		
		Connection connection = DBConnect.getConnection();
		
		try {
			String sql = "INSERT INTO USER (name, email, phone_number, password) VALUES (?,?,?,?)";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getPhone_number());
			preparedStatement.setString(4, user.getPassword());
			
			int register = preparedStatement.executeUpdate();
			if(register == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public User login(String email, String password) {
		User user = null;
		
		try {
			String sql = "SELECT * FROM USER WHERE email = ? and password = ?";
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setId(resultSet.getInt(1));
				user.setName(resultSet.getString(2));
				user.setEmail(resultSet.getString(3));
				user.setPhone_number(resultSet.getString(4));
				user.setPassword(resultSet.getString(5));
				user.setAddress(resultSet.getString(6));
				user.setLandmark(resultSet.getString(7));
				user.setCity(resultSet.getString(8));
				user.setState(resultSet.getString(9));
				user.setPincode(resultSet.getString(10));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}


	@Override
	public boolean checkPassword(int id, String password) {
		boolean f = false;
		
		try {
			String sql = "SELECT * FROM user WHERE id = ? AND password = ?";
			
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			
			preparedStatement.setInt(1, id);
			preparedStatement.setString(2, password);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				f = true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}


	@Override
	public boolean updateProfile(User user) {
		boolean f = false;

		Connection connection = DBConnect.getConnection();

		try {
			String sql = "UPDATE user SET name=?, email=?, phone_number=?, password=? WHERE id=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getPhone_number());
			preparedStatement.setString(4, user.getPassword());
			preparedStatement.setInt(5, user.getId());

			int index = preparedStatement.executeUpdate();
			if (index == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}