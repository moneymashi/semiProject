-- 1. SEQUENCE 생성
--
CREATE SEQUENCE  "AUCTION"."AUCTION_BID_SEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
CREATE SEQUENCE  "AUCTION"."AUCTION_BOARD_SEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
CREATE SEQUENCE  "AUCTION"."AUCTION_ITEM_SEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
CREATE SEQUENCE  "AUCTION"."AUCTION_USER_SEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
CREATE SEQUENCE  "AUCTION"."CATEGORY_SEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
CREATE SEQUENCE  "AUCTION"."USER_MESSAGE_SEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
CREATE SEQUENCE  "AUCTION"."USER_PAYMENT_SEQ"  MINVALUE 1 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;

-- 2. TABLE 생성

CREATE TABLE AUCTION_BID
(
   BID_ID         NUMBER (10),
   AUCTION_ID     NUMBER (10),
   BIDDER_ID      NUMBER (10),
   BIDDING_DATE   DATE DEFAULT SYSDATE,
   BID_AMOUNT     NUMBER (10)
)
NOCACHE
LOGGING;

CREATE TABLE AUCTION_BOARD
(
   AUCTION_ID      NUMBER (10),
   BOARD_ID        NUMBER (10),
   BOARD_TITLE     VARCHAR2 (100),
   BOARD_WRITER_ID NUMBER(10),
   BOARD_NAME      VARCHAR2 (100),
   BOARD_CONTENT   VARCHAR2 (3000),
   BOARD_GROUP     NUMBER (4),
   BOARD_HIT       NUMBER (4) DEFAULT 0,
   BOARD_STEP      NUMBER (4) DEFAULT 0,
   BOARD_INDENT    NUMBER (4) DEFAULT 0,
   BOARD_DATE      DATE DEFAULT SYSDATE
)
NOCACHE
LOGGING;

CREATE TABLE AUCTION_ITEM
(
   AUCTION_ID           NUMBER (10),
   AUCTIONEER_ID        NUMBER (10),
   ITEM_NAME            VARCHAR2 (100),
   ITEM_CONTENT         VARCHAR2 (3000),
   START_DATE           DATE DEFAULT SYSDATE,
   END_DATE             DATE,
   STATE_CODE           NUMBER (1) DEFAULT 1,
   CURRNET_BIDDER_ID    NUMBER (10),
   CURRENT_BIDDER       VARCHAR2 (100),
   CURRENT_BID_AMOUNT   NUMBER (10),
   AUCTION_HIT           NUMBER (4) DEFAULT 0,
   CATEGORY_ID          NUMBER (10),
   PICTURE_LOCATION     VARCHAR2 (500)
)
NOCACHE
LOGGING;

CREATE TABLE AUCTION_USER
(
   USER_ID            NUMBER (10),
   USER_NAME          VARCHAR2 (100),
   EMAIL              VARCHAR2 (40),
   PASSWORD           VARCHAR2 (20),    
   REGISTER_DATE      DATE DEFAULT SYSDATE,
   AUTH               NUMBER (1) DEFAULT 1,
   USER_POINT         NUMBER (10) DEFAULT 0,
   REAL_NAME          VARCHAR2 (100),
   ADDRESS            VARCHAR2 (100),
   ZIP_CODE           VARCHAR2 (5),
   PHONE_NUMBER       VARCHAR2 (11),
   PICTURE_LOCATION   VARCHAR2 (500)
)
NOCACHE
LOGGING;

CREATE TABLE AUCTIONEER_INFO
(
   AUCTIONEER_ID    NUMBER (10),
   AUCTIONEER_LEVEL NUMBER (1) DEFAULT 0,
   SATISFACTION     NUMBER (3) DEFAULT 0,
   BANK_NAME        VARCHAR2 (100),
   ACCOUNT_NAME     VARCHAR2 (100),
   ACCOUNT_NUMBER   NUMBER (12)
)
NOCACHE
LOGGING;

CREATE TABLE AUTH_CODE
(
   AUTH        NUMBER (1),
   AUTH_NAME   VARCHAR2 (100)
)
NOCACHE
LOGGING;

CREATE TABLE CATEGORY
(
   CATEGORY_ID     NUMBER (10),
   CATEGORY_NAME   VARCHAR2 (100),
   PARENT_CATEGORY_ID   NUMBER (10)
)
NOCACHE
LOGGING;

CREATE TABLE STATE_CODE
(
   STATE_CODE   NUMBER (1),
   STATE_NAME   VARCHAR2 (100)
)
NOCACHE
LOGGING;

CREATE TABLE USER_MESSAGE
(
   MESSAGE_ID        NUMBER (10),
   USER_ID           NUMBER (10),
   SENDER_ID         NUMBER (10),
   MESSAGE_TITLE     VARCHAR2 (100),
   MESSAGE_CONTENT   VARCHAR2 (3000),
   RECEIVE_CHECK     NUMBER (1) DEFAULT 0,
   SEND_DATE         DATE DEFAULT SYSDATE
)
NOCACHE
LOGGING;

CREATE TABLE USER_PAYMENT
(
   CARD_ID         NUMBER (10),
   USER_ID         NUMBER (10),
   SERIAL_NUMBER   NUMBER (11),
   CVC             NUMBER (3),
   MONTH           NUMBER (2),
   YEAR            NUMBER (2),
   CARD_COMPANY    VARCHAR2 (100)
)
NOCACHE
LOGGING;

-- 기본키 선정
ALTER TABLE auction_user
   ADD CONSTRAINT sys_c007019 PRIMARY KEY (user_id) VALIDATE;
ALTER TABLE auth_code
   ADD CONSTRAINT sys_c007030 PRIMARY KEY (auth) VALIDATE;
ALTER TABLE user_message
   ADD CONSTRAINT sys_c007039 PRIMARY KEY (message_id) VALIDATE;
ALTER TABLE user_payment
   ADD CONSTRAINT sys_c007048 PRIMARY KEY (card_id) VALIDATE;
ALTER TABLE auctioneer_info
   ADD CONSTRAINT sys_c007026 PRIMARY KEY (auctioneer_id) VALIDATE;
ALTER TABLE category
   ADD CONSTRAINT sys_c007052 PRIMARY KEY (category_id) VALIDATE;
ALTER TABLE state_code
   ADD CONSTRAINT sys_c007055 PRIMARY KEY (state_code) VALIDATE;
ALTER TABLE auction_board
   ADD CONSTRAINT sys_c007090 PRIMARY KEY (board_id, auction_id) VALIDATE;
ALTER TABLE auction_item
   ADD CONSTRAINT sys_c007068 PRIMARY KEY (auction_id) VALIDATE;
ALTER TABLE auction_bid
   ADD CONSTRAINT sys_c007078 PRIMARY KEY (bid_id) VALIDATE;


-- 왜래키 및 NOT NULL 설정
ALTER TABLE auction_user
   ADD CONSTRAINT fk_auth FOREIGN KEY (auth)
       REFERENCES AUCTION.auth_code (auth)
       VALIDATE;
ALTER TABLE auction_user
   MODIFY user_id CONSTRAINT sys_c007012 NOT NULL VALIDATE;
ALTER TABLE auction_user
   MODIFY user_name CONSTRAINT sys_c007013 NOT NULL VALIDATE;
ALTER TABLE auction_user
   MODIFY email CONSTRAINT sys_c007014 NOT NULL VALIDATE;
ALTER TABLE auction_user
   MODIFY password CONSTRAINT sys_c007015 NOT NULL VALIDATE;
ALTER TABLE auction_user
   MODIFY register_date CONSTRAINT sys_c007016 NOT NULL VALIDATE;
ALTER TABLE auction_user
   MODIFY auth CONSTRAINT sys_c007017 NOT NULL VALIDATE;
ALTER TABLE auction_user
   MODIFY user_point CONSTRAINT sys_c007018 NOT NULL VALIDATE;

ALTER TABLE auth_code
   MODIFY auth_name CONSTRAINT sys_c007029 NOT NULL VALIDATE;
ALTER TABLE auth_code
   MODIFY auth CONSTRAINT sys_c007028 NOT NULL VALIDATE;

ALTER TABLE user_message
   ADD CONSTRAINT fk_user_message_1 FOREIGN KEY (user_id)
       REFERENCES AUCTION.auction_user (user_id)
       VALIDATE;
ALTER TABLE user_message
   ADD CONSTRAINT fk_user_message_2 FOREIGN KEY (sender_id)
       REFERENCES AUCTION.auction_user (user_id)
       VALIDATE;
ALTER TABLE user_message
   MODIFY message_id CONSTRAINT sys_c007032 NOT NULL VALIDATE;
ALTER TABLE user_message
   MODIFY user_id CONSTRAINT sys_c007033 NOT NULL VALIDATE;
ALTER TABLE user_message
   MODIFY sender_id CONSTRAINT sys_c007034 NOT NULL VALIDATE;
ALTER TABLE user_message
   MODIFY message_title CONSTRAINT sys_c007035 NOT NULL VALIDATE;
ALTER TABLE user_message
   MODIFY message_content CONSTRAINT sys_c007036 NOT NULL VALIDATE;
ALTER TABLE user_message
   MODIFY receive_check CONSTRAINT sys_c007037 NOT NULL VALIDATE;
ALTER TABLE user_message
   MODIFY send_date CONSTRAINT sys_c007038 NOT NULL VALIDATE;

ALTER TABLE user_payment
   ADD CONSTRAINT fk_user_payment_1 FOREIGN KEY (user_id)
       REFERENCES AUCTION.auction_user (user_id)
       VALIDATE;
ALTER TABLE user_payment
   MODIFY card_id CONSTRAINT sys_c007042 NOT NULL VALIDATE;
ALTER TABLE user_payment
   MODIFY user_id CONSTRAINT sys_c007043 NOT NULL VALIDATE;
ALTER TABLE user_payment
   MODIFY serial_number CONSTRAINT sys_c007044 NOT NULL VALIDATE;
ALTER TABLE user_payment
   MODIFY month CONSTRAINT sys_c007045 NOT NULL VALIDATE;
ALTER TABLE user_payment
   MODIFY year CONSTRAINT sys_c007046 NOT NULL VALIDATE;
ALTER TABLE user_payment
   MODIFY card_company CONSTRAINT sys_c007047 NOT NULL VALIDATE;

ALTER TABLE auctioneer_info
   ADD CONSTRAINT fk_auctioneer_info_1 FOREIGN KEY (auctioneer_id)
       REFERENCES AUCTION.auction_user (user_id)
       VALIDATE;
ALTER TABLE auctioneer_info
   MODIFY auctioneer_id CONSTRAINT sys_c007020 NOT NULL VALIDATE;
ALTER TABLE auctioneer_info
   MODIFY auctioneer_level CONSTRAINT sys_c007021 NOT NULL VALIDATE;
ALTER TABLE auctioneer_info
   MODIFY satisfaction CONSTRAINT sys_c007022 NOT NULL VALIDATE;
ALTER TABLE auctioneer_info
   MODIFY bank_name CONSTRAINT sys_c007023 NOT NULL VALIDATE;
ALTER TABLE auctioneer_info
   MODIFY account_name CONSTRAINT sys_c007024 NOT NULL VALIDATE;
ALTER TABLE auctioneer_info
   MODIFY account_number CONSTRAINT sys_c007025 NOT NULL VALIDATE;

ALTER TABLE category
   MODIFY category_id CONSTRAINT sys_c007050 NOT NULL VALIDATE;
ALTER TABLE category
   MODIFY category_name CONSTRAINT sys_c007051 NOT NULL VALIDATE;

ALTER TABLE state_code
   MODIFY state_code CONSTRAINT sys_c007053 NOT NULL VALIDATE;
ALTER TABLE state_code
   MODIFY state_name CONSTRAINT sys_c007054 NOT NULL VALIDATE;

ALTER TABLE auction_board
   ADD CONSTRAINT fk_auction_board_1 FOREIGN KEY (auction_id)
       REFERENCES AUCTION.auction_item (auction_id)
       VALIDATE;
ALTER TABLE auction_board
   MODIFY board_id CONSTRAINT sys_c007081 NOT NULL VALIDATE;
ALTER TABLE auction_board
   MODIFY board_title CONSTRAINT sys_c007082 NOT NULL VALIDATE;
ALTER TABLE auction_board
   MODIFY board_name CONSTRAINT sys_c007083 NOT NULL VALIDATE;
ALTER TABLE auction_board
   MODIFY board_content CONSTRAINT sys_c007084 NOT NULL VALIDATE;
ALTER TABLE auction_board
   MODIFY board_group CONSTRAINT sys_c007085 NOT NULL VALIDATE;
ALTER TABLE auction_board
   MODIFY board_hit CONSTRAINT sys_c007086 NOT NULL VALIDATE;
ALTER TABLE auction_board
   MODIFY board_step CONSTRAINT sys_c007087 NOT NULL VALIDATE;
ALTER TABLE auction_board
   MODIFY board_indent CONSTRAINT sys_c007088 NOT NULL VALIDATE;
ALTER TABLE auction_board
   MODIFY board_date CONSTRAINT sys_c007089 NOT NULL VALIDATE;

ALTER TABLE auction_item
   ADD CONSTRAINT fk_auction_item_1 FOREIGN KEY (auctioneer_id)
       REFERENCES AUCTION.auctioneer_info (auctioneer_id)
       VALIDATE;
ALTER TABLE auction_item
   ADD CONSTRAINT fk_auction_item_2 FOREIGN KEY (state_code)
       REFERENCES AUCTION.state_code (state_code)
       VALIDATE;
ALTER TABLE auction_item
   ADD CONSTRAINT fk_auction_item_3 FOREIGN KEY (category_id)
       REFERENCES AUCTION.category (category_id)
       VALIDATE;
ALTER TABLE auction_item
   MODIFY auction_id CONSTRAINT sys_c007056 NOT NULL VALIDATE;
ALTER TABLE auction_item
   MODIFY auctioneer_id CONSTRAINT sys_c007057 NOT NULL VALIDATE;
ALTER TABLE auction_item
   MODIFY item_name CONSTRAINT sys_c007058 NOT NULL VALIDATE;
ALTER TABLE auction_item
   MODIFY item_content CONSTRAINT sys_c007059 NOT NULL VALIDATE;
ALTER TABLE auction_item
   MODIFY start_date CONSTRAINT sys_c007060 NOT NULL VALIDATE;
ALTER TABLE auction_item
   MODIFY end_date CONSTRAINT sys_c007061 NOT NULL VALIDATE;
ALTER TABLE auction_item
   MODIFY current_bid_amount CONSTRAINT sys_c007063 NOT NULL VALIDATE;
ALTER TABLE auction_item
   MODIFY auction_hit CONSTRAINT sys_c007064 NOT NULL VALIDATE;
ALTER TABLE auction_item
   MODIFY category_id CONSTRAINT sys_c007065 NOT NULL VALIDATE;
ALTER TABLE auction_item
   MODIFY picture_location CONSTRAINT sys_c007067 NOT NULL VALIDATE;

ALTER TABLE auction_bid
   ADD CONSTRAINT fk_auction_bid_1 FOREIGN KEY (auction_id)
       REFERENCES AUCTION.auction_item (auction_id)
       VALIDATE;
ALTER TABLE auction_bid
   ADD CONSTRAINT fk_auction_bid_2 FOREIGN KEY (bidder_id)
       REFERENCES AUCTION.auction_user (user_id)
       VALIDATE;
ALTER TABLE auction_bid
   MODIFY bid_id CONSTRAINT sys_c007073 NOT NULL VALIDATE;
ALTER TABLE auction_bid
   MODIFY auction_id CONSTRAINT sys_c007074 NOT NULL VALIDATE;
ALTER TABLE auction_bid
   MODIFY bidder_id CONSTRAINT sys_c007075 NOT NULL VALIDATE;
ALTER TABLE auction_bid
   MODIFY bidding_date CONSTRAINT sys_c007076 NOT NULL VALIDATE;
ALTER TABLE auction_bid
   MODIFY bid_amount CONSTRAINT sys_c007077 NOT NULL VALIDATE;


-- 트리거 설정
CREATE OR REPLACE TRIGGER TR_AUCTION_BID
   BEFORE INSERT
   ON "AUCTION"."AUCTION_BID"
   FOR EACH ROW
BEGIN
   IF INSERTING
   THEN
      IF :NEW."BID_ID" IS NULL
      THEN
         SELECT AUCTION_BID_SEQ.NEXTVAL INTO :NEW."BID_ID" FROM DUAL;
      END IF;
   END IF;
END;

CREATE OR REPLACE TRIGGER TR_AUCTION_BOARD
   BEFORE INSERT
   ON "AUCTION"."AUCTION_BOARD"
   FOR EACH ROW
BEGIN
   IF INSERTING
   THEN
      IF :NEW."BOARD_ID" IS NULL
      THEN
         SELECT AUCTION_BOARD_SEQ.NEXTVAL INTO :NEW."BOARD_ID" FROM DUAL;
      END IF;
   END IF;

   IF INSERTING
   THEN
      IF :NEW."BOARD_GROUP" IS NULL
      THEN
         SELECT AUCTION_BOARD_SEQ.CURRVAL INTO :NEW."BOARD_GROUP" FROM DUAL;
      END IF;
   END IF;
END;

CREATE OR REPLACE TRIGGER TR_AUCTION_ITEM
   BEFORE INSERT
   ON "AUCTION"."AUCTION_ITEM"
   FOR EACH ROW
BEGIN
   IF INSERTING
   THEN
      IF :NEW."AUCTION_ID" IS NULL
      THEN
         SELECT AUCTION_ITEM_SEQ.NEXTVAL INTO :NEW."AUCTION_ID" FROM DUAL;
      END IF;
   END IF;
END;

CREATE OR REPLACE TRIGGER TR_AUTION_USER
   BEFORE INSERT
   ON "AUCTION"."AUCTION_USER"
   FOR EACH ROW
BEGIN
   IF INSERTING
   THEN
      IF :NEW."USER_ID" IS NULL
      THEN
         SELECT AUCTION_USER_SEQ.NEXTVAL INTO :NEW."USER_ID" FROM DUAL;
      END IF;
   END IF;
END;

CREATE OR REPLACE TRIGGER TR_CATEGORY
   BEFORE INSERT
   ON "AUCTION"."CATEGORY"
   FOR EACH ROW
BEGIN
   IF INSERTING
   THEN
      IF :NEW."CATEGORY_ID" IS NULL
      THEN
         SELECT CATEGORY_SEQ.NEXTVAL INTO :NEW."CATEGORY_ID" FROM DUAL;
      END IF;
   END IF;
END;

CREATE OR REPLACE TRIGGER TR_USER_MESSAGE
   BEFORE INSERT
   ON "AUCTION"."USER_MESSAGE"
   FOR EACH ROW
BEGIN
   IF INSERTING
   THEN
      IF :NEW."MESSAGE_ID" IS NULL
      THEN
         SELECT USER_MESSAGE_SEQ.NEXTVAL INTO :NEW."MESSAGE_ID" FROM DUAL;
      END IF;
   END IF;
END;

CREATE OR REPLACE TRIGGER TR_USER_PAYMENT
   BEFORE INSERT
   ON "AUCTION"."USER_PAYMENT"
   FOR EACH ROW
BEGIN
   IF INSERTING
   THEN
      IF :NEW."CARD_ID" IS NULL
      THEN
         SELECT USER_PAYMENT_SEQ.NEXTVAL INTO :NEW."CARD_ID" FROM DUAL;
      END IF;
   END IF;
END;



-- 기본 더미데이터 생성


-- 1) 카테고리 추가
insert into category (category_name, parent_category_id) values ('electronics', null);
insert into category (category_name, parent_category_id) values ('phone', 1);
insert into category (category_name, parent_category_id) values ('laptop', 1);
insert into category (category_name, parent_category_id) values ('desktop', 1);
select * from category;

-- 2) 상태 코드 추가
insert into state_code (state_code, state_name) values ('1', '판매중');

select * from state_code;

-- 3) 권한 코드 추가
insert into auth_code (auth, auth_name) values ('0', 'administrator');
insert into auth_code (auth, auth_name) values ('1', 'bidder');
insert into auth_code (auth, auth_name) values ('2', 'auctioneer');

select * from auth_code;

-- 4) 유저 추가
insert into auction_user (user_name, email, password) 
  values ('아이언맨', 'ironman@marble.com', '1111');
  
insert into auction_user (user_name, email, password) 
  values ('스파이더맨', 'spiderman@marble.com', '1111');

insert into auction_user (user_name, email, password) 
  values ('원더우먼', 'wonderwoman@dc.com', '1111');

-- 5) 판매자 등록
select * from auction_user;

insert into auctioneer_info (auctioneer_id, bank_name, account_name, account_number)
  values ('1', '스타', '토니 스타크', '123456789123');
update auction_user
  set auth = 2
  where user_id = 1;

select * from auctioneer_info;

-- 6) 옥션 물품 등록
INSERT INTO auction_item (auctioneer_id,
                          item_name,
                          item_content,
                          end_date,
                          current_bid_amount,
                          category_id,
                          picture_location)
        VALUES (
                  1,
                  'iPhone 7',
                  '애플의 감성의 끝판왕 아이폰 7이 돌아왔다.',
                  SYSDATE + 7,
                  10000,
                  2,
                  'https://images-na.ssl-images-amazon.com/images/I/51b5CupugyL._AC_US218_.jpg');

INSERT INTO auction_item (auctioneer_id,
                          item_name,
                          item_content,
                          end_date,
                          current_bid_amount,
                          category_id,
                          picture_location)
        VALUES (
                  1,
                  'iPhone 7+',
                  '애플의 감성의 끝판왕 더 커진 아이폰 7+가 돌아왔다.',
                  SYSDATE + 7,
                  12000,
                  2,
                  'https://images-na.ssl-images-amazon.com/images/I/41bAcRCjWtL._AC_US218_.jpg');

INSERT INTO auction_item (auctioneer_id,
                          item_name,
                          item_content,
                          end_date,
                          current_bid_amount,
                          category_id,
                          picture_location)
        VALUES (
                  1,
                  'Samsung Galaxy Note 5 SM-N920A 32GB GSM Unlocked Cellphone, Black',
                  '5.7-inch Super AMOLED Capacitive Multi-Touchscreen (stylus pen included)',
                  SYSDATE + 7,
                  23000,
                  2,
                  'https://images-na.ssl-images-amazon.com/images/I/41gRR3m1txL._SX466_.jpg');

INSERT INTO auction_item (auctioneer_id,
                          item_name,
                          item_content,
                          end_date,
                          current_bid_amount,
                          category_id,
                          picture_location)
        VALUES (
                  1,
                  'BlackBerry KEYone GSM Unlocked Android Smartphone (AT&T, T-Mobile) - 4G LTE – 32GB',
                  'Smart keyboard with touch navigation, flick typing for faster predictive text, customizable shortcuts and embedded fingerprint sensor. Nano Sim',
                  SYSDATE + 5,
                  11000,
                  2,
                  'https://images-na.ssl-images-amazon.com/images/I/61LdTUNvj6L._SL1000_.jpg');

INSERT INTO auction_item (auctioneer_id,
                          item_name,
                          item_content,
                          end_date,
                          current_bid_amount,
                          category_id,
                          picture_location)
        VALUES (
                  1,
                  'LG G5 Unlocked Phone, 32 GB Titan (US Warranty)',
                  'Want it tomorrow, June 27:var1 Order within 4 hrs 44 mins and choose One-Day Shipping at checkout. <br/> Details
					Ships from and sold by Amazon.com. Gift-wrap available.',
                  SYSDATE + 3,
                  18000,
                  2,
                  'https://images-na.ssl-images-amazon.com/images/I/818Zf5kC96L._SL1500_.jpg');

INSERT INTO auction_item (auctioneer_id,
                          item_name,
                          item_content,
                          end_date,
                          current_bid_amount,
                          category_id,
                          picture_location)
        VALUES (
                  1,
                  '2016 Acer Aspire 15.6-inch, Intel Celeron Dual-Core Processor up to 2.48GHz, 4GB Memory',
                  '15.6" HD widescreen display; 1366 x 768 HD resolution; <br/> Energy-efficient LED backlight.
Intel Celeron processor N3060;<br/> Intel HD Graphics; Windows 10 operating system;<br/> 4 GB DDR3L SDRAM; 500 GB 5400 rpm Hard Drive<br/>',
                  SYSDATE + 8,
                  255000,
                  3,
                  'https://images-na.ssl-images-amazon.com/images/I/61pTItfW3OL._SL1000_.jpg');

INSERT INTO auction_item (auctioneer_id,
                          item_name,
                          item_content,
                          end_date,
                          current_bid_amount,
                          category_id,
                          picture_location)
        VALUES (
                  1,
                  'Dell Latitude E6430 14.1 Inch High Performance Business Laptop, Intel Dual Core i7 up to 3.6GHz',
                  'This Certified Refurbished product is tested and certified to look and work like new. The refurbishing process includes functionality testing, basic cleaning, inspection, and repackaging. The product ships with all relevant accessories, a minimum 90-day warranty, and may arrive in a generic box. Only select sellers who maintain a high performance bar may offer Certified Refurbished products on Amazon.com',
                  SYSDATE + 5,
                  255000,
                  3,
                  'https://images-na.ssl-images-amazon.com/images/I/61mwc9DAaxL._SL1228_.jpg');

INSERT INTO auction_item (auctioneer_id,
                          item_name,
                          item_content,
                          end_date,
                          current_bid_amount,
                          category_id,
                          picture_location)
        VALUES (
                  1,
                  'CUK ASRock DeskMini 110W Tiny Desktop PC - Intel Core i7-7700, 16GB RAM, 512GB NVMe SSD ',
                  'Processor: Intel Core i7-7700 Quad Core Processor (8MB Cache, 3.6GHz-4.2GHz) 65W <br/> RAM: 16GB DDR4 2133MHz | Hard Drive: 512GB NVMe SSD + 1TB Solid State Hybrid Drive',
                  SYSDATE + 6,
                  305000,
                  4,
                  'https://images-na.ssl-images-amazon.com/images/I/51Yv9G0mBqL.jpg');
				  
commit;				  
				  
SELECT * FROM category;

SELECT * FROM auction_item;







