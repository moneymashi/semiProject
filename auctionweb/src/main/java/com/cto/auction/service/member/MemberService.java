package com.cto.auction.service.member;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cto.auction.repository.member.MemberDAO;
import com.cto.auction.vo.member.Member;

@Service
public class MemberService {
	@Autowired(required=false)
	private MemberDAO dao;
	// 계정이 있는지 확인
	public Member loginCheck(Member mem){
		return dao.loginCheck(mem);
	}
	// 회원가입
	public void memberInsert(Member ins){
		dao.memberInsert(ins);
	}
	// 로그아웃
	public void logout(HttpSession session){
		// 로그아웃이 세션 삭제
		session.invalidate();
	}
	// 회원정보 확인
	public Member memberInfo(Member info, HttpSession session){
		info.setEmail((String) session.getAttribute("email"));
		return dao.memberInfo(info);
	}
	// 회원정보 수정
	public void memberUpdate(Member upt){
		dao.memberUpdate(upt);
	}
	// 회원정보 삭제
	public void memberDelete(Member del, HttpSession session){
		dao.memberDelete(del);
		// 정보삭제시 세션도 삭제
		session.invalidate();
	}
	
	
}
