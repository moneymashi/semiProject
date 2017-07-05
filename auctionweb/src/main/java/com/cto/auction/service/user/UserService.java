package com.cto.auction.service.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cto.auction.repository.user.UserDAO;
import com.cto.auction.vo.user.User;
import com.cto.auction.vo.bid.Bid;
import com.cto.auction.vo.item.Item;
import com.cto.auction.vo.user.Auctioneer;
import com.cto.auction.vo.user.Payment;

@Service
public class UserService {
	@Autowired(required = false)
	private UserDAO dao;

	// 테스트용 리스트
	public List<User> auctionUserList(User list) {
		return dao.auctionUserList(list);
	}

	// 로그인 데이터확인
	public User loginCheck(User mem) {
		return dao.loginCheck(mem);
	}

	// 회원가입
	public void signUpProc(User ins) {
		dao.signUpProc(ins);
	}

	// 로그아웃
	public void logout(HttpSession session) {
		session.invalidate();
	}

	// 회원정보페이지
	public User myPageUserInfo(User info, HttpSession session) {
		info.setUser_id((Integer) session.getAttribute("sessionUser_id"));
		return dao.myPageUserInfo(info);
	}
	// 회원정보페이지-수정
	public void myPageUserUpdate(User upt) {
		dao.myPageUserUpdate(upt);
	}
	// 회원정보페이지-삭제
	public void myPageUserDelete(User del, HttpSession session) {
		dao.myPageUserDelete(del);
		session.invalidate();
	}
	public void myPageLocUpdate(User upt) {
		dao.myPageLocUpdate(upt);
	}

	public Payment myPageUserPayment(Payment info, HttpSession session) {
		info.setUser_id((Integer) session.getAttribute("sessionUser_id"));
		return dao.myPageUserPayment(info);
	}
	

	public void myPagePayUpdate(Payment upt) {
		dao.myPagePayUpdate(upt);
	}
	public void myPagePayInsert(Payment upt) {
		dao.myPagePayInsert(upt);
	}

	
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
	
	
	
	
	public List<Item> auctionInfoBidding01(Item item, HttpSession session) {
		item.setUser_id((Integer)session.getAttribute("sessionUser_id"));
		return dao.auctionInfoBidding01(item);
	}
	public List<Bid> auctionInfoBidding02(Bid bid, HttpSession session) {
		bid.setBidder_id((Integer)session.getAttribute("sessionUser_id"));
		return dao.auctionInfoBidding02(bid);
	}
	
	public List<Item> auctionInfoWinBid01(Item item, HttpSession session) {
		item.setUser_id((Integer)session.getAttribute("sessionUser_id"));
		return dao.auctionInfoWinBid01(item);
	}
	public List<Bid> auctionInfoWinBid02(Bid bid, HttpSession session) {
		bid.setBidder_id((Integer)session.getAttribute("sessionUser_id"));
		return dao.auctionInfoWinBid02(bid);
	}
	
	public List<Item> auctionInfoLoseBid01(Item item, HttpSession session) {
		item.setUser_id((Integer)session.getAttribute("sessionUser_id"));
		return dao.auctionInfoLoseBid01(item);
	}
	public List<Bid> auctionInfoLoseBid02(Bid bid, HttpSession session) {
		bid.setBidder_id((Integer)session.getAttribute("sessionUser_id"));
		return dao.auctionInfoLoseBid02(bid);
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
	
	// 낙찰 데이터 부르기(임시)
	public Item winpay1(Item sch){
		return dao.winpay1(sch);
	}
	public User mem(User sch){
		return dao.mem(sch);
	}
	// 낙찰 포인트 차감후 업데이트
	public void memProc(User upt){
		dao.memProc(upt);
	}
		
	
	
	
	
	
	
	
	
}
