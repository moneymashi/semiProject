package com.cto.auction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/*")
public class MainController {
	@Autowired(required=false)
	
	@RequestMapping("menuHome.do")
	public ModelAndView mainMenuList(ModelAndView mav){
		mav.setViewName("menu/menuHome");
		mav.addObject("pageName", "menuHome");
		return mav;
	}
	
/*	@RequestMapping("menuPageLoc.do")
	public ModelAndView pageLoc(@RequestParam("pl") String pl,ModelAndView mav){
		mav.setViewName("menu/menu");
		mav.addObject("pageName",pl);
		return mav;
	}*/
	
}
