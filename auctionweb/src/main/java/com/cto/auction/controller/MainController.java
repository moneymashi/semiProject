package com.cto.auction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cto.auction.service.AdminService;
import com.cto.auction.vo.Auctioneer;
import com.cto.auction.vo.Message;
import com.cto.auction.vo.Payment;
import com.cto.auction.vo.User;

@Controller
@RequestMapping("/*")
public class MainController {
	@Autowired(required=false)
	private AdminService service;
	
	@RequestMapping("menuHome.do")
	public ModelAndView mainMenuList(ModelAndView mav){
		mav.setViewName("menu/menuHome");
		mav.addObject("pageName", "menuHome");
		return mav;
	}
	/*@ModelAttribute("adminSearch")*/
	@RequestMapping("whyNot.do")
	public String adminSearchList(
		@ModelAttribute("AUCTION_USER") User user,
		@ModelAttribute("USER_PAYMENT") Payment pay,
		@ModelAttribute("AUCTIONEER_INFO") Auctioneer acnr,
		@ModelAttribute("USER_MESSAGE1") Message msg,
		@ModelAttribute("USER_MESSAGE2") Message msg2,
		Model m) {
/*		m.addAttribute("adminSearchList", service.userAList(user));
		m.addAttribute("adminSearchList", service.paymentAList(pay,schId));
		m.addAttribute("adminSearchList", service.auctioneerAList(acnr,schId));
		m.addAttribute("adminSearchList", service.message1AList(msg,schId));
		m.addAttribute("adminSearchList", service.message2AList(msg,schId));*/
		m.addAttribute("auction_user", service.userAList(user));
		m.addAttribute("user_payment", service.paymentAList(pay));
		m.addAttribute("auctioneer_info", service.auctioneerAList(acnr));
		m.addAttribute("user_message1", service.message1AList(msg));
		m.addAttribute("user_message2", service.message2AList(msg2));
		return "main/adminList";
	}
}
