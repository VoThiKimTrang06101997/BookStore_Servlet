create database book_store;

use book_store;


create table if not exists user (
	id int auto_increment,
    name varchar(255) not null,
    email varchar(255),
    phone_number varchar(255),
    password varchar(255),
    address varchar(255),
    landmark varchar(255),
    city varchar(255),
    state varchar(255),
    pincode varchar(255),
    primary key(id)
);

create table if not exists book_admin (
	bookId int auto_increment not null,
    bookname varchar(255) null,
    author varchar(255) null,
    price double null,
    bookCategory varchar(255) null,
    status varchar(255) null,
    photo varchar(255) null,
    primary key (bookId)
);

create table if not exists cart(
	cartId int auto_increment not null,
    bookId int null,
    userId int null,
    bookName varchar(255),
    author varchar(255),
    price double null,
    total_price double null,
    primary key (cartId)
);





