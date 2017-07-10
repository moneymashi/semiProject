SELECT * FROM AUCTION_BID;
SELECT * FROM AUCTION_ITEM;
SELECT * FROM AUCTION_USER;

--phone				  
INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BIDDER_ID, CURRENT_BIDDER, CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 1,
                 'iPhone 7',
                  '애플의 감성의 끝판왕 아이폰 7이 돌아왔다. ',
                  (SYSDATE - 10), (SYSDATE - 1),
				  NULL,
				  NULL,
                  392,
                  101,
                  'phone01.png');
				  
INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BIDDER_ID, CURRENT_BIDDER, CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 1,
                 'iPhone 7+',
                  '애플의 감성의 끝판왕 더 커진 아이폰 7+가 돌아왔다.',
                  (SYSDATE - 10), (SYSDATE - 1),
				  2,
				  'dumy',
                  412,
                  101,
                  'phone02.png');
				  
INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BIDDER_ID, CURRENT_BIDDER, CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 1,
                 'Samsung Galaxy Note 5 SM-N920A 32GB GSM Unlocked Cellphone, Black',
                  '5.7-inch Super AMOLED Capacitive Multi-Touchscreen (stylus pen included)',
                  (SYSDATE - 10), (SYSDATE - 1),
				  3,
				  'dumy',
                  333,
                  102,
                  'phone03.png');
				  
INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BIDDER_ID, CURRENT_BIDDER, CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 1,
                 'BlackBerry KEYone GSM Unlocked Android Smartphone (AT&T, T-Mobile) - 4G LTE – 32GB',
                  'Smart keyboard with touch navigation, flick typing for faster predictive text, customizable shortcuts and embedded fingerprint sensor. Nano Sim',
                  (SYSDATE - 10), (SYSDATE - 1),
				  2,
				  'dumy',
                  227,
                  106,
                  'phone04.png');
				  
INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BIDDER_ID, CURRENT_BIDDER, CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 1,
                 'LG G5 Unlocked Phone, 32 GB Titan (US Warranty)',
                  'Want it tomorrow, June 27:var1 Order within 4 hrs 44 mins and choose One-Day Shipping at checkout. <br/>
				   Details Ships from and sold by Amazon.com. Gift-wrap available.',
                  (SYSDATE - 10), (SYSDATE - 1),
				  3,
				  'dumy',
                  372,
                  103,
                  'phone05.png');

--Desktop
INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BIDDER_ID, CURRENT_BIDDER, CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 3,
                 'Samsung ArtPC PULSE Desktop 1TB SSD 32GB RAM EXTREME PC Computer DP700C6A', 
                  'Intel Core i7-6700K at 4.00GHz with TURBO BOOST to 4.20GHz (EXTREME-power processor)
				  <br/>32 GB of RAM (ULTRA performance); AMD Radeon RX 460 w/2GB dedicated & up to 8GB total video RAM
				  <br/>1TB SSD M.2 Drive (speed: 2500 MB/s !!!); HDMI out, type C 4K UHD display port
				  <br/>Built-in 360 Omni-Directional Speaker by Harmon Kardon
				  <br/>AC8260 Wireless 802.11AC, Bluetooth 4.1, Gigabit Ethernet RJ45, 4 x USB 3.0 + 1 x USB-C, 3-in-1 card slot, Headphone/Mic combo in&out, wireless keyboard/mouse',
                  (SYSDATE - 10.1), (SYSDATE - 1.1),
				  1,
				  '유반장',
                  2012,
                  303,
                  'desktop01.png');
				  
INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BIDDER_ID, CURRENT_BIDDER, CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 3,
                 'Samsung AMD 2.2GHz 4GB RAM Thin Client TC222W',
                  'Processor / Clock Speed: 2.2 GHz
				  <br/>RAM / Total Installed Size: 4 GB ',
                  (SYSDATE - 9.2), (SYSDATE - 3.2),
				  2,
				  'dumy',
                  431,
                  303,
                  'desktop02.png');
				  
INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BIDDER_ID, CURRENT_BIDDER, CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 3,
                 'Dell Optiplex 9010 Business Desktop Computer',
                  'Processor: Intel Quad Core i7-3770 3.4 GHz (Max Turbo 3.90 Ghz, 8 MB SmartCache), 8GB DDR3 RAM, 500GB SATA Hard Drive
				  <br/>Integrated Intel HD Graphics, DVD-ROM, Ethernet LAN 10/100/1000, USB WIFI adapter 802.11b/g/n
				  <br/>4 External USB 3.0 ports (2 front; 2 rear) 6 External USB 2.0 ports (2 front; 4 rear) 2 Internal USB 2.0; 1 RJ-45; 1 Serial; 1 VGA; 2 DisplayPort; 2 PS/2; 2 Line-in ',
                  (SYSDATE - 8.3), (SYSDATE - 3.3),
				  2,
				  'dumy',
                  399,
                  302,
                  'desktop03.png');

INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BIDDER_ID, CURRENT_BIDDER, CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 3,
                 'Dell OptiPlex Desktop Complete Computer Package',
                  '17" LCD Monitor (brands vary). Dell OptiPlex Desktop Complete Computer Package with Windows Pro 32-Bit - Keyboard, Mouse.
				  <br/>Microsoft has discontinued mainstream support for Windows 7, this product may arrive upgraded to Windows 10 Professional (64-bit).
				  <br/>What is Inside: Intel Pentium D 2.6 GHz. DVD-ROM Optical Drive. Ready to use right out of the box.
				  <br/>What is Inside: 2 GB of Memory and a 80 GB Hard Drive. Pro Tip: Hard drive size has nothing to do with the speed of the machine.
				  ',
                  (SYSDATE - 4.1), (SYSDATE - 1.1),
				  NULL,
				  NULL,
                  139,
                  302,
                  'desktop04.png');

INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BIDDER_ID, CURRENT_BIDDER, CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 3,
                 'Apple iMac MK482LL/A Retina 5K Display Desktop Computer AppleCare Bundle',
                  'Apple Certified Pre Owned iMac Desktop Computer with 5K Retina Display - The Ultimate All-In-One now with the Ultimate Display + 2 Year AppleCare Plan
				  <br/>2 TB Fusion Drive - Quad Core Processor
				  <br/>Thunderbolt 2, delivering twice the bandwidth - up to 20 Gbps - for fast data transfers
				  <br/>AMD Radeon R9 M395 - Front Facing Camera for FaceTime HD Calls
				  <br/>Kit Includes Apple Magic KeyBoard + Apple Magic Mouse II + eDig Stylus Pen + eDigitalUSA Brush Blower, Cleaning Kit & Microfiber Cleaning Cloth
				  ',
                  (SYSDATE - 3.2), (SYSDATE + 2.2),
				  2,
				  'dumy',
                  1899,
                  302,
                  'desktop05.png');

INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BIDDER_ID, CURRENT_BIDDER, CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 3,
                 'CUK ASRock DeskMini 110W Tiny Desktop PC - Intel Core i7-7700, 16GB RAM, 512GB NVMe SSD',
                  'Processor: Intel Core i7-7700 Quad Core Processor (8MB Cache, 3.6GHz-4.2GHz) 65W <br/> RAM: 16GB DDR4 2133MHz | Hard Drive: 512GB NVMe SSD + 1TB Solid State Hybrid Drive',
                  (SYSDATE - 1.3), (SYSDATE + 1),
				  2,
				  'dumy',
                  1899,
                  306,
                  'desktop06.png');
				  			  
--laptop
INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BIDDER_ID, CURRENT_BIDDER, CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 2,
                 'Apple MacBook MMGL2LL/A 12-Inch Laptop with Retina Display Rose Gold, 256 GB',
                  '12.0-inch TFT LED-backlit Active-Matrix Retina Display with IPS Technology, 2304 x 1440 pixel resolution (~226ppi pixel density)
				  <br/>Intel Core M 1.1 GHz, Mac OX X 10.10 Yosemite, Intel HD Graphic 5300
				  <br/>Wireless LAN 802.11a/b/g/n/ac; Bluetooth: v4.0; Ports: USB v3.1 x1 (Gen 2 Type-C), Display Port x1, Audio Port x1
				  <br/>78-Key Full Size Keyboard, Multi-touch Gestures, Force Touch Trackpad
				  <br/>Built-in 39.7 watt-hour lithium-polymer battery - Up to 9 hours of wireless wed usag. Please refer the User Manual before use.
				  <br/>1.1 GHz Dual-Core Intel Core M3 Processor (Turbo Boost up to 2.2 GHz) with 4 MB shared L3 cache
				  <br/>8 GB of 1866 MHz LPDDR3 RAM; 256 GB PCIe-based onboard flash storage
				  ',
                  (SYSDATE - 6.5), (SYSDATE - 0.5),
				  2,
				  'dumy',
                  1199,
                  201,
                  'laptop01.png');
				  
INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BIDDER_ID, CURRENT_BIDDER, CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 2,
                 '2017 NEW HP Envy 17.3 IPS Full HD High Performance Premium Laptop',
                  '17.3-inch WLED-backlit Full HD (1920x1080) IPS Display with Intel HD 530 Graphics
				  <br/>6th Generation Skylake Intel Quad-Core i7-6700HQ Processor 2.6GHz with a Max Turbo Speed of 3.5GHz
				  <br/>8GB DDR3L RAM; 1TB 7200RPM SATA Hard Drive; Backlit Keyboard; HP TrueVision HD Webcam + Integrated Digital Microphones; Intel Wireless-AC WLAN + Bluetooth
				  <br/>2x USB 3.0; 1x USB 2.0; 1x HDMI; 1x RJ-45; 1x Media ;Card Reader 1x Combination Headphone-Out/ Microphone-In Jack
				  <br/>Windows 10 64-bit Operating System; 4-cell 41WHr Lithium-ion Battery
				  ',
                  (SYSDATE - 2.1), (SYSDATE + 2.1),
				  2,
				  'dumy',
                  779,
                  203,
                  'laptop02.png');

INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BIDDER_ID, CURRENT_BIDDER, CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 2,
                 '2016 Acer Aspire 15.6-inch, Intel Celeron Dual-Core Processor up to 2.48GHz, 4GB Memory',
                  '15.6" HD widescreen display; 1366 x 768 HD resolution; <br/>
				   Energy-efficient LED backlight.Intel Celeron processor N3060;<br/>
				   Intel HD Graphics; Windows 10 operating system;<br/>
				    4 GB DDR3L SDRAM; 500 GB 5400 rpm Hard Drive<br/>',
                  (SYSDATE - 1.2), (SYSDATE + 3.2),
				  2,
				  'dumy',
                  701,
                  202,
                  'laptop03.png');

INSERT INTO AUCTION_ITEM (AUCTIONEER_ID, ITEM_NAME, ITEM_CONTENT,START_DATE, END_DATE,
						 CURRENT_BIDDER_ID, CURRENT_BIDDER, CURRENT_BID_AMOUNT, CATEGORY_ID, PICTURE_LOCATION)
        VALUES ( 2,
                 'Dell Latitude E6430 14.1 Inch High Performance Business Laptop, Intel Dual Core i7 up to 3.6GHz',
                  'This Certified Refurbished product is tested and certified to look and work like new. The refurbishing process includes functionality testing, basic cleaning, inspection, and repackaging. The product ships with all relevant accessories, a minimum 90-day warranty, and may arrive in a generic box. Only select sellers who maintain a high performance bar may offer Certified Refurbished products on Amazon.com',
                  (SYSDATE - 0.3), (SYSDATE - 5.3),
				  NULL,
				  NULL,
                  701,
                  203,
                  'laptop04.png');
				  
