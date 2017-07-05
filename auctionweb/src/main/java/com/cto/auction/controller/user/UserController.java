package com.cto.auction.controller.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.css.Counter;

import com.cto.auction.service.item.ItemService;
import com.cto.auction.service.user.UserService;
import com.cto.auction.vo.user.User;
import com.cto.auction.vo.bid.Bid;
import com.cto.auction.vo.item.Item;
import com.cto.auction.vo.user.Auctioneer;
import com.cto.auction.vo.user.Payment;


@Controller
@RequestMapping("/*")
public class UserController {
	@Autowired(required = false)
	private UserService service;
	private ItemService serviceItem;
	
	@RequestMapping("whyNot.do")
	public String auctionUserList(@ModelAttribute("testCtrlModelAttribute") User sch, Model m) {
		m.addAttribute("ttt", service.auctionUserList(sch));
		return "main/testlist";
	}
	
	// 로그인 접속
	@RequestMapping("login/login.do")
	public String login() {
		return "login/login";
	}

	// 로그인 체크
	@RequestMapping("login/loginCheck.do")
	public ModelAndView loginCheck(User mem, HttpSession session, ModelAndView mav) {
		// 로그인 체크시 null값이 아니면(회원정보가 있으면)
		if (service.loginCheck(mem) != null) {
			// 해당 멤버의 정보를 "mem"이라는 이름으로 세션에 넣겠다.
			session.setAttribute("mem", service.loginCheck(mem));
			session.setAttribute("sessionUser_id", service.loginCheck(mem).getUser_id());
			// 세션 id : 로그인 한 계정의 user_id
			session.setAttribute("id", service.loginCheck(mem).getUser_id());
			// 세션 email : 로그인 한 계정의 email
			session.setAttribute("email", service.loginCheck(mem).getEmail());
			// 세션 name : 로그인 한 계정의 이름
			session.setAttribute("name", service.loginCheck(mem).getUser_name());
			// 보여주는 view 경로 설정( 로그인이 성공 했으면 main으로)
			mav.setViewName("main/main");
			// 해당 view에 포함시킬 객체 설정(로그인 여부 msg를 설정함-success)
			mav.addObject("msg", "success");
		} else {
			// 로그인 체크 null값이면 다시 login 페이지로
			mav.setViewName("login/login");
			// 해당 view에 포함시킬 객체 설정
			mav.addObject("msg", "failure");
		}
		return mav;
	}
	// 회원가입폼으로 이동
	@RequestMapping("login/signUp.do")
	public String signUp() {
		return "login/signup";
	}

	// 실질적인 회원가입 진행로직
	@RequestMapping("login/signUpProc.do")
	public String signUpProc(User ins) {
		service.signUpProc(ins);
		return "redirect:login.do";
	}

	// 로그아웃
	@RequestMapping("login/logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav) {
		service.logout(session);
		mav.setViewName("/main/main");
		mav.addObject("msg", "logout");
		return mav;
	}

	// 회원개인 정보 + 주소정보
	@RequestMapping("myPage/userInfo.do")
	public ModelAndView myPageUserInfo(User info, HttpSession session, ModelAndView mav) {
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "myPage/userInfo");
		mav.addObject("userInfo", service.myPageUserInfo(info, session));
		return mav;
	}
	@RequestMapping("myPage/locationInfo.do")
	public ModelAndView myPageLocationInfo(User info, HttpSession session, ModelAndView mav) {
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "myPage/locationInfo");
		mav.addObject("userInfo", service.myPageUserInfo(info, session));
		return mav;
	}

	// 회원정보 수정
	@RequestMapping("myPage/update.do")
	public String myPageUserUpdate(User upt) {
		service.myPageUserUpdate(upt);
		return "redirect:/myPage/userInfo.do";
	}
	@RequestMapping("myPage/locUpdate.do")
	public String myPageLocUpdate(User upt) {
		service.myPageLocUpdate(upt);
		return "redirect:/myPage/locationInfo.do";
	}

	// 회원 삭제
	@RequestMapping("myPage/delete.do")
	public String myPageUserDelete(User del, HttpSession session) {
		service.myPageUserDelete(del, session);
		return "redirect:/main.do";
	}
	
	@RequestMapping("myPage/userPayment.do")
	public ModelAndView myPageUserPayment(Payment info, HttpSession session, ModelAndView mav) {
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "myPage/userPayment");
		mav.addObject("payInfo", service.myPageUserPayment(info, session));
		return mav;
	}
	@RequestMapping("myPage/payUpdate.do")
	public String myPagePayUpdate(Payment upt) {
		service.myPagePayUpdate(upt);
		return "redirect:/myPage/userPayment.do";
	}
	@RequestMapping("myPage/payInsert.do")
	public String myPagePayInsert(Payment upt) {
		service.myPagePayInsert(upt);
		return "redirect:/myPage/userPayment.do";
	}
	
	@RequestMapping("myPage/auctionInfo.do")
	public ModelAndView myPageAuctionInfo(Item item, Bid bid, HttpSession session, ModelAndView mav) {
		// menu/menu 페이지로 이동
		mav.setViewName("menu/menu");
		// menu.jsp 에 포함된 인클루드 페이지 auctionInfo.jsp
		mav.addObject("pageName", "myPage/auctionInfo");
		// 입찰중인 물품(경매시간 남은 경우. 입찰가와 상관없음)
		
		List<Item> aib1 = service.auctionInfoBidding01(item, session);
		List<Bid> aib2 = service.auctionInfoBidding02(bid, session);
		// 낙찰된 물품(경매시간이 끝났고, 입찰가가 1등인경우)
		List<Item> aiw1 = service.auctionInfoWinBid01(item, session);
		List<Bid> aiw2 = service.auctionInfoWinBid02(bid, session);
		// 낙찰에 실패한 물품(경매시간끝났고, 입찰가가 1등이 아닌경우)
		List<Item> ail1 = service.auctionInfoLoseBid01(item, session);
		List<Bid> ail2 = service.auctionInfoLoseBid02(bid, session);
			
		if (aib1.size() != 0) {
			mav.addObject("bidding1", aib1);
			mav.addObject("bidding2", aib2);
		} else {
			mav.addObject("biddingMsg", "nothing");
		}
		if (aiw1.size() != 0) {
			mav.addObject("winBid1", aiw1);
			mav.addObject("winBid2", aiw2);
		} else {
			mav.addObject("winBidMsg", "nothing");
		}
		if (ail1.size() != 0) {
			mav.addObject("loseBid1", ail1);
			mav.addObject("loseBid2", ail2);
		} else {
			mav.addObject("loseBidMsg", "nothing");
		}
		return mav;
	}
	
	
	
	// 회원정보에 합침.
	/*@RequestMapping("myPage/locationInfo.do")
	public ModelAndView myPageLocationInfo(AuctionUser info, HttpSession session, ModelAndView mav) {
		// menu/menu 페이지로 이동
		mav.setViewName("menu/menu");
		// menu.jsp 에 포함된 인클루드 페이지 auctionInfo.jsp
		mav.addObject("pageName", "myPage/locationInfo");
		// 입찰중인 물품(경매시간 남은 경우. 입찰가와 상관없음)
		mav.addObject("bidding", service.auctionUserInfo(info, session));
		return mav;
	}*/

	@RequestMapping("myPage/message.do")
	public ModelAndView myPageMessage(ModelAndView mav) {
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "myPage/message");
		return mav;
	}

	@RequestMapping("myPage/delivery.do")
	public ModelAndView myPageDelivery(ModelAndView mav) {
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "myPage/delivery");
		return mav;
	}
	

	
	// 판매자 페이지
	@RequestMapping("auctioneerPage/auctioneerInfo.do")
	public ModelAndView auctioneerAuctioneerInfo(Auctioneer info, HttpSession session, ModelAndView mav) {
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "auctioneerPage/auctioneerInfo");
		mav.addObject("acnrInfo", service.auctioneerAuctioneerInfo(info, session));
		return mav;
	}
	@RequestMapping("auctioneerPage/auctioneerUpdate.do")
	public String auctioneerAuctioneerUpdate(Auctioneer upt) {
		service.auctioneerAuctioneerUpdate(upt);
		return "redirect:/auctioneerPage/auctioneerInfo.do";
	}
	@RequestMapping("auctioneerPage/auctioneerInsert.do")
	public String auctioneerAuctioneerInsert(Auctioneer ins, HttpSession session) {
		service.auctioneerAuctioneerInsert(ins);
		return "redirect:/auctioneerPage/auctioneerInfo.do";
	}
	
	
	@RequestMapping("auctioneerPage/saleInfo.do")
	public ModelAndView auctioneerSaleInfo(ModelAndView mav) {
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "auctioneerPage/saleInfo");
		return mav;
	}

}
