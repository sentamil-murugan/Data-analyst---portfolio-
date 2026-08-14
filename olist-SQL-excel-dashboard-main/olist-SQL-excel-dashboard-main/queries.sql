/*top 5 customers by total spent*/
select c.customer_id,sum(p.payment_value) as total_spent from olist_customers_dataset c 
join olist_orders_dataset o on o.customer_id = c.customer_id
join olist_order_payments_dataset p on o.order_id = p.order_id
group by c.customer_id order BY total_spent DESC 
limit 5



/*monthly revenue and percentage change from previous month*/
WITH monthly_revenue AS (
    SELECT 
        strftime('%Y-%m', o.order_purchase_t) AS month,
        SUM(p.payment_value) AS revenue
    FROM olist_orders_dataset o
    JOIN olist_order_payments_dataset p ON o.order_id = p.order_id
    GROUP BY month
),
revenue_with_lag AS (
    SELECT 
        month,
        revenue,
        LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue
    FROM monthly_revenue
)
SELECT 
    month,
    revenue,
    previous_month_revenue,
    ((revenue - previous_month_revenue) * 1.0 / previous_month_revenue) * 100 AS pct_change
FROM revenue_with_lag;



/*product category with the highest revenue*/
SELECT 
    p.product_category,
    SUM(oi.price) AS total_revenue
FROM olist_order_items_dataset oi
JOIN olist_products_dataset p ON oi.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_revenue DESC
LIMIT 5;