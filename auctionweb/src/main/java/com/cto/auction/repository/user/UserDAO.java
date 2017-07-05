package com.cto.auction.repository.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.cto.auction.vo.user.User;
import com.cto.auction.vo.bid.Bid;
import com.cto.auction.vo.item.Item;
import com.cto.auction.vo.user.Auctioneer;
import com.cto.auction.vo.user.Payment;

@Repository
public interface UserDAO {

	// 테스트용 코드 삭제해도됨
	public List<User> auctionUserList(User list);

	public User loginCheck(User mem);

	public void signUpProc(User ins);

	public void logout(HttpSession session);

	public User myPageUserInfo(User info);

	public void myPageUserUpdate(User upt);

	public void myPageUserDelete(User del);

	public void myPageLocUpdate(User upt);

	public Payment myPageUserPayment(Payment info);

	public void myPagePayUpdate(Payment upt);

	public void myPagePayInsert(Payment ins);

	public Auctioneer auctioneerAuctioneerInfo(Auctioneer info);

	public void auctioneerAuctioneerUpdate(Auctioneer upt);

	public void auctioneerAuctioneerInsert(Auctioneer ins);

	public void auctioneerAuctioneerAuth(Auctioneer auth);

	
	public List<Item> auctionInfoBidding01(Item item);
	public List<Bid> auctionInfoBidding02(Bid bid);

	public List<Item> auctionInfoWinBid01(Item item);
	public List<Bid> auctionInfoWinBid02(Bid bid);

	public List<Item> auctionInfoLoseBid01(Item item);
	public List<Bid> auctionInfoLoseBid02(Bid bid);
	// 낙찰 데이터부르기(임시)
	public Item winpay1(Item sch);
	public User mem(User sch);
	
	// 낙찰후 포인트 차감 업데이트.
	public void memProc(User sch);
}