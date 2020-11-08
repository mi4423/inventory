-- categories table

CREATE TABLE categories (
    id              INT AUTO_INCREMENT  NOT NULL    COMMENT 'カテゴリーID'
   ,name            VARCHAR2(255)       NOT NULL    COMMENT 'カテゴリー名'
   ,created_at      DATETIME            NOT NULL    COMMENT '登録日時'
   ,updated_at      DATETIME            NOT NULL    COMMENT '更新日時'
   ,CONSTRAINT pk_categories PRIMARY KEY (id)
)   COMMENT = 'カテゴリー'
;

-- products table

CREATE TABLE products (
    id              INT AUTO_INCREMENT  NOT NULL    COMMENT '商品ID'
   ,name            VARCHAR2(255)       NOT NULL    COMMENT '商品名'
   ,description     VARCHAR2(750)       NOT NULL    COMMENT '商品説明'
   ,category_id     INT                 NOT NULL    COMMENT 'カテゴリーID'
   ,manufacturer_id INT                 NOT NULL    COMMENT '仕入先ID'
   ,serving_size    VARCHAR(255)        NOT NULL    COMMENT '分量'
   ,calories        FLOAT UNSIGNED      NOT NULL    COMMENT '熱量'
   ,protein         FLOAT UNSIGNED      NOT NULL    COMMENT 'たんぱく質'
   ,total_fat       FLOAT UNSIGNED      NOT NULL    COMMENT '脂質'
   ,total_carbohydrate
                    FLOAT UNSIGNED      NOT NULL    COMMENT '炭水化物'
   ,sodium          FLOAT UNSIGNED      NOT NULL    COMMENT '食塩相当量'
   ,buying_price    DECIMAL(15,2) UNSIGNED
                                        NOT NULL    COMMENT '原価'
   ,selling_price   DECIMAL(15,2) UNSIGNED
                                        NOT NULL    COMMENT '定価'
   ,inhouse_stock   INT UNSIGNED        NOT NULL    COMMENT '販売可能在庫数'
   ,arriving_stock  INT UNSIGNED        NOT NULL    COMMENT '入荷予定在庫数'
   ,shipping_stock  INT UNSIGNED        NOT NULL    COMMENT '出荷予定在庫数'
   ,created_at      DATETIME            NOT NULL    COMMENT '登録日時'
   ,updated_at      DATETIME            NOT NULL    COMMENT '更新日時'
   ,CONSTRAINT pk_products PRIMARY KEY (id)
   ,CONSTRAINT fk_category_id FOREIGN KEY (category_id)
    REFERENCES categories (id)
   ,CONSTRAINT fk_manufacturer_id FOREIGN KEY (manufacturer_id)
    REFERENCES manufacturers (id)
)   COMMENT = '商品'
;

-- customers table

CREATE TABLE customers (
    id              INT AUTO_INCREMENT  NOT NULL    COMMENT '顧客ID'
   ,firstname       VARCHAR2(255)       NOT NULL    COMMENT '名'
   ,lastname        VARCHAR2(255)       NOT NULL    COMMENT '姓'
   ,phone_number    VARCHAR2(15)        NOT NULL    COMMENT '連絡先電話番号'
   ,country         VARCHAR2(255)       NOT NULL    COMMENT '国'
   ,state_prefecture
                    VARCHAR2(255)       NOT NULL    COMMENT '州/県'
   ,city            VARCHAR2(255)       NOT NULL    COMMENT '市区町村'
   ,address_1       VARCHAR2(255)       NOT NULL    COMMENT '番地'
   ,address_2       VARCHAR2(255)                   COMMENT 'マンション名/部屋番号'
   ,postal_code     VARCHAR2(255)       NOT NULL    COMMENT '郵便番号'
   ,created_at      DATETIME            NOT NULL    COMMENT '登録日時'
   ,updated_at      DATETIME            NOT NULL    COMMENT '更新日時'
   ,CONSTRAINT pk_customers PRIMARY KEY (id)
)   COMMENT = '顧客'
;

-- manufacturers table

CREATE TABLE manufacturers (
    id              INT AUTO_INCREMENT  NOT NULL    COMMENT '仕入先ID'
   ,name            VARCHAR2(255)       NOT NULL    COMMENT '仕入先名'
   ,phone_number    VARCHAR2(15)        NOT NULL    COMMENT '電話番号'
   ,country         VARCHAR2(255)       NOT NULL    COMMENT '国'
   ,state_prefecture
                    VARCHAR2(255)       NOT NULL    COMMENT '州/県'
   ,city            VARCHAR2(255)       NOT NULL    COMMENT '市区町村'
   ,address_1       VARCHAR2(255)       NOT NULL    COMMENT '番地'
   ,address_2       VARCHAR2(255)                   COMMENT 'マンション名/部屋番号'
   ,postal_code     VARCHAR2(45)        NOT NULL    COMMENT '郵便番号'
   ,created_at      DATETIME            NOT NULL    COMMENT '登録日時'
   ,updated_at      DATETIME            NOT NULL    COMMENT '更新日時'
   ,CONSTRAINT pk_manufacturers PRIMARY KEY (id)
)   COMMENT = '仕入先'
;

-- staff table

CREATE TABLE staff (
    id              INT AUTO_INCREMENT  NOT NULL    COMMENT '担当者ID'
   ,honorific       VARCHAR2(255)       NOT NULL    COMMENT '敬称'
   ,firstname       VARCHAR2(255)       NOT NULL    COMMENT '名'
   ,lastname        VARCHAR2(255)       NOT NULL    COMMENT '姓'
   ,phone_number    VARCHAR2(15)        NOT NULL    COMMENT '連絡先電話番号'
   ,manufacturer_id INT                 NOT NULL    COMMENT '仕入先ID'
   ,created_at      DATETIME            NOT NULL    COMMENT '登録日時'
   ,updated_at      DATETIME            NOT NULL    COMMENT '更新日時'
   ,CONSTRAINT pk_staff PRIMARY KEY (id)
   ,CONSTRAINT fk_manufacturer_id FOREIGN KEY (manufacturer_id)
    REFERENCES manufacturers (id)
)   COMMENT = '担当者'
;

-- order_items table

CREATE TABLE order_items (
    id              INT AUTO_INCREMENT  NOT NULL    COMMENT '注文商品ID'
   ,order_id        INT                 NOT NULL    COMMENT '注文ID'
   ,product_id      INT                 NOT NULL    COMMENT '商品ID'
   ,quantity        INT UNSIGNED        NOT NULL    COMMENT '数量'
   ,total_price     DECIMAL(15,2) UNSIGNED
                                        NOT NULL    COMMENT '小計'
   ,created_at      DATETIME            NOT NULL    COMMENT '登録日時'
   ,updated_at      DATETIME            NOT NULL    COMMENT '更新日時'
   ,CONSTRAINT pk_order_items PRIMARY KEY (id)
   ,CONSTRAINT fk_order_id FOREIGN KEY (order_id)
    REFERENCES orders (id)
   ,CONSTRAINT fk_product_id FOREIGN KEY (product_id)
    REFERENCES products (id)
)   COMMENT = '注文商品'
;

-- orders table

CREATE TABLE orders (
    id              INT AUTO_INCREMENT  NOT NULL    COMMENT '注文ID'
   ,customer_id     INT                 NOT NULL    COMMENT '顧客ID'
   ,total_price     DECIMAL(15,2) UNSIGNED
                                        NOT NULL    COMMENT '小計'
   ,order_date      DATETIME            NOT NULL    COMMENT '注文日時'
   ,order_status    INT UNSIGNED        NOT NULL    COMMENR '注文ステータス'
   ,created_at      DATETIME            NOT NULL    COMMENT '登録日時'
   ,updated_at      DATETIME            NOT NULL    COMMENT '更新日時'
   ,CONSTRAINT pk_orders PRIMARY KEY (id)
   ,
)   COMMENT = '注文'
;