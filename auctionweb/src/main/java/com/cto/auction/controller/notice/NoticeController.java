package com.cto.auction.controller.notice;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cto.auction.service.notice.NoticeService;

import com.cto.auction.vo.board.BoardPage;
import com.cto.auction.vo.notice.Notice;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	@Autowired(required=false)
	private NoticeService service;
	
	// 리스트
	@RequestMapping("list.do")
	public ModelAndView noticeList(@RequestParam(defaultValue="1") int curPage){
		int count = service.countNotice();
		BoardPage boardPage = new BoardPage(count, curPage);
		int start = boardPage.getPageBegin();
		int end = boardPage.getPageEnd();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList", service.noticeList(start, end));
		map.put("boardPage", boardPage);
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);
		mav.setViewName("notice/notice");
		return mav;
	}
	
	// 글쓰기화면
	@RequestMapping("insert.do")
	public String insert(){
		return "notice/noticeInsert";
	}
	
	// 글쓰기 로직
	@RequestMapping("insertProc.do")
	public String insertProc(@ModelAttribute Notice ins){
		service.insertNotice(ins);
		return "redirect:list.do";
	}
	
	// 수정화면
	@RequestMapping("update.do")
	public ModelAndView update(@RequestParam int notice_id){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("notice/noticeUpdate");
		mav.addObject("upt", service.readNotice(notice_id));
		return mav;
	}
	
	// 실제 수정 처리
	@RequestMapping("updateProc.do")
	public String updateProc(@ModelAttribute Notice upt){
		service.updateNotice(upt);
		// view화면은 item/item
		return "redirect:list.do";
	}	
	
	// 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int notice_id){
		service.delete(notice_id);
		// view화면은 item/item
		return "redirect:list.do";
	}
}
