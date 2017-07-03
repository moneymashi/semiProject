package com.cto.auction.repository.member;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.cto.auction.vo.member.Member;
@Repository
public interface MemberDAO {
	// 로그인시 해당 계정이 있는지 확인
	public Member loginCheck(Member mem);
	// 회원가입
	public void memberInsert(Member ins);
	// 로그아웃
	public void logout(HttpSession session);
	// 회원정보확인
	public Member memberInfo(Member info);
	// 회원정보수정
	public void memberUpdate(Member upt);
	// 회원정보 삭제
	public void memberDelete(Member del);
}
