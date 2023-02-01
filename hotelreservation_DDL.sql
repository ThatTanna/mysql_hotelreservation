create database if not exists hotelreservation;

use hotelreservation;

SHOW DATABASES;

create table if not exists employee (
	id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    salary int not null,
    primary key (id)
);

create table if not exists room (
	id int not null auto_increment,
    room_type varchar(50) not null,
    # room_type enum('standard', 'deluxe', 'president', 'suite') not null,
    price int not null,
    primary key (id)
);

create table if not exists customer (
	id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    primary key (id)
);

create table if not exists customer2 (
	id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    primary key (id)
);


create table if not exists reservation (
	id int not null auto_increment,
    customer_id int not null,
    room_id int not null,
    start_date date,
    end_date date,
    total_cost int not null,
    primary key (id),
    foreign key(customer_id) references customer(id), # on delete cascade on update cascade
    foreign key(room_id) references room(id)
);

create table if not exists dependant (
	id int not null auto_increment,
    employee_id int not null,
    foreign key (employee_id) references employee(id),
    full_name varchar(100) not null,
    relationship varchar(100) not null,
    birth_date date,
    primary key (id)
);

