DESC Cart;
alter table Cart drop primary key, add primary key(u_id, b_code);


-- 책 등록
INSERT INTO Book (b_title, b_writer, b_pubDate, b_price, b_genre, b_img)
VALUES ("네번째 책 이름", "네번째 저자", "2005-01-01", "3000", "소설", "https://contents.kyobobook.co.kr/sih/fit-in/100x0/pdt/9788965965374.jpg");
SELECT * FROM Book;

-- 유저 등록
INSERT INTO User (u_id, u_pw, u_name, u_phone, u_email, u_address)
VALUES ("cbg", "123", "차범근", "010-1312-1112", "cbg@daum.net", "강북");
SELECT * FROM User;

-- 장바구니 등록
INSERT INTO Cart (c_count, u_id, b_code)
VALUES (1, "2", 3);
SELECT * FROM Cart;

desc Cart;
desc Orders;

insert INTO Orders VALUES ("결제완료", 3, '1');


DESC Orders;
SELECT
	b_img, b_title, b_price
FROM 
	Book;
    
    select * FROM Book;
    select * FROM Cart;
    DELETE FROM Book WHERE b_code = 4;
    
    CREATE TABLE Buybook (
    u_id VARCHAR(255) NOT NULL,
    b_code INT NOT NULL,
    FOREIGN KEY (b_code) REFERENCES Book (b_code),
    FOREIGN KEY (u_id) REFERENCES User(u_id),
    PRIMARY KEY (b_code, u_id)
    );
    
    SELECT * FROM Buybook;
    
    INSERT INTO Buybook 
    VALUES (1, 3);
    
    SELECT b_code FROM Book;
    SELECT u_id FROM User;
    
    create table OrderDetail (
		o_number int NOT null PRIMARY KEY AUTO_INCREMENT,
        u_id varchar(255) not null,
        FOREIGN KEY (u_id) REFERENCES User(u_id)
    );
    
    INSERT INTO OrderDetail (u_id)
    VALUES ('1');
    
    SELECT bb.b_code
    FROM OrderDetail od LEFT JOIN Buybook bb ON od.u_id = bb.u_id;
    
    SELECT * FROM Cart;
    
SELECT
	c.c_count, c.u_id, c.b_code, b.b_title, b.b_price, b.b_img
FROM
	Cart c JOIN Book b ON c.b_code = b.b_code JOIN User u ON u.u_id = c.u_id
WHERE
	c.u_id = "1" AND c.b_code = "1";
    

    