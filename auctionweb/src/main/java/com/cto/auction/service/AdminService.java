package com.cto.auction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cto.auction.repository.AdminDAO;
import com.cto.auction.vo.Auctioneer;
import com.cto.auction.vo.Message;
import com.cto.auction.vo.Payment;
import com.cto.auction.vo.User;

@Service
public class AdminService {
	@Autowired(required = false)
	private AdminDAO dao;

	public List<User> userAList(User user) {
		return dao.userAList(user);
	}
	public List<Payment> paymentAList(Payment pay) {
		return dao.paymentAList(pay);
	}
	public List<Auctioneer> auctioneerAList(Auctioneer acnr) {
		return dao.auctioneerAList(acnr);
	}
	public List<Message> message1AList(Message msg) {
		return dao.message1AList(msg);
	}
	public List<Message> message2AList(Message msg) {
		return dao.message2AList(msg);
	}
		
}
