package com.cto.auction.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cto.auction.repository.AuctioneerDAO;
import com.cto.auction.vo.Auctioneer;
import com.cto.auction.vo.Item;

@Service
public class AuctioneerService {
	@Autowired(required = false)
	private AuctioneerDAO dao;
	
	public Auctioneer auctioneerAuctioneerInfo(Auctioneer info, HttpSession session) {
		info.setAuctioneer_id((Integer) session.getAttribute("sessionUser_id"));
		return dao.auctioneerAuctioneerInfo(info);
	}
	public void auctioneerAuctioneerUpdate(Auctioneer upt) {
		dao.auctioneerAuctioneerUpdate(upt);
	}
	public void auctioneerAuctioneerInsert(Auctioneer ins) {
		dao.auctioneerAuctioneerInsert(ins);
		dao.auctioneerAuctioneerAuth(ins);
	}
	public List<Item> saleInfoBidding01(Item item, HttpSession session) {
		item.setAuctioneer_id((Integer)session.getAttribute("sessionUser_id"));
		return dao.saleInfoBidding01(item);
	}
	public List<Item> saleInfoWinBid01(Item item, HttpSession session) {
		item.setAuctioneer_id((Integer)session.getAttribute("sessionUser_id"));
		return dao.saleInfoWinBid01(item);
	}
	public List<Item> saleInfoLoseBid01(Item item, HttpSession session) {
		item.setAuctioneer_id((Integer)session.getAttribute("sessionUser_id"));
		return dao.saleInfoLoseBid01(item);
	}

}
