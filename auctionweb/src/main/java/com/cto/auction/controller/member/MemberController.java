package com.cto.auction.controller.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cto.auction.service.member.MemberService;
import com.cto.auction.vo.member.Member;

@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired(required=false)
	private MemberService service;
	
//	로그인 접속	
	@RequestMapping("login.do")
	public String login(){
		return "member/login";
	}

//	로그인 체크
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(Member mem, HttpSession session, ModelAndView mav){
		//	로그인 체크시 null값이 아니면(회원정보가 있으면)
		if(service.loginCheck(mem)!=null){
			// 세션 mem : 로그인 한 계정의 모든 정보
			session.setAttribute("mem", service.loginCheck(mem));
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
		}else{
			// 로그인 체크 null값이면 다시 login 페이지로
			mav.setViewName("member/login");
			//	해당 view에 포함시킬 객체 설정
			mav.addObject("msg", "failure");
		}
		return mav;	
	}

//	회원가입폼으로 이동
	@RequestMapping("insert.do")
	public String memberInsert(){
		return "member/signup";
	}

//	실질적인 회원가입 진행로직
	@RequestMapping("insertProc.do")
	public String insertProc(Member ins){
		service.memberInsert(ins);
		return "redirect:login.do";
	}
	
//	회원개인 정보
	@RequestMapping("info.do")
	public String memInfo(Member info, HttpSession session, Model m){
		m.addAttribute("mem", service.memberInfo(info, session));
		return "member/info";
	}
	
//	회원정보 수정
	@RequestMapping("update.do")
	public String memberUpdate(Member upt, HttpSession session){
		service.memberUpdate(upt);
		return "redirect:info.do";		
	}

//	회원 삭제
	@RequestMapping("delete.do")
	public String memberDelete(Member del, HttpSession session){
		service.memberDelete(del, session);
		return "redirect:login.do";
	}
//	로그아웃
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session, ModelAndView mav){
		service.logout(session);
		mav.setViewName("member/login");
		mav.addObject("msg", "logout");
		return mav;
	}
	
}
