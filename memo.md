```bash
shop=# \d products
                                     Table "public.products"
   Column    |            Type             | Collation | Nullable |           Default
-------------+-----------------------------+-----------+----------+------------------------------
 id          | integer                     |           | not null | generated always as identity
 name        | character varying(100)      |           | not null |
 category_id | integer                     |           | not null |
 price       | integer                     |           | not null |
 stock       | integer                     |           | not null |
 created_at  | timestamp without time zone |           | not null |
Indexes:
    "products_pkey" PRIMARY KEY, btree (id)
Foreign-key constraints:
    "products_category_id_fkey" FOREIGN KEY (category_id) REFERENCES categories(id)
Referenced by:
    TABLE "order_items" CONSTRAINT "order_items_product_id_fkey" FOREIGN KEY (product_id) REFERENCES products(id)

shop=# \dt products
           List of tables
 Schema |   Name   | Type  |  Owner
--------+----------+-------+---------
 public | products | table | learner
(1 row)
```
