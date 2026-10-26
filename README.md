# db-lessons

Claude Code が先生役になって問題を出し、自分で SQL を書いて学ぶための練習場。

## 使い方

```sh
docker compose up -d                 # PostgreSQL を起動 (初回は20秒ほどかかる)
./sql                                # PostgreSQL に入って対話で打つ (\q で抜ける)
./sql lessons/1-1/answer.sql         # 書いた答えを上から実行して結果を見る
./reset                              # データを最初の状態に戻す
docker compose stop                  # 終わったら止める
```

TablePlus などの GUI から見たいとき: host `127.0.0.1` / port `5433` / user `learner` / password `learner` / database `shop`

## 1回の流れ

1. `lessons/<番号>/README.md` の問題を読む
2. `lessons/<番号>/answer.sql` に自分で書いて、`./sql` で実行して確かめる
3. Claude Code に「1-1 できた」と言う → 実行してチェック、質問とコメントが返ってくる
4. やり取りは `LEARNING_LOG.md` に残る。全体の地図は `CURRICULUM.md`

## 練習用のテーブル (ネットショップ)

| テーブル | 中身 |
|---|---|
| `categories` | 商品のカテゴリ |
| `products` | 商品 (値段・在庫) |
| `users` | 会員 |
| `orders` | 注文 (誰がいつ、状態) |
| `order_items` | 注文の中身 (どの商品をいくつ、いくらで) |

テーブルの形は `./sql` に入って `\dt`(テーブル一覧)や `\d products`(列の一覧)で見られる。
