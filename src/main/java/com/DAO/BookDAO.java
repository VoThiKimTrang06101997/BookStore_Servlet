package com.DAO;

import java.util.ArrayList;
import java.util.List;

import com.entity.BookAdmin;

public interface BookDAO {
	public boolean addBooks(BookAdmin bookAdmin);
	
	public List<BookAdmin> getAllBooks();

	public BookAdmin getBookById(int id);
	
	public boolean updateEditBooks(BookAdmin bookAdmin);

	public boolean deleteBooks(int id);
	
	public List<BookAdmin> getNewBooks();
	
	public List<BookAdmin> getRecentBooks();
	
	public List<BookAdmin> getOldBooks();
	
	public List<BookAdmin> getAllRecentBooks();
	
	public List<BookAdmin> getAllNewBooks();
	
	public List<BookAdmin> getAllOldBooks();
	
	public List<BookAdmin> getBooksByOld(String email, String category);
	
	public boolean oldBooksDelete(String email, String category, int bookId);
	
	public List<BookAdmin> getBookBySearch(String ch);
	
}
