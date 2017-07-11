package com.cto.auction.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cto.auction.vo.Item;
import com.cto.auction.vo.Message;

@Repository
public interface MessageDAO{
	public void myPageMessageInsert(Message ins);
	public List<Item> messageReceive(Message msg);
	public List<Item> messageSend(Message msg);
	public void myPageMessageReceiveCheck(Message ins);

}
