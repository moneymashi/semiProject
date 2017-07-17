package com.cto.auction.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URISyntaxException;
import java.util.List;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cto.auction.service.UserService;
import com.cto.auction.vo.Bid;
import com.cto.auction.vo.Item;
import com.cto.auction.vo.Payment;
import com.cto.auction.vo.User;

@Controller
@RequestMapping("/*")
public class UserController {
	@Autowired(required = false)
	private UserService service;
	
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
			/*session.setAttribute("newMsg", (Integer)service.newMessageCnt());*/
			// 보여주는 view 경로 설정( 로그인이 성공 했으면 main으로)
			mav.setViewName("redirect:/main.do");
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

	//
	@RequestMapping(value = "login/chkDupEmail.do")
	public void checkEmail(HttpServletRequest req, HttpServletResponse res, ModelMap model) throws Exception {
		PrintWriter out = res.getWriter();
		try {
			// 넘어온 ID를 받는다.
			String paramId = (req.getParameter("prmEmail") == null) ? "" : String.valueOf(req.getParameter("prmEmail"));
			User cnt = new User();
			cnt.setEmail(paramId);
			int chkPoint = service.chkDupEmail(cnt);
			out.print(chkPoint);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
			out.print("1");
		}
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
		mav.setViewName("redirect:/main.do");
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

	// 위와 같은 로직인데, 화면출력만 다름.
	@RequestMapping("myPage/locationInfo.do")
	public ModelAndView myPageLocationInfo(User info, HttpSession session, ModelAndView mav) {
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "myPage/locationInfo");
		mav.addObject("userInfo", service.myPageUserInfo(info, session));
		return mav;
	}

	// 회원정보 수정
	@RequestMapping("myPage/update.do")
	public String myPageUserUpdate(User upt, HttpSession session) {
		service.myPageUserUpdate(upt);
		session.setAttribute("mem", service.myPageUserInfo(upt, session));
		return "redirect:/myPage/userInfo.do";
	}

	// 회원 주소정보 수정
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

	// 회원 판매정보 페이지이동
	@RequestMapping("myPage/userPayment.do")
	public ModelAndView myPageUserPayment(Payment info, HttpSession session, ModelAndView mav) {
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "myPage/userPayment");
		mav.addObject("payInfo", service.myPageUserPayment(info, session));
		return mav;
	}

	// 회원 판매정보 수정
	@RequestMapping("myPage/payUpdate.do")
	public String myPagePayUpdate(Payment upt) {
		service.myPagePayUpdate(upt);
		return "redirect:/myPage/userPayment.do";
	}

	// 회원 판매정보 입력
	@RequestMapping("myPage/payInsert.do")
	public String myPagePayInsert(Payment upt) {
		service.myPagePayInsert(upt);
		return "redirect:/myPage/userPayment.do";
	}

	
	
	
	// 입찰중, 낙찰, 낙찰 실패 페이지
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

	
	
	
	
	
	
	
	// 배송화면 아무런 로직 구현 안됨.
	@RequestMapping("myPage/delivery.do")
	public ModelAndView myPageDelivery(ModelAndView mav) {
		mav.setViewName("menu/menu");
		mav.addObject("pageName", "myPage/delivery");
		return mav;
	}

	
	
	
	
	// 재현
	// 낙찰 작업: 서비스들은 임시 데이터 부르기.
	@RequestMapping("myPage/payTheWin.do")
	public String payTheWin(@ModelAttribute("userSch") User userSch, @ModelAttribute("item01") Item item01,
			HttpSession session, Model d) {
		userSch.setUser_id((int) session.getAttribute("id"));
		item01.setCurrent_bidder_id((int) session.getAttribute("id"));
		item01.setAuction_id((int) session.getAttribute("auction_id"));

		d.addAttribute("mem", service.mem(userSch));
		d.addAttribute("winpay1", service.winpay1(item01));
		// nullpointer if size() == 0 >> 처리필수.

		System.out.println("################ 1 // " + service.mem(userSch).getUser_point());
		System.out.println("################ 2 // " + service.mem(userSch).getUser_id());
		System.out.println("################ 3 // " + service.winpay1(item01).getItem_name());
		System.out.println("################ 4 // " + service.winpay1(item01).getCurrent_bidder_id());

		return "menu/myPage/payTheWin";
	}

	// 낙찰후 포인트 차감 업데이트
	@RequestMapping("myPage/payTheWinProc.do")
	public String payTheWinProc(@ModelAttribute("userUpt") User userUpt) {
		service.memProc(userUpt);
		return "redirect:/myPage/auctionInfo.do";
	}
	
}
