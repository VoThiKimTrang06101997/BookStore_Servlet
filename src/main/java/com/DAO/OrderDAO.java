package com.DAO;

import java.util.List;

import com.entity.Order;

public interface OrderDAO {
	// public int getOrderNumber();
	
	public boolean saveOrder(List<Order> order);
}
