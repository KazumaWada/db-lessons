-- 1-2 の答え。各 Q の下に SQL を書く(最後に ; を忘れずに)

-- Q0


-- Q1


-- Q2


-- Q3


-- Q4
-- 1000円・3000円ちょうどは入る?:


-- Q5


-- Q6


-- Q7
-- 予想:

-- (下の SQL を実行して、予想と比べる)
select name, category_id, price from products
where category_id = 1 or category_id = 4 and price >= 3000;

-- なぜそうなった?:

-- 正しい SQL:


-- Q8(考えをコメントで書く)
-- 
