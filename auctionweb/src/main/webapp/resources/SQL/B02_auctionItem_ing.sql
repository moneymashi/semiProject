SELECT * FROM AUCTION_BID;
SELECT * FROM AUCTION_ITEM;
SELECT * FROM AUCTION_USER;

INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 1,
                 'CUK ASRock DeskMini 110W Tiny Desktop PC - Intel Core i7-7700, 16GB RAM, 512GB NVMe SSD ',
                  'Processor: Intel Core i7-7700 Quad Core Processor (8MB Cache, 3.6GHz-4.2GHz) 65W <br/> RAM: 16GB DDR4 2133MHz | Hard Drive: 512GB NVMe SSD + 1TB Solid State Hybrid Drive',
                  SYSDATE - 10, SYSDATE - 1,
                  5000,
                  101,
                  'https://images-na.ssl-images-amazon.com/images/I/51Yv9G0mBqL.jpg');
