package com.cto.auction.controller.main;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cto.auction.service.item.ItemService;



@Controller
@RequestMapping("/*")
public class MainController {
	@Autowired(required=false)
	private ItemService itemService;
	
	@RequestMapping("main.do")
	public ModelAndView main(ModelAndView mav) {
		// 최다 조회 물품조회처리
		mav.addObject("highestHit", itemService.highestHit());
		// 최고 입찰금액 조회처리
		mav.addObject("highestBid", itemService.highestBid());
		// 랜덤물품 조회처리
		mav.addObject("randomOne", itemService.randomOne());
		mav.setViewName("main/main");
		return mav;
	}
	@RequestMapping("menuHome.do")
	public ModelAndView mainMenuList(ModelAndView mav){
		mav.setViewName("menu/menuHome");
		mav.addObject("pageName", "menuHome");
		return mav;
	}
	
	//공지 및 문의 가기
	@RequestMapping("notice/notice.do")
	public ModelAndView noticeNotice(ModelAndView mav){
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "notice/notice");
		return mav;
	}
	
	//판매자 전환하기
	@RequestMapping("auctioneerPage/auctioneerAuth.do")
	public ModelAndView auctioneerAuctioneerInfo(ModelAndView mav) {
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "auctioneerPage/auctioneerInfo");
		return mav;
	}
	
	
	@RequestMapping("menuPageLoc.do")
	public ModelAndView pageLoc(@RequestParam("pl") String pl,ModelAndView mav){
		mav.setViewName("menu/menu");
		mav.addObject("pageName",pl);
		return mav;
	}
/*	// 아이템 리스트
	@RequestMapping("item.do")
	public ModelAndView itemList(ModelAndView mav, Model m, HttpSession session){
		// view화면에서 item값이 list면 아이템 목록이 나옴
		m.addAttribute("item", "list");
		mav.addObject("itemList", service.itemList());
		mav.setViewName("main/main");
		return mav;
	}*/
	

	
}
