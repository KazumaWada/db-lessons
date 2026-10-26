-- 練習用のネットショップのデータ。コンテナを最初に起動したときに1回だけ流れる
-- (./reset で消すと、また最初からこの状態になる)

CREATE TABLE categories (
  id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
  id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name        VARCHAR(100) NOT NULL,
  category_id INT NOT NULL,
  price       INT NOT NULL,
  stock       INT NOT NULL,
  created_at  TIMESTAMP NOT NULL,
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE users (
  id         INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name       VARCHAR(50) NOT NULL,
  email      VARCHAR(100) NOT NULL UNIQUE,
  prefecture VARCHAR(10) NOT NULL,
  birthday   DATE NULL,
  created_at TIMESTAMP NOT NULL
);

CREATE TABLE orders (
  id         INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  user_id    INT NOT NULL,
  status     VARCHAR(20) NOT NULL,
  ordered_at TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
  id         INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  order_id   INT NOT NULL,
  product_id INT NOT NULL,
  quantity   INT NOT NULL,
  unit_price INT NOT NULL,
  FOREIGN KEY (order_id)   REFERENCES orders(id),
  FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO categories (name) VALUES
  ('本'), ('文房具'), ('キッチン'), ('ガジェット'), ('食品'), ('ペット用品');

INSERT INTO products (name, category_id, price, stock, created_at) VALUES
  ('はじめてのJava',       1, 2980,  12, '2025-04-01 10:00:00'),
  ('SQLの絵本',            1, 1800,   0, '2025-04-01 10:00:00'),
  ('達人に学ぶDB設計',     1, 3200,   5, '2025-06-15 09:30:00'),
  ('ボールペン 黒',        2,  120, 300, '2025-04-03 12:00:00'),
  ('方眼ノート A5',        2,  350, 150, '2025-04-03 12:00:00'),
  ('付箋セット',           2,  480,  80, '2025-08-20 15:00:00'),
  ('ステンレスやかん',     3, 3980,   7, '2025-05-10 11:00:00'),
  ('木のまな板',           3, 2200,  15, '2025-05-10 11:00:00'),
  ('計量スプーン',         3,  550,  40, '2025-09-01 08:00:00'),
  ('ワイヤレスイヤホン',   4, 8800,   3, '2025-07-07 19:00:00'),
  ('モバイルバッテリー',   4, 4500,  20, '2025-07-07 19:00:00'),
  ('USB-Cケーブル',        4,  980, 120, '2025-07-07 19:00:00'),
  ('メカニカルキーボード', 4, 12800,  2, '2025-11-11 11:11:00'),
  ('ドリップコーヒー 10袋', 5, 1200,  60, '2025-10-01 07:00:00'),
  ('抹茶チョコレート',     5,  650,   0, '2025-12-01 10:00:00');

INSERT INTO users (name, email, prefecture, birthday, created_at) VALUES
  ('佐藤 花子',   'hanako@example.com',  '東京都',   '1995-03-14', '2025-04-02 09:15:00'),
  ('鈴木 一郎',   'ichiro@example.com',  '大阪府',   '1988-11-02', '2025-04-05 20:40:00'),
  ('高橋 さくら', 'sakura@example.com',  '東京都',   '2001-07-21', '2025-05-01 13:00:00'),
  ('田中 健',     'ken@example.com',     '福岡県',   NULL,         '2025-05-18 22:10:00'),
  ('伊藤 美咲',   'misaki@example.com',  '北海道',   '1999-01-30', '2025-06-03 08:05:00'),
  ('渡辺 大輔',   'daisuke@example.com', '大阪府',   '1979-09-09', '2025-06-20 17:30:00'),
  ('山本 ゆい',   'yui@example.com',     '愛知県',   '2003-12-25', '2025-08-08 11:11:00'),
  ('中村 翔太',   'shota@example.com',   '東京都',   NULL,         '2025-09-14 10:00:00'),
  ('小林 恵',     'megumi@example.com',  '神奈川県', '1992-05-05', '2025-10-31 23:59:00'),
  ('加藤 拓海',   'takumi@example.com',  '福岡県',   '1997-08-15', '2025-12-24 18:00:00'),
  ('吉田 あおい', 'aoi@example.com',     '沖縄県',   '2000-02-29', '2026-01-10 09:00:00'),
  ('山田 太郎',   'taro@example.com',    '東京都',   '1985-06-01', '2026-02-14 14:14:00');

-- 山本 ゆい(7)・吉田 あおい(11)・山田 太郎(12) はまだ1回も注文していない
INSERT INTO orders (user_id, status, ordered_at) VALUES
  (1,  'delivered', '2025-04-10 10:00:00'),
  (2,  'delivered', '2025-04-12 21:00:00'),
  (1,  'delivered', '2025-05-03 12:30:00'),
  (3,  'delivered', '2025-05-20 19:45:00'),
  (4,  'cancelled', '2025-06-01 08:00:00'),
  (5,  'delivered', '2025-06-10 07:20:00'),
  (2,  'delivered', '2025-07-08 22:00:00'),
  (6,  'delivered', '2025-07-15 18:00:00'),
  (1,  'delivered', '2025-08-01 09:00:00'),
  (3,  'delivered', '2025-09-02 20:00:00'),
  (8,  'delivered', '2025-09-20 13:00:00'),
  (5,  'delivered', '2025-10-05 11:00:00'),
  (9,  'shipped',   '2025-11-03 16:00:00'),
  (2,  'shipped',   '2025-11-12 10:30:00'),
  (10, 'pending',   '2025-12-25 09:00:00'),
  (1,  'pending',   '2026-01-03 15:00:00'),
  (6,  'cancelled', '2026-01-20 12:00:00'),
  (8,  'pending',   '2026-02-01 08:30:00');

-- unit_price は買ったときの値段 (あとで商品の値段が変わっても残るように)
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
  (1,  1, 1, 2980), (1,  4, 3,  120),
  (2,  2, 1, 1800),
  (3,  5, 2,  350), (3,  4, 5,  120),
  (4,  7, 1, 3980), (4,  8, 1, 2200),
  (5, 10, 1, 8800),
  (6,  1, 1, 2980), (6,  3, 1, 3200),
  (7, 10, 1, 8800), (7, 12, 2,  980),
  (8, 11, 1, 4500),
  (9,  6, 2,  480), (9,  9, 1,  550),
  (10, 3, 1, 3200),
  (11, 12, 1, 980), (11, 5, 4,  350),
  (12, 8, 1, 2200), (12, 9, 2,  550),
  (13, 13, 1, 12800),
  (14, 14, 3, 1200),
  (15, 1, 1, 2980), (15, 14, 1, 1200),
  (16, 6, 1,  480),
  (17, 11, 1, 4500),
  (18, 13, 1, 12800), (18, 12, 1, 980);
