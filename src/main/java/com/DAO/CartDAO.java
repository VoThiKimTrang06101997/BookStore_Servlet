package com.DAO;

import java.util.List;

import com.entity.Cart;

public interface CartDAO {
	public boolean addCart(Cart cart);
	
	public List<Cart> getBookByUser(int userId);
	
	public boolean deleteBooks(int bookId, int userId, int cartId);
}
