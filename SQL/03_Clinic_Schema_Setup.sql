--Creating Tables for Clinic Management System

CREATE TABLE clinics (
    cid TEXT PRIMARY KEY,
    clinic_name TEXT,
    city TEXT,
    state TEXT,
    country TEXT
);

CREATE TABLE customer (
    uid TEXT PRIMARY KEY,
    name TEXT,
    mobile TEXT
);

CREATE TABLE clinic_sales (
    oid TEXT PRIMARY KEY,
    uid TEXT,
    cid TEXT,
    amount REAL,
    datetime TEXT,
    sales_channel TEXT,
    FOREIGN KEY (uid) REFERENCES customer(uid),
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

CREATE TABLE expense (
    eid TEXT PRIMARY KEY,
    cid TEXT,
    description TEXT,
    amount REAL,
    datetime TEXT,
    FOREIGN KEY (cid) REFERENCES clinics(cid)
);

--Inserting data into each table

--Insert Customer Data
INSERT INTO customer VALUES
('bk-09f3e-95h', 'Amit Kumar', '9876543210'),
('bk-09f3e-95j', 'Riya Sharma', '9988776655'),
('bk-09f3e-95k', 'John Doe', '8877665544'),
('bk-09f3e-95l', 'Neha Verma', '9990001112'),
('bk-09f3e-95m', 'Sanjay Singh', '9898989898'),
('bk-09f3e-95n', 'Priya Patel', '7766554433'),
('bk-09f3e-95o', 'Chris Paul', '7788996655'),
('bk-09f3e-95p', 'Vivek Mehta', '9911223344'),
('bk-09f3e-95q', 'Anjali Rao', '7755332211'),
('bk-09f3e-95r', 'Rohan Gupta', '8822334455'),
('bk-09f3e-95s', 'Meera Nair', '6611223344'),
('bk-09f3e-95t', 'Sara Khan', '5500112233');


--Insert Clinics Data
INSERT INTO clinics VALUES
('cnc-0100001', 'City Health Clinic', 'Mumbai', 'Maharashtra', 'India'),
('cnc-0100002', 'Care Plus', 'Delhi', 'Delhi', 'India'),
('cnc-0100003', 'Health First', 'Pune', 'Maharashtra', 'India'),
('cnc-0100004', 'Healing Touch', 'Delhi', 'Delhi', 'India'),
('cnc-0100005', 'Care Health', 'Bengaluru', 'Karnataka', 'India'),
('cnc-0100006', 'LifeCare', 'Chennai', 'Tamil Nadu', 'India'),
('cnc-0100007', 'Sunrise Clinic', 'Mumbai', 'Maharashtra', 'India'),
('cnc-0100008', 'Wellness Center', 'Pune', 'Maharashtra', 'India'),
('cnc-0100009', 'Green Health', 'Bengaluru', 'Karnataka', 'India'),
('cnc-0100010', 'MedPlus', 'Chennai', 'Tamil Nadu', 'India');

-- Insert Clinic_Sales Data
INSERT INTO clinic_sales VALUES
('ord-001','bk-09f3e-95h','cnc-0100001',24999,'2021-09-23 12:03:22','Online'),
('ord-002','bk-09f3e-95j','cnc-0100001',15000,'2021-06-10 10:11:12','Offline'),
('ord-005','bk-09f3e-95l','cnc-0100001',20000,'2021-03-03 13:22:11','Offline'),
('ord-006','bk-09f3e-95m','cnc-0100001',30000,'2021-07-15 16:00:00','Referral'),
('ord-007','bk-09f3e-95n','cnc-0100001',25000,'2021-11-10 09:10:01','Online'),
('ord-017','bk-09f3e-95p','cnc-0100007',8000,'2021-02-15 10:10:10','Offline'),
('ord-019','bk-09f3e-95l','cnc-0100007',7000,'2021-12-20 14:05:11','Online'),
('ord-022','bk-09f3e-95r','cnc-0100007',12000,'2021-09-14 12:12:12','Online'),
('ord-011','bk-09f3e-95r','cnc-0100003',30000,'2021-02-12 10:00:10','Online'),
('ord-012','bk-09f3e-95s','cnc-0100003',18000,'2021-08-25 08:39:12','Offline'),
('ord-018','bk-09f3e-95q','cnc-0100008',11000,'2021-09-16 15:15:15','Offline'),
('ord-003','bk-09f3e-95h','cnc-0100002',35000,'2021-02-14 09:10:11','Online'),
('ord-008','bk-09f3e-95o','cnc-0100002',40000,'2021-05-20 13:22:00','Online'),
('ord-009','bk-09f3e-95p','cnc-0100004',35000,'2021-09-01 11:19:10','Offline'),
('ord-010','bk-09f3e-95q','cnc-0100004',22000,'2021-09-21 17:10:00','Referral'),
('ord-013','bk-09f3e-95t','cnc-0100005',36000,'2021-06-17 12:11:02','Online'),
('ord-014','bk-09f3e-95h','cnc-0100005',23000,'2021-09-23 10:10:10','Referral'),
('ord-020','bk-09f3e-95t','cnc-0100009',4000,'2021-04-10 12:00:00','Referral'),
('ord-021','bk-09f3e-95o','cnc-0100009',5000,'2021-06-14 10:20:33','Offline'),
('ord-024','bk-09f3e-95p','cnc-0100009',9000,'2021-09-21 16:22:22','Referral'),
('ord-015','bk-09f3e-95j','cnc-0100006',45000,'2021-04-14 13:47:33','Online'),
('ord-016','bk-09f3e-95l','cnc-0100006',40000,'2021-10-14 09:08:20','Offline'),
('ord-025','bk-09f3e-95q','cnc-0100010',17000,'2021-09-08 10:30:00','Online');


--Insert Expense Data
INSERT INTO expense VALUES
('exp-001','cnc-0100001','Medicines',10000,'2021-09-23 07:36:48'),
('exp-002','cnc-0100001','Rent',5000,'2021-06-09 11:36:48'),
('exp-005','cnc-0100001','Rent',8000,'2021-03-01 06:00:00'),
('exp-006','cnc-0100001','Electricity',5000,'2021-07-01 06:30:00'),
('exp-007','cnc-0100001','Supplies',9000,'2021-11-12 07:36:48'),
('exp-017','cnc-0100007','Rent',10000,'2021-02-10 08:10:10'),
('exp-019','cnc-0100007','Supplies',13000,'2021-12-21 09:11:11'),
('exp-022','cnc-0100007','Medical Waste',9000,'2021-09-13 11:11:11'),
('exp-023','cnc-0100008','Salary',9500,'2021-09-17 09:09:09'),
('exp-011','cnc-0100003','Medicines',9000,'2021-02-10 09:30:11'),
('exp-012','cnc-0100003','Repair',7000,'2021-08-20 11:00:05'),
('exp-018','cnc-0100008','Supplies',15000,'2021-08-10 08:00:00'),
('exp-003','cnc-0100002','Electricity',12000,'2021-02-13 09:36:48'),
('exp-008','cnc-0100002','Equipment',15000,'2021-05-15 09:00:00'),
('exp-009','cnc-0100004','Rent',7000,'2021-09-05 10:10:10'),
('exp-010','cnc-0100004','Internet',2000,'2021-09-18 09:10:10'),
('exp-013','cnc-0100005','Electricity',6000,'2021-06-10 07:11:01'),
('exp-014','cnc-0100005','Rent',7000,'2021-09-10 13:22:12'),
('exp-020','cnc-0100009','Staff Salary',14000,'2021-04-05 09:33:00'),
('exp-021','cnc-0100009','Electricity',12000,'2021-06-12 07:12:12'),
('exp-024','cnc-0100007','Electricity',7000,'2021-09-20 10:10:10'),
('exp-015','cnc-0100006','Salary',10000,'2021-04-10 10:10:10'),
('exp-016','cnc-0100006','Maintenance',6000,'2021-10-10 11:11:11'),
('exp-025','cnc-0100010','Maintenance',12000,'2021-09-07 11:30:00');
