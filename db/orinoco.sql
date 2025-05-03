--
-- File generated with SQLiteStudio v3.2.1 on Sat May 3 11:26:13 2025
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: basket_contents
CREATE TABLE basket_contents (
    basket_id  INTEGER,
    product_id INTEGER,
    seller_id  INTEGER NOT NULL,
    quantity   INTEGER NOT NULL,
    price      REAL    NOT NULL,
    PRIMARY KEY (
        basket_id,
        product_id
    ),
    CONSTRAINT basket_contents_shopper_baskets_fk FOREIGN KEY (
        basket_id
    )
    REFERENCES shopper_baskets (basket_id),
    CONSTRAINT basket_contents_product_sellers_fk FOREIGN KEY (
        seller_id,
        product_id
    )
    REFERENCES product_sellers (seller_id,
    product_id) 
);


-- Table: categories
CREATE TABLE categories (
    category_id          INTEGER PRIMARY KEY AUTOINCREMENT,
    category_code        TEXT    UNIQUE
                                 NOT NULL,
    category_description TEXT    NOT NULL
);

INSERT INTO categories (
                           category_id,
                           category_code,
                           category_description
                       )
                       VALUES (
                           1,
                           'MOBACC',
                           'Mobile phones and accessories'
                       );

INSERT INTO categories (
                           category_id,
                           category_code,
                           category_description
                       )
                       VALUES (
                           2,
                           'TVHCIN',
                           'TV and Home Cinema'
                       );

INSERT INTO categories (
                           category_id,
                           category_code,
                           category_description
                       )
                       VALUES (
                           3,
                           'CAMACC',
                           'Cameras and accessories'
                       );

INSERT INTO categories (
                           category_id,
                           category_code,
                           category_description
                       )
                       VALUES (
                           4,
                           'AUDHIF',
                           'Audio and Hifi'
                       );

INSERT INTO categories (
                           category_id,
                           category_code,
                           category_description
                       )
                       VALUES (
                           5,
                           'COMACC',
                           'Computers and accessories'
                       );

INSERT INTO categories (
                           category_id,
                           category_code,
                           category_description
                       )
                       VALUES (
                           6,
                           'GAMING',
                           'Gaming'
                       );


-- Table: ordered_products
CREATE TABLE ordered_products (
    order_id               INTEGER,
    product_id             INTEGER,
    seller_id              INTEGER NOT NULL,
    quantity               INTEGER NOT NULL,
    price                  REAL    NOT NULL,
    ordered_product_status TEXT,
    PRIMARY KEY (
        order_id,
        product_id
    ),
    CONSTRAINT ordered_products_shopper_orders_fk FOREIGN KEY (
        order_id
    )
    REFERENCES shopper_orders (order_id),
    CONSTRAINT ordered_products_product_sellers_fk FOREIGN KEY (
        seller_id,
        product_id
    )
    REFERENCES product_sellers (seller_id,
    product_id),
    CONSTRAINT ordered_products_ordered_product_status_check CHECK (ordered_product_status IN ('Placed', 'Dispatched', 'Delivered', 'Cancelled') ) 
);

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6202000,
                                 3000000,
                                 200000,
                                 4,
                                 249.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6202000,
                                 3006033,
                                 200005,
                                 4,
                                 249.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6219001,
                                 3006033,
                                 200000,
                                 1,
                                 244.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6221001,
                                 3007734,
                                 200000,
                                 6,
                                 26.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6221001,
                                 3007922,
                                 200000,
                                 1,
                                 69.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6402004,
                                 3007734,
                                 200004,
                                 1,
                                 26.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6403000,
                                 3005955,
                                 200000,
                                 5,
                                 109.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6428004,
                                 3007689,
                                 200010,
                                 1,
                                 331.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6504004,
                                 3007676,
                                 200010,
                                 2,
                                 242.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6512005,
                                 3006033,
                                 200000,
                                 1,
                                 244.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6515005,
                                 3007734,
                                 200000,
                                 9,
                                 26.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6609008,
                                 3006033,
                                 200000,
                                 1,
                                 244.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6618000,
                                 3007676,
                                 200010,
                                 3,
                                 242.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6618000,
                                 3007779,
                                 200009,
                                 2,
                                 164.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6621000,
                                 3000000,
                                 200002,
                                 1,
                                 237.98,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6628005,
                                 3007905,
                                 200007,
                                 7,
                                 299.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6712005,
                                 3007786,
                                 200011,
                                 1,
                                 325.55,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6712005,
                                 3007767,
                                 200000,
                                 4,
                                 299.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6731009,
                                 3007903,
                                 200011,
                                 8,
                                 339.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6731010,
                                 3007922,
                                 200000,
                                 3,
                                 69.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6809009,
                                 3007922,
                                 200000,
                                 1,
                                 69.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6811001,
                                 3007676,
                                 200010,
                                 10,
                                 242.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6811001,
                                 3007717,
                                 200000,
                                 1,
                                 53.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6830000,
                                 3006033,
                                 200009,
                                 1,
                                 232.76,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6912004,
                                 3007937,
                                 200008,
                                 8,
                                 455.27,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6915012,
                                 3007689,
                                 200010,
                                 1,
                                 331.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6916013,
                                 3007717,
                                 200000,
                                 12,
                                 53.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6916013,
                                 3007903,
                                 200000,
                                 1,
                                 325.89,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6919012,
                                 3005955,
                                 200005,
                                 4,
                                 107.5,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 6925013,
                                 3007905,
                                 200000,
                                 1,
                                 279.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7016013,
                                 3007689,
                                 200010,
                                 5,
                                 331.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7016013,
                                 3007922,
                                 200000,
                                 1,
                                 69.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7016013,
                                 3007937,
                                 200008,
                                 6,
                                 455.27,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7023014,
                                 3007717,
                                 200004,
                                 1,
                                 46.89,
                                 'Cancelled'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7027001,
                                 3007786,
                                 200000,
                                 3,
                                 329.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7101017,
                                 3007779,
                                 200000,
                                 1,
                                 169.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7102000,
                                 3005955,
                                 200005,
                                 2,
                                 107.5,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7118017,
                                 3007786,
                                 200000,
                                 5,
                                 329.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7119005,
                                 3007689,
                                 200000,
                                 1,
                                 331.66,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7130010,
                                 3007786,
                                 200000,
                                 6,
                                 329.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7208009,
                                 3005955,
                                 200005,
                                 2,
                                 107.5,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7208009,
                                 3007676,
                                 200000,
                                 1,
                                 249.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7208014,
                                 3007779,
                                 200009,
                                 8,
                                 164.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7211009,
                                 3007759,
                                 200000,
                                 1,
                                 436.59,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7217013,
                                 3007676,
                                 200000,
                                 10,
                                 249.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7217013,
                                 3007779,
                                 200000,
                                 1,
                                 169.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7218000,
                                 3007903,
                                 200000,
                                 1,
                                 325.89,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7219001,
                                 3007759,
                                 200009,
                                 7,
                                 444.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7221009,
                                 3007786,
                                 200011,
                                 1,
                                 325.55,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7224010,
                                 3006033,
                                 200005,
                                 4,
                                 249.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7224010,
                                 3007679,
                                 200000,
                                 1,
                                 721.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7225018,
                                 3007786,
                                 200000,
                                 2,
                                 329.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7229018,
                                 3007759,
                                 200009,
                                 1,
                                 444.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7231004,
                                 3007717,
                                 200000,
                                 2,
                                 53.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7231004,
                                 3007779,
                                 200000,
                                 1,
                                 169.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7302005,
                                 3005955,
                                 200005,
                                 10,
                                 107.5,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7302019,
                                 3007759,
                                 200009,
                                 1,
                                 444.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7302019,
                                 3005955,
                                 200000,
                                 1,
                                 107.5,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7304010,
                                 3007676,
                                 200000,
                                 12,
                                 249.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7306000,
                                 3007679,
                                 200010,
                                 1,
                                 699.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7306000,
                                 3007717,
                                 200000,
                                 8,
                                 53.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7306000,
                                 3007786,
                                 200011,
                                 1,
                                 325.55,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7306010,
                                 3007759,
                                 200009,
                                 1,
                                 444.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7310019,
                                 3006033,
                                 200009,
                                 5,
                                 232.76,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7317020,
                                 3007679,
                                 200000,
                                 1,
                                 721.0,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7316019,
                                 3007717,
                                 200000,
                                 8,
                                 53.0,
                                 'Dispatched'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7318019,
                                 3007922,
                                 200000,
                                 9,
                                 69.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7321004,
                                 3006033,
                                 200005,
                                 2,
                                 249.0,
                                 'Cancelled'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7327013,
                                 3007786,
                                 200011,
                                 1,
                                 325.55,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7328021,
                                 3007786,
                                 200000,
                                 3,
                                 329.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7328021,
                                 3000000,
                                 200000,
                                 1,
                                 237.98,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7331018,
                                 3007717,
                                 200000,
                                 2,
                                 53.0,
                                 'Placed'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7331018,
                                 3007786,
                                 200011,
                                 1,
                                 325.55,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7404020,
                                 3007717,
                                 200000,
                                 7,
                                 53.0,
                                 'Dispatched'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7408014,
                                 3007734,
                                 200004,
                                 1,
                                 26.99,
                                 'Delivered'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7408014,
                                 3007779,
                                 200000,
                                 8,
                                 169.99,
                                 'Dispatched'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7417022,
                                 3005955,
                                 200005,
                                 12,
                                 107.5,
                                 'Placed'
                             );

INSERT INTO ordered_products (
                                 order_id,
                                 product_id,
                                 seller_id,
                                 quantity,
                                 price,
                                 ordered_product_status
                             )
                             VALUES (
                                 7417022,
                                 3007734,
                                 200000,
                                 1,
                                 26.99,
                                 'Placed'
                             );


-- Table: product_review
CREATE TABLE product_review (
    review_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    shopper_id  INTEGER NOT NULL,
    product_id  INTEGER NOT NULL,
    review_text TEXT,
    rating      TEXT    NOT NULL
                        CHECK (rating IN ('*', '**', '***', '****', '*****') ),
    review_time TEXT    NOT NULL
                        DEFAULT (datetime('now') ),
    FOREIGN KEY (
        shopper_id
    )
    REFERENCES shoppers (shopper_id),
    FOREIGN KEY (
        product_id
    )
    REFERENCES products (product_id) 
);


-- Table: product_sellers
CREATE TABLE product_sellers (
    product_id INTEGER NOT NULL,
    seller_id  INTEGER NOT NULL,
    price      REAL    NOT NULL,
    PRIMARY KEY (
        product_id,
        seller_id
    ),
    CONSTRAINT product_sellers_products_fk FOREIGN KEY (
        product_id
    )
    REFERENCES products (product_id),
    CONSTRAINT product_sellers_sellers_fk FOREIGN KEY (
        seller_id
    )
    REFERENCES sellers (seller_id) 
);

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3000000,
                                200000,
                                249.0
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3000000,
                                200002,
                                237.98
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3000000,
                                200003,
                                239.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3000000,
                                200005,
                                270.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3000021,
                                200000,
                                1079.0
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3000021,
                                200002,
                                999.0
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3005955,
                                200000,
                                109.0
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3005955,
                                200005,
                                107.5
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3006033,
                                200000,
                                244.0
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3006033,
                                200005,
                                249.0
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3006033,
                                200009,
                                232.76
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007676,
                                200000,
                                249.0
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007676,
                                200010,
                                242.0
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007679,
                                200000,
                                721.0
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007679,
                                200010,
                                699.0
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007689,
                                200000,
                                331.66
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007689,
                                200010,
                                331.0
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007717,
                                200000,
                                53.0
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007717,
                                200001,
                                49.97
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007717,
                                200004,
                                46.89
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007734,
                                200000,
                                26.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007734,
                                200004,
                                26.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007759,
                                200000,
                                436.59
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007759,
                                200003,
                                470.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007759,
                                200009,
                                444.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007762,
                                200000,
                                312.14
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007762,
                                200001,
                                331.9
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007762,
                                200003,
                                319.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007762,
                                200009,
                                300.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007767,
                                200000,
                                299.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007779,
                                200000,
                                169.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007779,
                                200009,
                                164.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007903,
                                200000,
                                325.89
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007903,
                                200002,
                                320.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007903,
                                200007,
                                339.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007903,
                                200011,
                                339.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007905,
                                200000,
                                279.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007905,
                                200002,
                                260.0
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007905,
                                200007,
                                299.0
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007922,
                                200000,
                                69.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007937,
                                200002,
                                489.0
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007937,
                                200008,
                                455.27
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007786,
                                200000,
                                329.99
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007786,
                                200008,
                                327.79
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007786,
                                200009,
                                321.23
                            );

INSERT INTO product_sellers (
                                product_id,
                                seller_id,
                                price
                            )
                            VALUES (
                                3007786,
                                200011,
                                325.55
                            );


-- Table: products
CREATE TABLE products (
    product_id           INTEGER PRIMARY KEY AUTOINCREMENT,
    category_id          INTEGER,
    product_code         TEXT    UNIQUE
                                 NOT NULL,
    product_description  TEXT    NOT NULL,
    product_manufacturer TEXT    NOT NULL,
    product_model        TEXT,
    product_status       TEXT    NOT NULL,
    CONSTRAINT products_categories_fk FOREIGN KEY (
        category_id
    )
    REFERENCES categories (category_id),
    CONSTRAINT products_product_status_check CHECK (product_status IN ('Available', 'Temporarily Unavailable', 'Discontinued') ) 
);

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3000000,
                         2,
                         'TV30399302',
                         'Sony Bravia 32 inch HD TV Black',
                         'Sony',
                         'KDL32WE613BU',
                         'Available'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3000021,
                         2,
                         'TV30356743',
                         'Panasonic 55 inch OLED TV Black',
                         'LG',
                         'OLED55B9PLA',
                         'Available'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3005955,
                         1,
                         'MP45322289',
                         'Huawei Y6 32GB 6.09 inch Smartphone',
                         'Huawei',
                         'B07S268P1K',
                         'Available'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3006033,
                         1,
                         'MP56889550',
                         'Samsung Galaxy M30s SIM Free Smartphone',
                         'Samsung',
                         'SM-M307FZKUBTU',
                         'Available'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3007676,
                         3,
                         'CA067443',
                         'Canon DSLR Camera (Black)',
                         'Canon',
                         'EOS 4000D',
                         'Available'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3007679,
                         3,
                         'CA568333',
                         'Nikon Digital DSLR Camera Body (Black)',
                         'Nikon',
                         'D7500',
                         'Available'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3007689,
                         3,
                         'CA175555',
                         'Panasonic Lumix Camera, 12.1 Megapixel, 24x Optical Zoom, Black',
                         'Panasonic',
                         'DMC-FZ300',
                         'Temporarily Unavailable'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3007717,
                         4,
                         'AU353512',
                         'Sony Wireless Noise Cancelling Headphones',
                         'Sony',
                         'WH-1000XM3',
                         'Available'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3007734,
                         4,
                         'AU430303',
                         'Supereye MP3 Player, 16G Portable Lossless Sound MP3 Player',
                         'Supereye',
                         'B07PRG6QMV',
                         'Available'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3007759,
                         5,
                         'CO3930033',
                         'Lenovo V145 15.6" FHD Laptop AMD A9-9425, 8GB RAM, 256GB SSD, Black',
                         'Lenovo',
                         '81MT0015UK',
                         'Available'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3007762,
                         5,
                         'CO8920232',
                         'ASUS VivoBook X420 Full HD 14 Inch Laptop (128 GB SSD, 4 GB RAM)',
                         'Asus',
                         'X420UA-EK019T',
                         'Available'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3007767,
                         5,
                         'CO8920231',
                         'ASUS VivoBook X320 Full HD 14 Inch Laptop (128 GB SSD, 2 GB RAM)',
                         'Asus',
                         'X320UA-EK015T',
                         'Discontinued'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3007779,
                         5,
                         'CO6558555',
                         'Samsung Galaxy Tab A 10.1-Inch 32 GB Wi-Fi',
                         'Samsung',
                         'SM-T510NZKDBTU',
                         'Available'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3007786,
                         6,
                         'GA29002201',
                         'Nintendo Switch',
                         'Nintendo',
                         'B07W4CK8KR',
                         'Available'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3007903,
                         6,
                         'GA13949494',
                         'Sony PlayStation 4 Pro 1TB White',
                         'Sony',
                         'SP603033A',
                         'Available'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3007905,
                         6,
                         'GA84944050',
                         'Microsoft Xbox One 500GB Console - Black ',
                         'Microsoft',
                         'B00CM1KUVE',
                         'Available'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3007922,
                         6,
                         'GA22020026',
                         'Numskull Multi-Format Pro Steering Wheel',
                         'Numskull',
                         'NUMK83656',
                         'Temporarily Unavailable'
                     );

INSERT INTO products (
                         product_id,
                         category_id,
                         product_code,
                         product_description,
                         product_manufacturer,
                         product_model,
                         product_status
                     )
                     VALUES (
                         3007937,
                         6,
                         'GA33533688',
                         'Xbox One S 1TB Console - Minecraft Creators Bundle',
                         'Microsoft',
                         'B07MLWLYCN',
                         'Available'
                     );


-- Table: seller_review
CREATE TABLE seller_review (
    review_id   INTEGER PRIMARY KEY AUTOINCREMENT,
    shopper_id  INTEGER NOT NULL,
    seller_id   INTEGER NOT NULL,
    review_text TEXT,
    rating      TEXT    NOT NULL
                        CHECK (rating IN ('*', '**', '***', '****', '*****') ),
    review_time TEXT    NOT NULL
                        DEFAULT (datetime('now') ),
    FOREIGN KEY (
        shopper_id
    )
    REFERENCES shoppers (shopper_id),
    FOREIGN KEY (
        seller_id
    )
    REFERENCES sellers (seller_id) 
);

INSERT INTO seller_review (
                              review_id,
                              shopper_id,
                              seller_id,
                              review_text,
                              rating,
                              review_time
                          )
                          VALUES (
                              1,
                              10000,
                              200004,
                              'nice and fast',
                              '*****',
                              '2025-04-12 10:15:31'
                          );


-- Table: sellers
CREATE TABLE sellers (
    seller_id            INTEGER PRIMARY KEY AUTOINCREMENT,
    seller_account_ref   TEXT    UNIQUE
                                 NOT NULL,
    seller_name          TEXT    NOT NULL,
    seller_address_line1 TEXT    NOT NULL,
    seller_address_line2 TEXT,
    seller_address_line3 TEXT,
    seller_county        TEXT    NOT NULL,
    seller_post_code     TEXT    NOT NULL,
    seller_email_address TEXT    NOT NULL
);

INSERT INTO sellers (
                        seller_id,
                        seller_account_ref,
                        seller_name,
                        seller_address_line1,
                        seller_address_line2,
                        seller_address_line3,
                        seller_county,
                        seller_post_code,
                        seller_email_address
                    )
                    VALUES (
                        200000,
                        'ORI00001',
                        'Parana UK',
                        'Ford Industrial Park',
                        'Leighton Buzzard',
                        NULL,
                        'Bedfordshire',
                        'LU7 6GB',
                        'sales_uk@parana.com'
                    );

INSERT INTO sellers (
                        seller_id,
                        seller_account_ref,
                        seller_name,
                        seller_address_line1,
                        seller_address_line2,
                        seller_address_line3,
                        seller_county,
                        seller_post_code,
                        seller_email_address
                    )
                    VALUES (
                        200001,
                        'STU00550',
                        'Stuff UK',
                        'Unit 5',
                        'Cosmos Industrial Estate',
                        'Swindon',
                        'Wiltshire',
                        'SN12 0YQ',
                        'sales@stuffuk.co.uk'
                    );

INSERT INTO sellers (
                        seller_id,
                        seller_account_ref,
                        seller_name,
                        seller_address_line1,
                        seller_address_line2,
                        seller_address_line3,
                        seller_county,
                        seller_post_code,
                        seller_email_address
                    )
                    VALUES (
                        200002,
                        'ELE00118',
                        'Electronics World',
                        '20-30 Brick Lane',
                        'Slough',
                        NULL,
                        'Berkshire',
                        'SL4 1TT',
                        'uk_enquiries@electronics_world.com'
                    );

INSERT INTO sellers (
                        seller_id,
                        seller_account_ref,
                        seller_name,
                        seller_address_line1,
                        seller_address_line2,
                        seller_address_line3,
                        seller_county,
                        seller_post_code,
                        seller_email_address
                    )
                    VALUES (
                        200003,
                        'KLI00034',
                        'Kliktec',
                        'Unit 18',
                        'Trent Industrial Park',
                        'Nottingham',
                        'Nottinghamshire',
                        'NG1 2LM',
                        'sales@kliktec.co.uk'
                    );

INSERT INTO sellers (
                        seller_id,
                        seller_account_ref,
                        seller_name,
                        seller_address_line1,
                        seller_address_line2,
                        seller_address_line3,
                        seller_county,
                        seller_post_code,
                        seller_email_address
                    )
                    VALUES (
                        200004,
                        'BAR00028',
                        'Barracuda',
                        '1 Fulham Road',
                        'White City',
                        NULL,
                        'London',
                        'W12 7EB',
                        'enquiries@barrcuda_uk.com'
                    );

INSERT INTO sellers (
                        seller_id,
                        seller_account_ref,
                        seller_name,
                        seller_address_line1,
                        seller_address_line2,
                        seller_address_line3,
                        seller_county,
                        seller_post_code,
                        seller_email_address
                    )
                    VALUES (
                        200005,
                        'OUK00001',
                        'DigiTec Limited',
                        'Unit 5',
                        'Newlands Road',
                        'Hackney',
                        'London',
                        'E1 0AB',
                        'sales@digitec.co.uk'
                    );

INSERT INTO sellers (
                        seller_id,
                        seller_account_ref,
                        seller_name,
                        seller_address_line1,
                        seller_address_line2,
                        seller_address_line3,
                        seller_county,
                        seller_post_code,
                        seller_email_address
                    )
                    VALUES (
                        200006,
                        'KIR00056',
                        'Kirby',
                        '14 Cook Street',
                        'Reading',
                        NULL,
                        'Berkshire',
                        'RG14 7AQ',
                        'sales@kirby.co.uk'
                    );

INSERT INTO sellers (
                        seller_id,
                        seller_account_ref,
                        seller_name,
                        seller_address_line1,
                        seller_address_line2,
                        seller_address_line3,
                        seller_county,
                        seller_post_code,
                        seller_email_address
                    )
                    VALUES (
                        200007,
                        'GAM00188',
                        'GameOn',
                        'Unit 2',
                        'Totton Industrial Park',
                        'Southampton',
                        'Hampshire',
                        'SO40 5HB',
                        'sales@millenium-retailing.com'
                    );

INSERT INTO sellers (
                        seller_id,
                        seller_account_ref,
                        seller_name,
                        seller_address_line1,
                        seller_address_line2,
                        seller_address_line3,
                        seller_county,
                        seller_post_code,
                        seller_email_address
                    )
                    VALUES (
                        200008,
                        'FUS00171',
                        'Fusion',
                        '100 Grigg Road',
                        'Sheffield',
                        NULL,
                        'Yorkshire',
                        'S3 1BC',
                        'parana.sales@fusion.com'
                    );

INSERT INTO sellers (
                        seller_id,
                        seller_account_ref,
                        seller_name,
                        seller_address_line1,
                        seller_address_line2,
                        seller_address_line3,
                        seller_county,
                        seller_post_code,
                        seller_email_address
                    )
                    VALUES (
                        200009,
                        'INT00090',
                        'IntelliWorld',
                        'Unit 81',
                        'Branksome Park',
                        'Poole',
                        'Dorset',
                        'BH11 0SZ',
                        'sales@intelliworld.co.uk'
                    );

INSERT INTO sellers (
                        seller_id,
                        seller_account_ref,
                        seller_name,
                        seller_address_line1,
                        seller_address_line2,
                        seller_address_line3,
                        seller_county,
                        seller_post_code,
                        seller_email_address
                    )
                    VALUES (
                        200010,
                        'CCL00061',
                        'CCL',
                        'Unit 1',
                        'Concord Industrial Estate',
                        'Bristol',
                        'Somerset',
                        'BS1 2LK',
                        'uk_sales@ccl.com'
                    );

INSERT INTO sellers (
                        seller_id,
                        seller_account_ref,
                        seller_name,
                        seller_address_line1,
                        seller_address_line2,
                        seller_address_line3,
                        seller_county,
                        seller_post_code,
                        seller_email_address
                    )
                    VALUES (
                        200011,
                        'BLU00288',
                        'BlueShark Ltd',
                        'Unit 6',
                        'Hampton Industrial Park',
                        'Acton',
                        'London',
                        'W12 0NG',
                        'sales@blueshark.co.uk'
                    );


-- Table: shopper_baskets
CREATE TABLE shopper_baskets (
    basket_id                INTEGER PRIMARY KEY AUTOINCREMENT,
    shopper_id               INTEGER NOT NULL,
    basket_created_date_time TEXT    NOT NULL,
    CONSTRAINT shopper_baskets_shoppers_fk FOREIGN KEY (
        shopper_id
    )
    REFERENCES shoppers (shopper_id) 
);


-- Table: shopper_orders
CREATE TABLE shopper_orders (
    order_id     INTEGER PRIMARY KEY AUTOINCREMENT,
    shopper_id   INTEGER NOT NULL,
    order_date   TEXT    NOT NULL,
    order_status TEXT    NOT NULL,
    CONSTRAINT shopper_orders_shoppers_fk FOREIGN KEY (
        shopper_id
    )
    REFERENCES shoppers (shopper_id),
    CONSTRAINT shopper_orders_order_status_check CHECK (order_status IN ('Placed', 'Incomplete', 'Complete', 'Cancelled') ) 
);

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6202000,
                               10000,
                               '2019-02-02',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6219001,
                               10001,
                               '2019-02-19',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6221001,
                               10001,
                               '2019-02-21',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6402004,
                               10004,
                               '2019-04-02',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6403000,
                               10000,
                               '2019-04-03',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6428004,
                               10004,
                               '2019-04-28',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6504004,
                               10004,
                               '2019-05-04',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6512005,
                               10005,
                               '2019-05-12',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6515005,
                               10005,
                               '2019-05-15',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6609008,
                               10008,
                               '2019-06-09',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6618000,
                               10000,
                               '2019-06-18',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6621000,
                               10000,
                               '2019-06-21',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6628005,
                               10005,
                               '2019-06-28',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6712005,
                               10005,
                               '2019-07-12',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6731009,
                               10009,
                               '2019-07-31',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6731010,
                               10010,
                               '2019-07-31',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6809009,
                               10009,
                               '2019-08-09',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6811001,
                               10001,
                               '2019-08-11',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6830000,
                               10009,
                               '2019-08-30',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6912004,
                               10004,
                               '2019-09-12',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6915012,
                               10012,
                               '2019-09-15',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6916013,
                               10013,
                               '2019-09-16',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6919012,
                               10012,
                               '2019-09-19',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               6925013,
                               10013,
                               '2019-09-25',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7016013,
                               10013,
                               '2019-10-16',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7023014,
                               10014,
                               '2019-10-23',
                               'Cancelled'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7027001,
                               10001,
                               '2019-10-27',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7101017,
                               10017,
                               '2019-11-01',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7102000,
                               10010,
                               '2019-11-02',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7118017,
                               10017,
                               '2019-11-18',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7119005,
                               10005,
                               '2019-11-19',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7130010,
                               10010,
                               '2019-11-30',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7208009,
                               10009,
                               '2019-12-08',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7208014,
                               10014,
                               '2019-12-08',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7211009,
                               10009,
                               '2019-12-11',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7217013,
                               10013,
                               '2019-12-17',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7218000,
                               10000,
                               '2019-12-18',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7219001,
                               10001,
                               '2019-12-19',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7221009,
                               10009,
                               '2019-12-21',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7224010,
                               10010,
                               '2019-12-24',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7225018,
                               10018,
                               '2019-12-25',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7229018,
                               10018,
                               '2019-12-29',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7231004,
                               10004,
                               '2019-12-31',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7302005,
                               10005,
                               '2020-02-02',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7302019,
                               10019,
                               '2020-01-02',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7304010,
                               10010,
                               '2019-01-04',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7306000,
                               10000,
                               '2020-01-06',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7306010,
                               10010,
                               '2020-01-06',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7310019,
                               10019,
                               '2020-01-10',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7316019,
                               10019,
                               '2020-01-16',
                               'Incomplete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7317020,
                               10020,
                               '2020-01-17',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7318019,
                               10019,
                               '2020-01-18',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7321004,
                               10004,
                               '2020-01-21',
                               'Cancelled'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7327013,
                               10013,
                               '2020-01-27',
                               'Complete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7328021,
                               10021,
                               '2020-01-28',
                               'Placed'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7331018,
                               10005,
                               '2020-01-31',
                               'Incomplete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7404020,
                               10020,
                               '2020-02-04',
                               'Placed'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7408014,
                               10014,
                               '2020-02-08',
                               'Incomplete'
                           );

INSERT INTO shopper_orders (
                               order_id,
                               shopper_id,
                               order_date,
                               order_status
                           )
                           VALUES (
                               7417022,
                               10022,
                               '2020-02-17',
                               'Placed'
                           );


-- Table: shoppers
CREATE TABLE shoppers (
    shopper_id            INTEGER PRIMARY KEY AUTOINCREMENT,
    shopper_account_ref   TEXT    UNIQUE
                                  NOT NULL,
    shopper_first_name    TEXT    NOT NULL,
    shopper_surname       TEXT    NOT NULL,
    shopper_email_address TEXT    NOT NULL,
    date_of_birth         TEXT,
    gender                TEXT,
    date_joined           TEXT    NOT NULL
);

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10000,
                         'CB104093',
                         'Caroline',
                         'Bradley',
                         'cbradley@coldmail.co.uk',
                         '1965-05-10',
                         'F',
                         '2019-02-02'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10001,
                         'LC103202',
                         'Liam',
                         'Charlesworth',
                         'liam_charlesworth@wahoo.com',
                         '1990-12-18',
                         'M',
                         '2019-02-19'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10003,
                         'CL106755',
                         'Christian',
                         'Lovett',
                         'cvl2340@coldmail.co.uk',
                         '1944-10-08',
                         'M',
                         '2019-03-27'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10004,
                         'EC110404',
                         'Elliott',
                         'Chandler',
                         'ell_chandler20@geemail.com',
                         '2000-03-27',
                         'M',
                         '2019-04-02'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10005,
                         'AS102193',
                         'Abby',
                         'Smith',
                         'abbysmith12@.wahoo.com',
                         '1998-11-04',
                         'F',
                         '2019-05-12'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10006,
                         'TB107770',
                         'Thomas',
                         'Bradshaw',
                         'tb45600@coldmail.co.uk',
                         '1992-03-31',
                         'M',
                         '2019-05-22'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10008,
                         'FB113293',
                         'Francois',
                         'Bouillion',
                         'fbouillion@yoho.com.',
                         '2001-09-12',
                         'M',
                         '2019-06-08'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10009,
                         'AN118893',
                         'Adebe',
                         'Ndidi',
                         'andidi@bestmail.co.uk',
                         '1999-04-09',
                         'M',
                         '2019-07-31'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10010,
                         'LP122073',
                         'Lucy-Anne',
                         'Porter',
                         'laporter66@.coldmail.co.uk',
                         '1987-04-19',
                         'F',
                         '2019-07-31'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10011,
                         'LY108994',
                         'Lewis',
                         'Young',
                         'lew_young12@wahoo.com',
                         '2001-01-11',
                         'M',
                         '2019-08-08'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10012,
                         'BL114443',
                         'Brenda',
                         'La Porte',
                         'brenda_laporte@bestmail.co.uk',
                         '1977-08-10',
                         'F',
                         '2019-09-15'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10013,
                         'TD156773',
                         'Tanya',
                         'Divine',
                         'td14039@wahoo.com',
                         '1997-06-27',
                         'F',
                         '2019-09-16'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10014,
                         'BJ113230',
                         'Ben',
                         'Jones',
                         'bennyboy10@lol.co.uk',
                         '1992-08-31',
                         'M',
                         '2019-10-23'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10017,
                         'LN109090',
                         'Lisa',
                         'Newman',
                         'lisa.newman@coldmail.co.uk',
                         '1959-12-28',
                         'F',
                         '2019-11-01'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10018,
                         'PP110032',
                         'Paula',
                         'Patterson',
                         'pp67676@wahoo.com',
                         '1971-01-12',
                         'F',
                         '2019-12-25'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10019,
                         'FS108991',
                         'Frankie',
                         'Smith',
                         'frankie_m33@wahoo.com',
                         '2001-01-10',
                         NULL,
                         '2020-01-02'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10020,
                         'GB122310',
                         'Gill',
                         'Bex',
                         'gb20201@lol.co.uk',
                         '1969-07-05',
                         'F',
                         '2020-01-17'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10021,
                         'MV156753',
                         'Martin',
                         'Venus',
                         'mvenus@coldmail.co.uk',
                         '1989-06-11',
                         'M',
                         '2020-01-18'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10022,
                         'MC115590',
                         'Matthias',
                         'Christiansson',
                         'mcsquared@lol.co.uk',
                         '1997-08-28',
                         'M',
                         '2020-02-10'
                     );

INSERT INTO shoppers (
                         shopper_id,
                         shopper_account_ref,
                         shopper_first_name,
                         shopper_surname,
                         shopper_email_address,
                         date_of_birth,
                         gender,
                         date_joined
                     )
                     VALUES (
                         10023,
                         'AA124778',
                         'Ali',
                         'Al Fayed',
                         'ali_alfayed4405@wahoo.com',
                         '1984-05-01',
                         'M',
                         '2020-02-12'
                     );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
