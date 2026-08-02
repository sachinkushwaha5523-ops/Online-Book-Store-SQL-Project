--- Basic Questions :

-- 1) Retrieve all books in the "Fiction" genre:
select * from books
where genre='Fiction';

-- 2) Find books published after the year 1950:
select * from books
where Published_Year>1950;

-- 3) List all customers from the Canada:
select * from customers
where Country='Canada';

-- 4) Show orders placed in November 2023:
select order_id,Order_Date from orders
where Order_Date between '2023-11-01' and '2023-11-30';

-- 5) Retrieve the total stock of books available:
select sum(stock)as total_stock from books;

-- 6) Find the details of the most expensive book:
select max(Price)as expensive_book from books;

-- 7) Show all customers who ordered more than 1 quantity of a book:
select * from orders
where quantity>1
order by quantity desc ;

-- 8) Retrieve all orders where the total amount exceeds $20:
select * from orders
where Total_Amount>20;

-- 9) List all genres available in the Books table:
select genre from books;

-- 10) Find the book with the lowest stock:
select min(stock)as min_stock from books;

-- 11) Calculate the total revenue generated from all orders:
select sum(Total_Amount)as total_revenue from orders;

-- Advance Questions : 

-- 1) Retrieve the total number of books sold for each genre:
select b.genre,sum(o.quantity)as total_book_sold from books b
join orders o
on b.Book_ID = o.Book_ID
group by b.genre;

-- 2) Find the average price of books in the "Fantasy" genre:
select genre,round(avg(price),2)as avg_price from books
where genre='Fantasy'
group by genre;

-- 3) List customers who have placed at least 2 orders:
select c.name,count(o.order_id)as count_orders from orders o
join customers c
on c.customer_id = o.customer_id
group by c.name
having count(o.order_id)>2; 

-- 4) Find the most frequently ordered book:
select b.book_id,b.Title, count(o.order_id)as frequently_orders from books b
join orders o
on b.book_id = o.book_id
group by b.book_id,b.Title 
order by frequently_orders desc limit 1;


-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
select * from books 
where genre ='Fantasy'
order by price desc limit 3;

-- 6) Retrieve the total quantity of books sold by each author:
select b.Author,sum(o.quantity)as total_quantity from books b
join orders o
on b.book_id = o.book_id
group by b.Author ;

-- 7) List the cities where customers who spent over $30 are located:
select distinct c.city,c.name,o.total_amount from customers c
join orders o
on c.customer_id = o.customer_id
where o.Total_Amount>30;

-- 8) Find the customer who spent the most on orders:
select c.customer_id,c.name,sum(o.total_amount)as customer_spent from customers c
join orders o
on c.customer_id = o.customer_id
group by c.customer_id,c.name
order by customer_spent desc limit 1;

--9) Calculate the stock remaining after fulfilling all orders:
select b.Book_ID,b.Title,b.stock,coalesce(sum(o.quantity),0)as order_quantity,
b.stock - coalesce(sum(o.quantity),0)as Remaining_Quantity from books b
left join orders o
on b.book_id = o.book_id
group by b.Book_ID,b.Title,b.stock



























































































