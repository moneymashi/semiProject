/*CREATE TABLE AUCTION_BID
(
   BID_ID         NUMBER (10),
   AUCTION_ID     NUMBER (10),
   BIDDER_ID      NUMBER (10),
   BIDDING_DATE   DATE DEFAULT SYSDATE,
   BID_AMOUNT     NUMBER (10)
)
NOCACHE
LOGGING;*/
package com.cto.auction.vo;

import java.util.Date;

public class Bid {
	private int bid_id;
	private int auction_id;
	private int bidder_id;
	private Date bidding_date;
	private int bid_amount;
	public int getBid_id() {
		return bid_id;
	}
	public void setBid_id(int bid_id) {
		this.bid_id = bid_id;
	}
	public int getAuction_id() {
		return auction_id;
	}
	public void setAuction_id(int auction_id) {
		this.auction_id = auction_id;
	}
	public int getBidder_id() {
		return bidder_id;
	}
	public void setBidder_id(int bidder_id) {
		this.bidder_id = bidder_id;
	}
	public Date getBidding_date() {
		return bidding_date;
	}
	public void setBidding_date(Date bidding_date) {
		this.bidding_date = bidding_date;
	}
	public int getBid_amount() {
		return bid_amount;
	}
	public void setBid_amount(int bid_amount) {
		this.bid_amount = bid_amount;
	}
	
}
