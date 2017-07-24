package com.cto.auction.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {
	@RequestMapping("/chat.do")
	public String start(){
		return "chatws";
	}
	
	/*
	 * java 1.8이상 사용가능.
	 * 방법: muz_final 오른클릭 > property > project facet > java version 1.8로 수정.
	 * 
	 * 
	 * 
	 */
	
	
}

