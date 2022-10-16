package com.entity;

public class Order {
	private int id;
	private String userName;
	private String orderId;
	private String email;
	private String address;
	private String phone;
	private String fullAddress;
	private String bookName;
	private String author;
	private String price;
	private String paymentType;

	/* Constructor */

	public Order() {
		super();
	}

	public Order(int id, String userName, String orderId, String email, String address, String phone,
			String fullAddress, String bookName, String author, String price, String paymentType) {
		super();
		this.id = id;
		this.userName = userName;
		this.orderId = orderId;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.fullAddress = fullAddress;
		this.bookName = bookName;
		this.author = author;
		this.price = price;
		this.paymentType = paymentType;
	}

	/* getter and setter */
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFullAddress() {
		return fullAddress;
	}

	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

}
