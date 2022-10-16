package com.DAO;

import java.util.List;

import com.entity.Order;

public interface OrderDAO {
	// public int getOrderNumber();
	
	public boolean saveOrder(List<Order> order);
	
	public List<Order> getBook(String email);
	
	public List<Order> getAllOrder();
}
