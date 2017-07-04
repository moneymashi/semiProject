package com.cto.auction.vo.user;

public class Auctioneer {

	private Integer auctioneer_id;
	private Integer auctioneer_level;
	private Integer satisfaction;
	private String bank_name;
	private String account_name;
	private Integer account_number;

	public Integer getAuctioneer_id() {
		return auctioneer_id;
	}

	public void setAuctioneer_id(Integer auctioneer_id) {
		this.auctioneer_id = auctioneer_id;
	}

	public Integer getAuctioneer_level() {
		return auctioneer_level;
	}

	public void setAuctioneer_level(Integer auctioneer_level) {
		this.auctioneer_level = auctioneer_level;
	}

	public Integer getSatisfaction() {
		return satisfaction;
	}

	public void setSatisfaction(Integer satisfaction) {
		this.satisfaction = satisfaction;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}

	public Integer getAccount_number() {
		return account_number;
	}

	public void setAccount_number(Integer account_number) {
		this.account_number = account_number;
	}
}
