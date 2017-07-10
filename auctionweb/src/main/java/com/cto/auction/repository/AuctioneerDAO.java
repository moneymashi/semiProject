package com.cto.auction.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cto.auction.vo.Auctioneer;
import com.cto.auction.vo.Item;

@Repository
public interface AuctioneerDAO {
	public Auctioneer auctioneerAuctioneerInfo(Auctioneer info);

	public void auctioneerAuctioneerUpdate(Auctioneer upt);

	public void auctioneerAuctioneerAuth(Auctioneer auth);
	public void auctioneerAuctioneerInsert(Auctioneer ins);
	
	public List<Item> saleInfoBidding01(Item item);
	public List<Item> saleInfoWinBid01(Item item);
	public List<Item> saleInfoLoseBid01(Item item);
}
