--Quering with the tables

--Q1. For every user in the system, get the user_id and last booked room_no 

SELECT u.user_id, b.room_no
FROM users u
JOIN bookings b ON u.user_id = b.user_id
WHERE b.booking_date = (
    SELECT MAX(b2.booking_date)
    FROM bookings b2
    WHERE b2.user_id = u.user_id
);


--Q2. Get booking_id and total billing amount of every booking created in November, 2021 

SELECT bc.booking_id,
       SUM(i.item_rate * bc.item_quantity) AS total_billing
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
JOIN bookings b ON bc.booking_id = b.booking_id
WHERE strftime('%m', b.booking_date) = '11'
  AND strftime('%Y', b.booking_date) = '2021'
GROUP BY bc.booking_id;


--Q3. Get bill_id and bill amount of all the bills raised in October, 2021 having bill amount >1000

SELECT bc.bill_id,
       SUM(i.item_rate * bc.item_quantity) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE strftime('%m', bc.bill_date) = '10'
  AND strftime('%Y', bc.bill_date) = '2021'
GROUP BY bc.bill_id
HAVING bill_amount > 1000;


--Q4. Determine the most ordered and least ordered item of each month of year 2021 

WITH item_orders AS (
    SELECT strftime('%m', bc.bill_date) AS month_number,
           i.item_name,
           SUM(bc.item_quantity) AS total_qty,
           RANK() OVER (
            PARTITION BY strftime('%m', bc.bill_date)
            ORDER BY SUM(bc.item_quantity) DESC
           ) AS rnk_desc,
           RANK() OVER (
            PARTITION BY strftime('%m', bc.bill_date)
            ORDER BY SUM(bc.item_quantity) ASC
           ) AS rnk_asc
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE strftime('%Y', bc.bill_date) = '2021'
    GROUP BY month_number, i.item_name
)
SELECT month_number, item_name, total_qty,
       CASE WHEN rnk_desc = 1 THEN 'Most Ordered'
            WHEN rnk_asc = 1 THEN 'Least Ordered'
       END AS order_type
FROM item_orders
WHERE rnk_desc = 1 OR rnk_asc = 1
ORDER BY month_number, order_type DESC;


--Q5. Find the customers with the second highest bill value of each month of year 2021 

WITH ranked_bills AS (
    SELECT strftime('%m', bc.bill_date) AS month_no,
           bc.bill_id,
           SUM(i.item_rate * bc.item_quantity) AS total_bill,
           DENSE_RANK() OVER (
             PARTITION BY strftime('%m', bc.bill_date)
             ORDER BY SUM(i.item_rate * bc.item_quantity) DESC
           ) AS rnk
    FROM booking_commercials bc
    JOIN items i ON bc.item_id = i.item_id
    WHERE strftime('%Y', bc.bill_date) = '2021'
    GROUP BY month_no, bc.bill_id
)
SELECT month_no, bill_id, total_bill
FROM ranked_bills
WHERE rnk = 2;
