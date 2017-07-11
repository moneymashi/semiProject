package com.cto.auction.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cto.auction.repository.MessageDAO;
import com.cto.auction.vo.Item;
import com.cto.auction.vo.Message;

@Service
public class MessageService {
	@Autowired(required = false)
	private MessageDAO dao;
	
	public List<Item> messageReceive(Message msg, HttpSession session) {
		msg.setReceiver_id((Integer)session.getAttribute("sessionUser_id"));
		return dao.messageReceive(msg);
	}
	public List<Item> messageSend(Message msg, HttpSession session) {
		msg.setSender_id((Integer)session.getAttribute("sessionUser_id"));
		return dao.messageSend(msg);
	}
	public void myPageMessageInsert(Message ins) {
		dao.myPageMessageInsert(ins);
	}
	public void myPageMessageReceiveCheck(Message mrc, Integer mid) {
		mrc.setMessage_id(mid);
		dao.myPageMessageReceiveCheck(mrc);
	}
}
