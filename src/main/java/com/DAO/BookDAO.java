package com.DAO;

import java.util.List;

import com.entity.BookAdmin;

public interface BookDAO {
	public boolean addBooks(BookAdmin bookAdmin);
	
	public List<BookAdmin> getAllBooks();
	
	public BookAdmin getBookById(int id);
	
	public boolean updateEditBooks(BookAdmin bookAdmin);

	public boolean deleteBooks(int id);
}
