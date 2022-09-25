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



