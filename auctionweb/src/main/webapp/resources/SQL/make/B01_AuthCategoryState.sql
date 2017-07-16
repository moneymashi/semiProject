 -- 1) 권한
INSERT INTO AUTH_CODE (AUTH, AUTH_NAME)
     VALUES (0, 'administrator');
INSERT INTO AUTH_CODE (AUTH, AUTH_NAME)
     VALUES (1, 'bidder');
INSERT INTO AUTH_CODE (AUTH, AUTH_NAME)
     VALUES (2, 'auctioneer');
INSERT INTO AUTH_CODE (AUTH, AUTH_NAME)
     VALUES (3, 'exiter');

-- 2) 카테고리
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (1, 'Phone', NULL);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (2, 'Laptop', NULL);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (3, 'Desktop', NULL);

INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (101, 'Apple', 1);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (102, 'Samsung', 1);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (103, 'LG', 1);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (104, 'Motorola', 1);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (105, 'Nokia', 1);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (106, 'Blackberry', 1);

INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (201, 'Apple', 2);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (202, 'Acer', 2);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (203, 'HP', 2);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (204, 'Samsung', 2);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (205, 'Sony', 2);

INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (301, 'DIY', 3);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (302, 'Dell', 3);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (303, 'Samsung', 3);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (304, 'LG', 3);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (305, 'Sony', 3);
INSERT INTO CATEGORY (CATEGORY_ID, CATEGORY_NAME, PARENT_CATEGORY_ID)
     VALUES (306, 'Asus', 3);

-- 3) 옥션상태 코드
INSERT INTO STATE_CODE (STATE_CODE, STATE_NAME)
     VALUES (1, 'Bidding');
INSERT INTO STATE_CODE (STATE_CODE, STATE_NAME)
     VALUES (2, 'EndBidSold');
INSERT INTO STATE_CODE (STATE_CODE, STATE_NAME)
     VALUES (3, 'EndBidFail');
INSERT INTO STATE_CODE (STATE_CODE, STATE_NAME)
     VALUES (4, 'CompletePay');
INSERT INTO STATE_CODE (STATE_CODE, STATE_NAME)
     VALUES (5, 'Delivery');
INSERT INTO STATE_CODE (STATE_CODE, STATE_NAME)
     VALUES (6, 'CheckItem');
INSERT INTO STATE_CODE (STATE_CODE, STATE_NAME)
     VALUES (7, 'ReturnItem');
INSERT INTO STATE_CODE (STATE_CODE, STATE_NAME)
     VALUES (8, 'EndDeal');
INSERT INTO STATE_CODE (STATE_CODE, STATE_NAME)
     VALUES (9, 'Error');
	 
COMMIT;
 