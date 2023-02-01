USE hotelreservation;

################
### CUSTOMER ###
################

INSERT INTO customer (first_name, last_name) VALUES ('James', 'Bond');
INSERT INTO customer (first_name, last_name) VALUES ('Kit', 'Kat');
INSERT INTO customer (first_name, last_name) VALUES ('Big', 'Bang');
INSERT INTO customer (first_name, last_name) VALUES ('Black', 'Pink');
INSERT INTO customer (first_name, last_name) VALUES ('Blue', 'Black');
INSERT INTO customer (first_name, last_name) VALUES ('Desmond', 'Koh');
INSERT INTO customer (first_name, last_name) VALUES ('Pei Ling', 'Tin');
INSERT INTO customer (first_name, last_name) VALUES ('Pritan', 'Singh');
INSERT INTO customer (first_name, last_name) VALUES ('Edwin', 'Tong');

# CREATE table customer3 as select * from customer; | don't CREATE in DML
# DROP table customer3;

INSERT INTO customer2 (first_name, last_name) VALUES ('James', 'Bond');
INSERT INTO customer2 (first_name, last_name) VALUES ('Kit', 'Kat');
INSERT INTO customer2 (first_name, last_name) VALUES ('Big', 'Bang');
INSERT INTO customer2 (first_name, last_name) VALUES ('Black', 'Pink');
INSERT INTO customer2 (first_name, last_name) VALUES ('Blue', 'Black');
INSERT INTO customer2 (first_name, last_name) VALUES ('Desmond', 'Koh');
INSERT INTO customer2 (first_name, last_name) VALUES ('Pei Ling', 'Tin');
INSERT INTO customer2 (first_name, last_name) VALUES ('Pritan', 'Singh');
INSERT INTO customer2 (first_name, last_name) VALUES ('Edwin', 'Tong');

############
### ROOM ###
############

INSERT INTO room (room_type, price) VALUES ('standard', 100);
INSERT INTO room (room_type, price) VALUES ('deluxe', 250);
INSERT INTO room (room_type, price) VALUES ('president', 350);
INSERT INTO room (room_type, price) VALUES ('suite', 500);

SELECT * FROM customer;
SELECT * FROM customer2;

UPDATE customer2
set first_name = 'Hsien Loong',
last_name = 'Lee'
where id = 9;

delete from customer2 where id = 6;
delete from customer2;

SELECT * FROM room;
SELECT count(*) from room;

INSERT INTO reservation (customer_id, room_id, start_date, end_date, total_cost)
VALUES (1, 1, '2023-02-01', '2023-02-02', 100);
INSERT INTO reservation (customer_id, room_id, start_date, end_date, total_cost)
VALUES (2, 2, '2023-02-02', '2023-02-04', 200);
INSERT INTO reservation (customer_id, room_id, start_date, end_date, total_cost)
VALUES (3, 3, '2023-02-15', '2023-02-18', 500);
INSERT INTO reservation (customer_id, room_id, start_date, end_date, total_cost)
VALUES (4, 4, '2023-03-03', '2023-03-04', 250);
INSERT INTO reservation (customer_id, room_id, start_date, end_date, total_cost)
VALUES (5, 105, '2023-03-05', '2023-03-07', 700);

SELECT * FROM reservation;

SELECT resv.id resv_id, cust.id cust_id, cust.first_name, cust.last_name,
	resv.start_date, resv.end_date, resv.total_cost, room.price, room.room_type
	FROM customer cust
	INNER JOIN reservation resv
	ON cust.id = resv.customer_id
	INNER JOIN room
	ON resv.room_id = room.id;
    
SELECT DISTINCT cust.first_name, cust.last_name
FROM customer cust
INNER JOIN reservation resv
ON cust.id = resv.customer_id
INNER JOIN room
ON resv.room_id = room_id;

SELECT start_date, SUM(DATEDIFF(start_date, end_date) * total_cost) FROM reservation
WHERE start_date BETWEEN '2023-02-01' AND end_date = '2023-03-04'
GROUP BY room_id;

SELECT * FROM reservation
WHERE start_date BETWEEN '2023-02-01' AND '2023-03-04';

SELECT 'Feb 2023' AS period, room_id, COUNT(*) cnt
FROM reservation
WHERE start_date BETWEEN '2023-02-01' AND '2023-03-04'
GROUP BY room_id
UNION
SELECT 'Mar 2023' AS period, room_id, COUNT(*) cnt
FROM reservation
WHERE start_date BETWEEN '2023-03-01' AND '2023-03-31'
GROUP BY room_id;

SELECT * FROM customer
ORDER BY first_name, last_name ASC;

insert into employee(first_name, last_name, salary) values ('James', 'Pang', 5000);
insert into employee(first_name, last_name, salary) values ('Desmond', 'Koh', 6000);
insert into employee(first_name, last_name, salary) values ('Eddie', 'Kun', 7000);

select * from employee;

insert into dependant(employee_id, full_name, relationship, birth_date) values (1, 'Koh Jing Xing', 'father', '1985-01-01');
insert into dependant(employee_id, full_name, relationship, birth_date) values (1, 'Tan Kelly', 'mother', '1990-12-12');
insert into dependant(employee_id, full_name, relationship, birth_date) values (2, 'Lim Esther', 'mother', '1976-02-04');
insert into dependant(employee_id, full_name, relationship, birth_date) values (3, 'Pang Cheng Hao', 'father', '1977-03-05');

select * from dependant;

select e.id emp_id, e.first_name, e.last_name, e.salary,
d.id dep_id, d.full_name, d.relationship, d.birth_date from employee e
inner join dependant d
on e.id = d.employee_id;

SELECT 'Feb 2023' AS Feb, room_id AS feb_room_id, count(*) as feb_cnt
'' as Mar, NULL AS mar_room_id, NULL AS Mar_cnt
FROM reservation
WHERE start_date BETWEEN '2023-02-01' AND '2023-02-28'
GROUP BY room_id
UNION
SELECT '' AS Feb, NULL AS feb_room_id, NULL AS Feb_cnt,
'Mar 2023' AS Mar, room_id AS Mar_Room_id, count(*) as Mar_cnt
FROM reservation
WHERE start_date BETWEEN '2023-03-01' AND '2023-03-31'
GROUP BY room_id;

