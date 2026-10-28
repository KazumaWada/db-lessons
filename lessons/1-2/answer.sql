-- 1-2 の答え。各 Q の下に SQL を書く(最後に ; を忘れずに)

-- Q0
select name, price from products order by price desc, name asc limit 3;

-- Q1(2と同じ)
select name, price from products where name = 'モバイルバッテリー' OR name = 'ステンレスやかん';

-- Q2(1と同じ)
select name, price from products where name IN ('モバイルバッテリー', 'ステンレスやかん');

-- Q3
select name, prefecture from users where not prefecture =  '東京都';

-- Q4
値段が 1000円から3000円までの商品の、名前と値段を出す。`BETWEEN` を使って書く。
select name, price from products where price between 1000 and 3000;
-- 1000円・3000円ちょうどは入る?:
-- 入るのでは？

-- Q5
select name from products where name like '%ケーブル%';

-- Q6
select name from users where name like '山%';

-- Q7
-- 予想:
4件. 自然言語で書かれている条件の通り考えただけ。

-- (下の SQL を実行して、予想と比べる)
select name, category_id, price from products
where category_id = 1 or category_id = 4 and price >= 3000;
6件出た。

-- なぜそうなった?:->SQL では、AND が OR より先に計算されますから。or (a条件 b条件)でまとめる
分からない。ANDかORの書き方がどっちの条件も包括しているのかと思った。
でもそしたらなぜUSBケーブルが入らなかったの？

-- 正しい SQL:


-- Q8(考えをコメントで書く)
--日時が変わる直前0:00とか入るかどうか分からないから。
