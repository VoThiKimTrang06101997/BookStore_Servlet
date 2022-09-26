package com.DAO;

import java.util.List;

import com.entity.BookAdmin;

public interface BookDAO {
	public boolean addBooks(BookAdmin bookAdmin);
	
	public List<BookAdmin> getAllBooks();
}
