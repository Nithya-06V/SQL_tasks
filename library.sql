USE librarydb;
CREATE TABLE book (book_id INT PRIMARY KEY ,
book_name VARCHAR(50),
author VARCHAR(50),
price DECIMAL (10,2));

CREATE TABLE members(member_id INT PRIMARY KEY ,
member_name VARCHAR(50),
city VARCHAR(50),
phone VARCHAR (15));

CREATE TABLE borrow(borrow_id INT PRIMARY KEY ,
book_id INT,
member_id INT,
borrow_date DATE
);

ALTER TABLE book
ADD category VARCHAR(50);

ALTER TABLE book
ADD  quantity INT;

ALTER TABLE members
ADD email VARCHAR(50) ;

ALTER TABLE borrow
ADD return_date DATE ;

ALTER TABLE book
RENAME COLUMN quantity TO stock_quantity;
SELECT * FROM book;
SELECT * FROM borrow;
SELECT * FROM members;
ALTER TABLE book
DROP COLUMN email;

INSERT  INTO book 
VALUES( 101,'a','nithya',936.88,'english',95),
(102,'b','janani',567.99,'technology',35),
(103,'c','swathi',565.99,'horror',67),
(104,'d','muthu',367.99,'music',67),
(105,'e','evelin',723.99,'travel',67),
(106,'f','paul',877.99,'thriller',54),
(107,'g','sabari',654.67,'law',67),
(108,'h','prema',954.67,'programming',56),
(109,'i','abi',234.67,'food',67),
(110,'j','anu',659.67,'sports',54);
select * from book;

INSERT  INTO members 
VALUES(1001,'a','chennai',9876743219,'nit@gmail.com'),
(1002,'b','theni',9876533219,'jan@gmail.com'),
(1003,'c','tirunelveli',9878543219,'swa@gmail.com'),
(1004,'d','salem',9876543819,'eve@gmail.com'),
(1005,'e','erode',9876533219,'palu@gmail.com'),
(1006,'f','nagarkovil',9376543219,'sab@gmail.com'),
(1007,'g','covai',9876543619,'mut@gmail.com'),
(1008,'h','trichy',9876548219,'tha@gmail.com');
select* from members;

select* from borrow;


INSERT  INTO borrow 
VALUES(1,101,1001,'2026-09-24','2026-10-04'),
(2,102,1002,'2026-09-08','2026-10-17'),
(3,103,1003,'2026-09-14','2026-10-25'),
(4,104,1004,'2026-09-23','2026-10-08'),
(5,105,1005,'2026-09-02','2026-10-06'),
(6,106,1006,'2026-09-05','2026-10-07'),
(7,107,1007,'2026-09-24','2026-10-24'),
(8,101,1008,'2026-09-09','2026-10-14');

Select* From borrow;

UPDATE book
SET price = 600
WHERE book_id = 103;

UPDATE book
SET price = price * 1.10
WHERE book_id = 102;

UPDATE book
SET stock_quantity = stock_quantity + 5;

UPDATE members
SET city = 'Madurai'
WHERE member_id = 1001;

UPDATE members
SET email = 'newmail@gmail.com'
WHERE member_id = 1002;

UPDATE book
SET category = 'Education'
WHERE book_id = 104;

UPDATE borrow
SET return_date = '2026-10-20'
WHERE borrow_id = 2;

DELETE FROM book
WHERE book_id = 106;

DELETE FROM borrow
WHERE borrow_id = 8;

SELECT * FROM book;

SELECT book_name, author
FROM book;

SELECT book_name, category, price
FROM book;

SELECT * FROM book
WHERE price > 500;

SELECT * FROM book
WHERE price < 500;

SELECT * FROM book
WHERE price BETWEEN 300 AND 800;

SELECT * FROM book
WHERE category = 'technology';

SELECT * FROM book
WHERE author = 'nithya';

SELECT * FROM book
WHERE book_name LIKE 'S%';

SELECT * FROM book
WHERE book_name LIKE '%SQL%';

SELECT * FROM book
WHERE category IN ('technology', 'Education');

SELECT * FROM book
WHERE price <> 500;

SELECT * FROM book
WHERE stock_quantity > 10;

SELECT * FROM book
WHERE stock_quantity BETWEEN 5 AND 15;

CREATE USER 'library_user'@'localhost'
IDENTIFIED BY 'library123';

GRANT SELECT ON librarydb.book
TO 'library_user'@'localhost';

GRANT INSERT ON librarydb.book
TO 'library_user'@'localhost';

GRANT UPDATE ON librarydb.book
TO 'library_user'@'localhost';

SHOW GRANTS FOR 'library_user'@'localhost';

REVOKE INSERT ON librarydb.book
FROM 'library_user'@'localhost';

REVOKE UPDATE ON librarydb.book
FROM 'library_user'@'localhost';

GRANT SELECT ON librarydb.*
TO 'library_user'@'localhost';

REVOKE SELECT ON librarydb.book
FROM 'library_user'@'localhost';
SHOW GRANTS FOR 'library_user'@'localhost';


SELECT * FROM book
ORDER BY price ASC;

SELECT * FROM book
ORDER BY price DESC;

SELECT * FROM book
ORDER BY book_name ASC;

SELECT * FROM book
ORDER BY category ASC, price ASC;

SELECT * FROM book
ORDER BY price DESC
LIMIT 3;

SELECT * FROM book
ORDER BY price ASC
LIMIT 3;

SELECT * FROM book
ORDER BY stock_quantity DESC
LIMIT 5;

SELECT * FROM members
ORDER BY member_name ASC
LIMIT 5;

SELECT * FROM borrow
ORDER BY borrow_date DESC
LIMIT 5;

SELECT COUNT(*) AS total_books
FROM book;

SELECT COUNT(*) AS total_members
FROM members;

SELECT COUNT(*) AS total_borrow
FROM borrow;


SELECT SUM(stock_quantity) AS total_stock
FROM book;
SELECT SUM(price) AS total_price
FROM book;

SELECT AVG(price) AS average_price
FROM book;
SELECT MAX(price) AS highest_price
FROM book;

SELECT MIN(price) AS lowest_price
FROM book;

SELECT MAX(price) - MIN(price) AS price_difference
FROM book;

SELECT AVG(stock_quantity) AS average_stock
FROM book;

SELECT category, COUNT(*) AS total_books
FROM book
GROUP BY category;

SELECT category, AVG(price) AS average_price
FROM book
GROUP BY category;

SELECT category, MAX(price) AS highest_price
FROM book
GROUP BY category;


SELECT category, MIN(price) AS lowest_price
FROM book
GROUP BY category;

SELECT category, SUM(stock_quantity) AS total_stock
FROM book
GROUP BY category;

SELECT category,
SUM(price * stock_quantity) AS total_value
FROM book
GROUP BY category;

SELECT category, COUNT(*) AS total_books
FROM book
GROUP BY category
HAVING COUNT(*) > 2;

SELECT category, AVG(price) AS average_price
FROM book
GROUP BY category
HAVING AVG(price) > 500;

SELECT author, COUNT(*) AS total_books
FROM book
GROUP BY author;

SELECT author, AVG(price) AS average_price
FROM book
GROUP BY author;

SELECT category, COUNT(*) AS total_books
FROM book
GROUP BY category
HAVING COUNT(*) > 2;

SELECT category, AVG(price) AS average_price
FROM book
GROUP BY category
HAVING AVG(price) > 500;

SELECT author, COUNT(*) AS total_books
FROM book
GROUP BY author
HAVING COUNT(*) > 1;

SELECT category, SUM(stock_quantity) AS total_stock
FROM book
GROUP BY category
HAVING SUM(stock_quantity) > 20;

SELECT author, AVG(price) AS average_price
FROM book
GROUP BY author
HAVING AVG(price) > 600;


SELECT book.book_name,members.member_name,borrow.borrow_date
FROM book
INNER JOIN borrow ON book.book_id=borrow.book_id
INNER JOIN members ON borrow.member_id=members.member_id;


SELECT book.book_name,members.member_name
FROM book
INNER JOIN borrow ON book.book_id=borrow.book_id
INNER JOIN members ON borrow.member_id=members.member_id;

SELECT book.book_name,book.author,members.member_name,members.city
FROM book
INNER JOIN borrow ON book.book_id=borrow.book_id
INNER JOIN members ON borrow.member_id=members.member_id;

SELECT book.book_name,members.member_name,members.city
FROM book
INNER JOIN borrow ON book.book_id=borrow.book_id
INNER JOIN members ON borrow.member_id=members.member_id
WHERE members.city='chennai';

SELECT book.book_name,members.member_name
FROM book
INNER JOIN borrow ON book.book_id=borrow.book_id
INNER JOIN members ON borrow.member_id=members.member_id;

SELECT members.member_name
FROM members
INNER JOIN borrow ON members.member_id=borrow.member_id
INNER JOIN book ON borrow.book_id=book.book_id
WHERE book.category='technology';


SELECT book.book_name,members.member_name
FROM book
INNER JOIN borrow ON book.book_id=borrow.book_id
INNER JOIN members ON borrow.member_id=members.member_id;

SELECT book.book_name,members.member_name,borrow.borrow_date
FROM book
INNER JOIN borrow ON book.book_id=borrow.book_id
INNER JOIN members ON borrow.member_id=members.member_id
ORDER BY borrow.borrow_date;



SELECT book.book_name,members.member_name
FROM book
LEFT JOIN borrow ON book.book_id=borrow.book_id
LEFT JOIN members ON borrow.member_id=members.member_id;

SELECT book.book_id,book.book_name,members.member_name
FROM book
LEFT JOIN borrow ON book.book_id=borrow.book_id
LEFT JOIN members ON borrow.member_id=members.member_id;

SELECT members.member_name,book.book_name
FROM members
LEFT JOIN borrow ON members.member_id=borrow.member_id
LEFT JOIN book ON borrow.book_id=book.book_id;

SELECT members.member_id,members.member_name,book.book_name
FROM members
LEFT JOIN borrow ON members.member_id=borrow.member_id
LEFT JOIN book ON borrow.book_id=book.book_id;

SELECT book.book_id,book.book_name
FROM book
LEFT JOIN borrow ON book.book_id=borrow.book_id
WHERE borrow.book_id IS NULL;

SELECT members.member_id,members.member_name
FROM members
LEFT JOIN borrow ON members.member_id=borrow.member_id
WHERE borrow.member_id IS NULL;




SELECT borrow.borrow_id,borrow.book_id,book.book_name
FROM book
RIGHT JOIN borrow ON book.book_id=borrow.book_id;

SELECT borrow.borrow_id,borrow.book_id,book.book_name
FROM book
RIGHT JOIN borrow ON book.book_id=borrow.book_id;

SELECT members.member_id,members.member_name,borrow.borrow_id,borrow.borrow_date
FROM borrow
RIGHT JOIN members ON borrow.member_id=members.member_id;





SELECT book.book_name,members.member_name
FROM book
CROSS JOIN members;

SELECT COUNT(*) AS total_combinations
FROM book
CROSS JOIN members;

SELECT members.member_name,book.book_name
FROM members
CROSS JOIN book
WHERE book.category='technology';








SELECT members.member_name,COUNT(borrow.book_id) AS book_count
FROM members
LEFT JOIN borrow ON members.member_id=borrow.member_id
GROUP BY members.member_id,members.member_name;


SELECT book.book_name,COUNT(DISTINCT borrow.member_id) AS member_count
FROM book
LEFT JOIN borrow ON book.book_id=borrow.book_id
GROUP BY book.book_id,book.book_name;


SELECT book.book_name,COUNT(borrow.book_id) AS borrow_count
FROM book
INNER JOIN borrow ON book.book_id=borrow.book_id
GROUP BY book.book_id,book.book_name
ORDER BY borrow_count DESC
LIMIT 1;

SELECT members.member_name,COUNT(borrow.book_id) AS book_count
FROM members
INNER JOIN borrow ON members.member_id=borrow.member_id
GROUP BY members.member_id,members.member_name
HAVING COUNT(borrow.book_id)>2;


SELECT book.category,COUNT(borrow.book_id) AS borrow_count
FROM book
INNER JOIN borrow ON book.book_id=borrow.book_id
GROUP BY book.category;

