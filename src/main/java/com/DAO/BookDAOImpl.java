package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookAdmin;

public class BookDAOImpl implements BookDAO{
	private Connection connection;
	
	public BookDAOImpl(Connection connection) {
		super();
		this.connection = connection;
	}

	@Override
	public boolean addBooks(BookAdmin bookAdmin) {
		boolean f = false;
		try {
			String query = "INSERT INTO book_admin (bookname, author, price, bookCategory, status, photo, email) VALUES (?,?,?,?,?,?,?)";
			
			PreparedStatement preparableStatement = connection.prepareStatement(query);
			preparableStatement.setString(1, bookAdmin.getBookName());
			preparableStatement.setString(2, bookAdmin.getAuthor());
			preparableStatement.setString(3, bookAdmin.getPrice());
			preparableStatement.setString(4, bookAdmin.getBookCategory());
			preparableStatement.setString(5, bookAdmin.getStatus());
			preparableStatement.setString(6, bookAdmin.getPhoto());
			preparableStatement.setString(7, bookAdmin.getUserEmail());
			
			int i = preparableStatement.executeUpdate();
			
			if(i == 1) {
				f = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookAdmin> getAllBooks() {
		List<BookAdmin> listBookAdmin = new ArrayList<BookAdmin>();
		BookAdmin bookAdmin = null;
		
		try {
			String query = "SELECT * FROM book_admin";
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				bookAdmin = new BookAdmin();
				bookAdmin.setBookId(resultSet.getInt(1));
				bookAdmin.setBookName(resultSet.getString(2));
				bookAdmin.setAuthor(resultSet.getString(3));
				bookAdmin.setPrice(resultSet.getString(4));
				bookAdmin.setBookCategory(resultSet.getString(5));
				bookAdmin.setStatus(resultSet.getString(6));
				bookAdmin.setPhoto(resultSet.getString(7));
				bookAdmin.setUserEmail(resultSet.getString(8));
				
				listBookAdmin.add(bookAdmin);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listBookAdmin;
	}

}
