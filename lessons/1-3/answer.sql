-- 1-3 の答え。各 Q の下に SQL を書く(最後に ; を忘れずに)
-- 実行するたびにデータが変わるので、やり直すときは先に ./reset する

-- Q1
insert into products (name, category_id, price, stock, created_at)
values ('ワイヤレスマウス', 4, 2980, 30, '2026-10-29 10:00:00');

-- 確認
select * from products where name = 'ワイヤレスマウス';

-- Q2
insert into users (name, email, prefecture, birthday, created_at)
values
('森 陽介', 'yosuke@example.com', '京都府', '1990-04-01', '2026-10-29 12:00:00'),
('池田 りな', 'rina@example.com', '宮城県', null, '2026-10-29 12:30:00');

-- Q3
UPDATE products
SET stock  = 20
WHERE name = 'SQLの絵本';

-- Q4
-- 事前確認
SELECT name, price FROM products WHERE category_id = 2;

-- 実行
UPDATE products SET price = price + 10 WHERE category_id = 2;

-- 事後確認
SELECT name, price FROM products WHERE category_id = 2;

-- Q5
DELETE FROM products WHERE name = 'ワイヤレスマウス';

-- Q6
-- 予想:
-- 多分外部でindex持ってるやつとかは消せない。
-- (実行して、予想と比べる)
delete from products where name = '抹茶チョコレート';
delete from products where name = 'ボールペン 黒';  -- 外部キーで止められてエラーになる
-- 「ボールペン　黒」だけ消せなかった。たぶん外部となんかしら影響があるので消せないようになっている。

-- なぜそうなった?:
-- なんかorder_itemに記載があるっぽい。で、多分「抹茶チョコレート」は、そこのテーブルに存在しなかったから、
-- 消せたのだと思う。
-- → 正解。order_items.product_id が products.id を参照している(外部キー / FOREIGN KEY)。
--   ボールペン 黒は注文明細が2件あるので消せない。抹茶チョコレートは0件なので消せた。

-- Q7
-- 予想:
-- emailがuniqueとして登録されているから、新規で登録することはできない。

-- (実行して、予想と比べる)
insert into users (name, email, prefecture, birthday, created_at)
values
('森 太一', 'yosuke@example.com', '京都府', '1990-04-01', '2026-10-29 10:00:00');

-- こんなのが出てたからそうだった。
-- ERROR:  duplicate key value violates unique constraint "users_email_key"
-- DETAIL:  Key (email)=(yosuke@example.com) already exists.

-- Q8(考えをコメントで書く)
-- 何が起きる?:
-- テーブル内のすべてのレコードの値が変わってしまう。
-- 防ぐには?:
-- ロールバックできるようにトランザクションを先に貼っておく。
-- もしくは実行計画的な感じで、さいしょにSELECTをしてクエリの正確さを確かめる。
