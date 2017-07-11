package com.cto.auction.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cto.auction.service.MessageService;
import com.cto.auction.vo.Item;
import com.cto.auction.vo.Message;

@Controller
@RequestMapping("/*")
public class MessageController {
	@Autowired(required = false)
	private MessageService service;

	// 메세지함
	@RequestMapping("myPage/message.do")
	public ModelAndView myPageMessage(Message msg, HttpSession session, ModelAndView mav) {
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "myPage/message");
		List<Item> mr = service.messageReceive(msg, session);
		List<Item> ms = service.messageSend(msg, session);
		/*
		 * System.out.println("#####테스트스스스스스 : " + mr.size() + "테스트트트트: "+
		 * ms.size());
		 */
		if (mr.size() != 0) {
			mav.addObject("receiveBox", mr);
		} else {
			mav.addObject("receiveBox", "nothing");
		}
		if (ms.size() != 0) {
			mav.addObject("sendBox", ms);
		} else {
			mav.addObject("sendBox", "nothing");
		}
		return mav;
	}

	// 메세지 보내기
	@RequestMapping("myPage/messageInsert.do")
	public String myPageMessageInsert(Message ins) {
		service.myPageMessageInsert(ins);
		return "redirect:/myPage/message.do";
	}
	
	@RequestMapping("myPage/messageReceiveCheck.do") 
	public ModelAndView myPageMessageReceiveCheck(Message mrc, ModelAndView mav){
		service.myPageMessageReceiveCheck(mrc);
		mav.setViewName("redirect:myPage/message.do");
		return mav;
	}

}
