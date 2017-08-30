package com.cto.auction.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cto.auction.service.CalendarService;
import com.cto.auction.vo.Calendar;

@Controller
@RequestMapping("/calendar.do")
public class CalendarController {
	
	@Autowired(required=false)
	private CalendarService service;
	// http://localhost:6380/auction/calendar.do?method=init
	@RequestMapping(params="method=init")
	public String start(){	
//		return "/i02_calen_jsp/a01_calendar";
		return "/menu/a02_calTest";
	}
	// http://localhost:6380/auction/calendar.do?method=list
	@RequestMapping(params="method=list")
	public ModelAndView ajaxlist(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pageJsonReport");
		mav.addObject("list", service.list());
		System.out.println("########## service.list()" + service.list().size());
		for(Calendar item : service.list()){
			System.out.println("########## title()" + item.getTitle() );
		}
		return mav;
	}
	@RequestMapping(params="method=example")
	public String myCalendar(){
		return "/menu/myCalendar";
	}
}
