--Creating Tables for Hotel Management

CREATE TABLE users (
    user_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    phone_number VARCHAR(20),
    mail_id VARCHAR(100),
    billing_address VARCHAR(255)
);

CREATE TABLE bookings (
    booking_id VARCHAR(50) PRIMARY KEY,
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE items (
    item_id VARCHAR(50) PRIMARY KEY,
    item_name VARCHAR(100),
    item_rate DECIMAL(10,2)
);

CREATE TABLE booking_commercials (
    id VARCHAR(50) PRIMARY KEY,
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity INT,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);


--Inserting data into the tables created before

--Insert User Data
INSERT INTO users VALUES
('21wrcxuy-67erfn','John Doe','9711111111','john@example.com','Charminar'),
('21aabbcc-11zzxx','Ali Khan','9722222222','ali@example.com','Nehru Zoological Park'),
('21ddyyzz-42ppkk','Sneha Roy','9733333333','sneha@example.com','Hussain Sagar Lake'),
('21lmno12-98rtty','Ravi Kumar','9744444444','ravi@example.com','ToliChowki'),
('21pqrstu-34nnmm','Amit Shah','9755555555','amit@example.com','Ameerpet'),
('21zxcyvu-55ttee','Sara Ali','9766666666','sara@example.com','Moosapet'),
('21ghvbnm-82wwqq','Arjun Das','9777777777','arjun@example.com','Jubilee Hills');


-- Insert Item Data
INSERT INTO items VALUES
('itm-a9e8-q8fu','Tawa Paratha',30),
('itm-b4e2-k2hg','Paneer Butter Masala',180),
('itm-c9e7-h5df','Veg Biryani',150),
('itm-d2h4-k7tu','Masala Dosa',90),
('itm-e7j3-n3sd','Coffee',40),
('itm-f1a9-w4ty','Chicken Curry',220),
('itm-g4v5-q7ks','Gulab Jamun',50);


-- Insert Bookings Data
INSERT INTO bookings VALUES
('bk-001','2021-09-23 07:36:48','rm-101','21wrcxuy-67erfn'),
('bk-002','2021-10-10 08:22:15','rm-102','21aabbcc-11zzxx'),
('bk-003','2021-10-18 09:12:30','rm-103','21ddyyzz-42ppkk'),
('bk-004','2021-11-05 10:22:00','rm-104','21lmno12-98rtty'),
('bk-005','2021-11-28 11:50:10','rm-101','21pqrstu-34nnmm'),
('bk-006','2021-10-30 12:45:15','rm-102','21zxcyvu-55ttee'),
('bk-007','2021-11-15 14:25:48','rm-103','21ghvbnm-82wwqq'),
('bk-008','2021-10-12 18:05:22','rm-107','21lmno12-98rtty'),
('bk-009','2021-10-20 21:11:11','rm-103','21zxcyvu-55ttee'),
('bk-010','2021-11-07 19:55:30','rm-102','21ddyyzz-42ppkk'),
('bk-011','2021-11-18 08:18:27','rm-104','21aabbcc-11zzxx');


-- Insert booking_commercials data
INSERT INTO booking_commercials VALUES
('c001','bk-001','bl-001','2021-09-23 12:03:22','itm-a9e8-q8fu',3),
('c002','bk-002','bl-002','2021-10-10 13:20:44','itm-b4e2-k2hg',2),
('c003','bk-003','bl-003','2021-10-18 14:18:10','itm-d2h4-k7tu',4),
('c004','bk-004','bl-004','2021-11-05 15:20:55','itm-c9e7-h5df',3),
('c005','bk-005','bl-005','2021-11-28 16:10:00','itm-e7j3-n3sd',5),
('c006','bk-006','bl-006','2021-10-30 12:45:15','itm-f1a9-w4ty',2),
('c007','bk-007','bl-007','2021-11-15 14:25:48','itm-g4v5-q7ks',6),
('c008','bk-008','bl-008','2021-10-12 19:00:00','itm-b4e2-k2hg',6),  
('c009','bk-008','bl-008','2021-10-12 19:00:01','itm-g4v5-q7ks',10), 
('c010','bk-009','bl-009','2021-10-20 21:20:00','itm-f1a9-w4ty',7),  
('c011','bk-009','bl-009','2021-10-20 21:20:05','itm-d2h4-k7tu',6),  
('c012','bk-010','bl-010','2021-11-07 20:00:00','itm-e7j3-n3sd',12),
('c013','bk-010','bl-010','2021-11-07 20:01:10','itm-c9e7-h5df',5),  
('c014','bk-011','bl-011','2021-11-18 08:30:00','itm-a9e8-q8fu',10), 
('c015','bk-011','bl-011','2021-11-18 08:31:00','itm-f1a9-w4ty',5),
('c016','bk-001','bl-001','2021-09-23 12:04:02','itm-e7j3-n3sd',1),
('c017','bk-002','bl-002','2021-10-10 13:22:44','itm-a9e8-q8fu',2),
('c018','bk-003','bl-003','2021-10-18 14:22:10','itm-g4v5-q7ks',3),
('c019','bk-004','bl-004','2021-11-05 15:22:55','itm-b4e2-k2hg',1),
('c020','bk-005','bl-005','2021-11-28 16:12:00','itm-g4v5-q7ks',2);