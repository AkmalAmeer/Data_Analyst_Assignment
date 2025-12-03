--Quering with the tables

--Q1. Find the revenue we got from each sales channel in a given year 

SELECT sales_channel,
       SUM(amount) AS total_revenue
FROM clinic_sales
WHERE strftime('%Y', datetime) = '2021'
GROUP BY sales_channel;


--Q2. Find top 10 the most valuable customers for a given year 

SELECT c.uid, c.name,
       SUM(cs.amount) AS total_spend
FROM customer c
JOIN clinic_sales cs ON c.uid = cs.uid
WHERE strftime('%Y', cs.datetime) = '2021'
GROUP BY c.uid, c.name
ORDER BY total_spend DESC
LIMIT 10;


--Q3. Find month wise revenue, expense, profit , status (profitable / not-profitable) for a given year

WITH rev AS (
    SELECT strftime('%Y-%m', datetime) AS month,
           SUM(amount) AS revenue
    FROM clinic_sales
    WHERE strftime('%Y', datetime) = '2021'
    GROUP BY month
),
exp AS (
    SELECT strftime('%Y-%m', datetime) AS month,
           SUM(amount) AS expense
    FROM expense
    WHERE strftime('%Y', datetime) = '2021'
    GROUP BY month
)
SELECT r.month,
       r.revenue,
       COALESCE(e.expense, 0) AS expense,
       (r.revenue - COALESCE(e.expense, 0)) AS profit,
       CASE WHEN (r.revenue - COALESCE(e.expense, 0)) >= 0
            THEN 'Profitable'
            ELSE 'Not-Profitable'
       END AS status
FROM rev r
LEFT JOIN exp e ON r.month = e.month
ORDER BY r.month;


--Q4. For each city find the most profitable clinic for a given month 

WITH clinic_profit AS (
    SELECT cl.city, s.cid,
           SUM(s.amount) -
           COALESCE((SELECT SUM(amount)
                     FROM expense e
                     WHERE e.cid = s.cid
                     AND strftime('%Y-%m', e.datetime) = '2021-09'), 0) AS profit
    FROM clinic_sales s
    JOIN clinics cl ON s.cid = cl.cid
    WHERE strftime('%Y-%m', s.datetime) = '2021-09'
    GROUP BY cl.city, s.cid
)
SELECT city, cid, profit
FROM clinic_profit cp
WHERE profit = (
    SELECT MAX(cp2.profit)
    FROM clinic_profit cp2
    WHERE cp2.city = cp.city
);


--Q5. For each state find the second least profitable clinic for a given month 

WITH clinic_profit AS (
    SELECT cl.state, s.cid,
           SUM(s.amount) -
           COALESCE((SELECT SUM(amount)
                     FROM expense e
                     WHERE e.cid = s.cid
                     AND strftime('%Y-%m', e.datetime) = '2021-09'), 0) AS profit
    FROM clinic_sales s
    JOIN clinics cl ON s.cid = cl.cid
    WHERE strftime('%Y-%m', s.datetime) = '2021-09'
    GROUP BY cl.state, s.cid
),
ranked AS (
    SELECT state, cid, profit,
           ROW_NUMBER() OVER (PARTITION BY state ORDER BY profit ASC) AS rn
    FROM clinic_profit
)
SELECT state, cid, profit
FROM ranked
WHERE rn = 2;
