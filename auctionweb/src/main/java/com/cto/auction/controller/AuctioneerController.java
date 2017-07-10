package com.cto.auction.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cto.auction.service.AuctioneerService;
import com.cto.auction.service.UserService;
import com.cto.auction.vo.Auctioneer;
import com.cto.auction.vo.Item;
import com.cto.auction.vo.User;


@Controller
@RequestMapping("/*")
public class AuctioneerController {
	@Autowired(required = false)
	private AuctioneerService service;
	private UserService userService;
	
	//판매자 전환하기, 판메자 페이지로 대체 가능
/*	@RequestMapping("auctioneerPage/auctioneerAuth.do")
	public ModelAndView auctioneerAuctioneerInfo(ModelAndView mav) {
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "auctioneerPage/auctioneerInfo");
		return mav;
	}*/

	// 판매자 페이지
	@RequestMapping("auctioneerPage/auctioneerInfo.do")
	public ModelAndView auctioneerAuctioneerInfo(Auctioneer info, HttpSession session, ModelAndView mav) {
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "auctioneerPage/auctioneerInfo");
		mav.addObject("acnrInfo", service.auctioneerAuctioneerInfo(info, session));
		return mav;
	}
	// 판매자 정보 업데이트
	@RequestMapping("auctioneerPage/auctioneerUpdate.do")
	public String auctioneerAuctioneerUpdate(Auctioneer upt) {
		service.auctioneerAuctioneerUpdate(upt);
		return "redirect:/auctioneerPage/auctioneerInfo.do";
	}
	// 판매자 정보 입력
	@RequestMapping("auctioneerPage/auctioneerInsert.do")
	public String auctioneerAuctioneerInsert(Auctioneer ins, User upt, HttpSession session) {
		service.auctioneerAuctioneerInsert(ins);
		//판매자 권한이 user테이블에 있기때문에, 세션 정보(auth) 업데이트위해 아래 코드 실행.
		session.setAttribute("mem", userService.myPageUserInfo(upt, session));
		return "redirect:/auctioneerPage/auctioneerInfo.do";
	}
	// 판매자 판매물품 정보
	@RequestMapping("auctioneerPage/saleInfo.do")
	public ModelAndView auctioneerSaleInfo(Item item, HttpSession session, ModelAndView mav) {
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "auctioneerPage/saleInfo");
		List<Item> aib3 = service.saleInfoBidding01(item, session);
		List<Item> aiw3 = service.saleInfoWinBid01(item, session);
		List<Item> ail3 = service.saleInfoLoseBid01(item, session);
		if (aib3.size() != 0) { 
			mav.addObject("bidding1", aib3);
		} else {
			mav.addObject("biddingMsg", "nothing");
		}
		if (aiw3.size() != 0) { 
			mav.addObject("winBid1", aiw3);
		} else {
			mav.addObject("winBidMsg", "nothing");
		}
		if (ail3.size() != 0) { 
			mav.addObject("loseBid1", ail3);
		} else {
			mav.addObject("loseBidMsg", "nothing");
		}
		return mav;
	}
	
}
