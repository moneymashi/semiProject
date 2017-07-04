package com.cto.auction.controller.item;

import java.io.IOException;
import java.util.List;

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

	@Autowired(required = false)
	private ItemService service;

	// // 아이템 리스트
	// @RequestMapping("search.do")
	// public ModelAndView itemList(
	// @ModelAttribute("itemSch") Item_Sch sch,
	// ModelAndView mav, Model m, HttpSession session){
	// // view화면에서 item값이 list면 아이템 목록이 나옴
	// m.addAttribute("item", "list");
	// mav.addObject("itemList", service.searchLists(sch));
	// mav.setViewName("main/search");
	// return mav;
	// }
	//

	@RequestMapping("search.do")
	public String searchLists(@ModelAttribute("itemSch") Item_Sch sch, Model d) {
		// 테스트용 - 페이지2에서 필터적용하면 500 에러. 문제원인 파악용.
		System.out.println("############ ");
		System.out.println("############ ");
		// private String priceOrder; // 입찰가격 order by.
		// private String userStartDate; // 구매자가 조회하고싶은 최소 입찰기간
		// private String userEndDate; // 구매자가 조회하고싶은 최대 입찰기간
		// private String endDateOrder; // 입찰마감기간 order by
		// private String aucStatus; // 입찰상태
		// private String minCurrentBidPrice; // minCurrentBidPrice 유저 최소입찰가격 필터
		// private String maxCurrentBidPrice; // maxCurrentBidPrice 유저 최대입찰가격 필터

		System.out.println("############ priceOrder ::  " + sch.getPriceOrder());
		System.out.println("############ userStartDate ::  " + sch.getUserStartDate());
		System.out.println("############ userEndDate ::  " + sch.getUserEndDate());
		System.out.println("############ endDateOrder ::  " + sch.getEndDateOrder());
		System.out.println("############ aucStatus ::  " + sch.getAucStatus());
		System.out.println("############ minCurrentBidPrice  " + sch.getMinCurrentBidPrice());
		System.out.println("############ maxCurrentBidPrice ::  " + sch.getMaxCurrentBidPrice());
		System.out.println("############ ");
		System.out.println("############ ");

		// main/search.jsp참고. items는 ArrayList<Item> 형태, Model d.addAttribute로
		// 보내줌..
		d.addAttribute("itemList", service.searchLists(sch));

		// 결과 물품수.
		System.out.println("items loaded!   " + service.searchLists(sch).size());

		return "main/search";
	}

	// 아이템 등록화면 이동
	@RequestMapping("item/insert.do")
	public String insert(Model m) {
		// view화면에서 item값이 insert면 등록화면이 나옴
		m.addAttribute("item", "insert");
		return "main/main";
	}

	// 아이템 등록실행
	@RequestMapping("item/insertProc.do")
	public String insertProc(@ModelAttribute Item ins, HttpSession session, MultipartFile file) throws IOException {
		int id = (int) session.getAttribute("id");
		ins.setAuctioneer_id(id);
		service.itemInsert(ins, file);
		return "redirect:/main.do";
	}

	/* whyNot Start */
	@RequestMapping("myPage/auctionInfo.do")
	public ModelAndView myPageAuctionInfo(Item info, HttpSession session, ModelAndView mav) {
		// menu/menu 페이지로 이동
		mav.setViewName("menu/menu");
		// menu.jsp 에 포함된 인클루드 페이지 auctionInfo.jsp
		mav.addObject("pageName", "myPage/auctionInfo");
		// 입찰중인 물품(경매시간 남은 경우. 입찰가와 상관없음)
		List<Item> aib = service.auctionInfoBidding(info, session);
		// 낙찰된 물품(경매시간이 끝났고, 입찰가가 1등인경우)
		List<Item> aiw = service.auctionInfoWinBid(info, session);
		// 낙찰에 실패한 물품(경매시간끝났고, 입찰가가 1등이 아닌경우)
		List<Item> ail = service.auctionInfoLoseBid(info, session);
		if (aib != null) {
			mav.addObject("bidding", aib);
		} else {
			mav.addObject("biddingMsg", "nothing");
		}
		if (aiw != null) {
			mav.addObject("winBid", aiw);
		} else {
			mav.addObject("winBidMsg", "nothing");
		}
		if (ail != null) {
			mav.addObject("loseBid", ail);
		} else {
			mav.addObject("loseBidMsg", "nothing");
		}
		return mav;
	}

	/* whyNot End */

}