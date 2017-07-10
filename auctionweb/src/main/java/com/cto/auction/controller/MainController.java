package com.cto.auction.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cto.auction.service.UserService;
import com.cto.auction.vo.User;



@Controller
@RequestMapping("/*")
public class MainController {
	@Autowired(required=false)
	private UserService userService;
	
	@RequestMapping("menuHome.do")
	public ModelAndView mainMenuList(ModelAndView mav){
		mav.setViewName("menu/menuHome");
		mav.addObject("pageName", "menuHome");
		return mav;
	}
	
	/*//공지 및 문의 가기
	@RequestMapping("notice/notice.do")
	public ModelAndView noticeNotice(ModelAndView mav){
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "notice/notice");
		return mav;
	}
	
	// 문의하기로 넘어가기
	@RequestMapping("notice/qna.do")
	public ModelAndView noticeQna(ModelAndView mav){
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "notice/qna");
		return mav;
	}*/
	
	@RequestMapping("menuPageLoc.do")
	public ModelAndView pageLoc(@RequestParam("pl") String pl,ModelAndView mav){
		mav.setViewName("menu/menu");
		mav.addObject("pageName",pl);
		return mav;
	}
	
}
