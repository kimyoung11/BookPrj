
ALTER TABLE OrderDetail add od_count int NOT NULL DEFAULT "0";


SELECT * FROM User;

SELECT * FROM Orders;
SELECT * FROM OrderDetail;
SELECT * FROM Cart;
DESC Review;
DESC OrderDetail;

SELECT * FROM Book;
SELECT * FROM Review;
SELECT * FROM Book
ORDER BY b_pubDate DESC;

SELECT * FROM Book ORDER BY RAND() LIMIT 1,10;
desc Review;
SELECT * FROM User;

SELECT b_code, b_title, b_writer, b_pubDate, b_price, b_genre, b_img, b_like,
(SELECT avg(r_star) FROM Review r WHERE b_code = b.b_code) star FROM Book b  
GROUP BY b_code ORDER BY star DESC;






select b_img, b_title, b_price, c_count, u_id, b.b_code FROM
Book b JOIN Cart c on b.b_code = c.b_code where u_id = '';
SELECT * FROM Cart;
INSERT INTO Cart
VALUES (3,"bb",5);

DESC Book;
-- 주문 등록
INSERT INTO Orders (o_number, o_count, o_status, b_code, u_id)
VALUES (2, 3, "입금확인", 5, 'dd');

-- 책등록
INSERT INTO Book (b_title, b_writer, b_pubDate, b_price, b_genre, b_img)
VALUES ("아버지의 해방일지", "정지아", "2022-09-02", 15000, '소설', "https://contents.kyobobook.co.kr/sih/fit-in/211x0/pdt/9788936438838.jpg");

UPDATE Book SET b_img = "https://contents.kyobobook.co.kr/sih/fit-in/211x0/pdt/9788959897094.jpg" WHERE b_code = 30;

ALTER TABLE Orders ALTER COLUMN o_date SET DEFAULT now();
ALTER TABLE Orders ALTER COLUMN o_status SET DEFAULT "상품준비중";
DESC Orders;

-- 주문 목록
SELECT * FROM Orders;
-- 주문상세 목록
SELECT * FROM OrderDetail;
DESC OrderDetail;