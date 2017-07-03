package com.cto.auction.controller.item;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cto.auction.service.item.ItemService;
import com.cto.auction.vo.item.Item;
import com.cto.auction.vo.item.Item_Sch;

@Controller
@RequestMapping("/*")
public class ItemController {
	
	@Autowired(required=false)
	private ItemService service;
	
//	// 아이템 리스트
//	@RequestMapping("search.do")
//	public ModelAndView itemList(
//			@ModelAttribute("itemSch") Item_Sch sch,
//			ModelAndView mav, Model m, HttpSession session){
//		// view화면에서 item값이 list면 아이템 목록이 나옴
//		m.addAttribute("item", "list");
//		mav.addObject("itemList", service.searchLists(sch));
//		mav.setViewName("main/search");
//		return mav;
//	}
//	
	
	@RequestMapping("main.do")  
	public String main(
			Model d
			){
		// 최다 조회 물품조회처리
		d.addAttribute("highestHit", service.highestHit() );
		// 최고 입찰금액 조회처리
		d.addAttribute("highestBid", service.highestBid() );
		// 랜덤물품 조회처리
		d.addAttribute("randomOne", service.randomOne() );
		
		return "main/main";
	}
	
	
	@RequestMapping("search.do")
	public String searchLists(
			@ModelAttribute("itemSch") Item_Sch sch,
			Model d){
		//테스트용 - 페이지2에서 필터적용하면 500 에러. 문제원인 파악용.
		System.out.println("############ ");
		System.out.println("############ "  );
//		private String priceOrder;  // 입찰가격 order by.  
//		private String userStartDate;  // 구매자가 조회하고싶은 최소 입찰기간
//		private String userEndDate; // 구매자가 조회하고싶은 최대 입찰기간
//		private String endDateOrder; // 입찰마감기간 order by
//		private String aucStatus; // 입찰상태
//		private String minCurrentBidPrice;  // minCurrentBidPrice 유저 최소입찰가격 필터
//		private String maxCurrentBidPrice;  // maxCurrentBidPrice 유저 최대입찰가격 필터
		
		System.out.println("############ priceOrder ::  " + sch.getPriceOrder() );
		System.out.println("############ userStartDate ::  " + sch.getUserStartDate() );
		System.out.println("############ userEndDate ::  " + sch.getUserEndDate() );
		System.out.println("############ endDateOrder ::  " + sch.getEndDateOrder() );
		System.out.println("############ aucStatus ::  " + sch.getAucStatus() );
		System.out.println("############ minCurrentBidPrice  " + sch.getMinCurrentBidPrice() );
		System.out.println("############ maxCurrentBidPrice ::  " + sch.getMaxCurrentBidPrice() );
		System.out.println("############ " );
		System.out.println("############ " );
		
		// main/search.jsp참고. items는 ArrayList<Item> 형태,  Model d.addAttribute로 보내줌..
		d.addAttribute("itemList", service.searchLists(sch));
		
		//결과 물품수.
		System.out.println("items loaded!   "  + service.searchLists(sch).size() );
		
		return "main/search";
	}
	
	// 아이템 등록화면 이동
	@RequestMapping("item/insert.do")
	public String insert(Model m){
		// view화면에서 item값이 insert면 등록화면이 나옴
		m.addAttribute("item", "insert");
		return "main/main";
	}
	// 아이템 등록실행
	@RequestMapping("item/insertProc.do")
	public String insertProc(@ModelAttribute Item ins, HttpSession session, MultipartFile file) throws IOException{
		int id = (int) session.getAttribute("id");
		ins.setAuctioneer_id(id);
		service.itemInsert(ins, file);
		return "redirect:/main.do";
	}
	

	


	
	
}