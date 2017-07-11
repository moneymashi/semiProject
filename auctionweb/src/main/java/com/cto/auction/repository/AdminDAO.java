package com.cto.auction.repository;

import java.util.List;


import org.springframework.stereotype.Repository;

import com.cto.auction.vo.Auctioneer;
import com.cto.auction.vo.Message;
import com.cto.auction.vo.Payment;
import com.cto.auction.vo.User;

@Repository
public interface AdminDAO {

	// 테스트용 코드 삭제해도됨
	public List<User> adminSearchList(User list);
	
	public List<User> userAList(User list);
	public List<Payment> paymentAList(Payment pay);
	public List<Auctioneer> auctioneerAList(Auctioneer acnr);
	public List<Message> message1AList(Message msg);
	public List<Message> message2AList(Message msg2);
}