-- 1-1 の答え。各 Q の下に SQL を書く(最後に ; を忘れずに)

-- Q1
select * from products;

-- Q2
select name, price from products;

-- Q3
select name, price from products where price >= 1000;

-- Q4
select name, created_at from users order by created_at desc;

-- Q5
select name, price
from products
order by price desc
limit 3;

-- Q6
select name from products where stock = 0;

-- Q7(考えをコメントで書く)
-- ポスグレが、自動で判断しておりそのルールなどは決まっていないのでどれが出るかは保証されない。
