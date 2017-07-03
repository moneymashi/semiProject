package com.cto.auction.repository.user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Repository;

import com.cto.auction.vo.user.User;
import com.cto.auction.vo.user.Payment;

@Repository
public interface UserDAO {

	// 테스트용 코드 삭제해도됨
	public List<User> auctionUserList(User list);

	public User loginCheck(User mem);

	public void signUpProc(User ins);

	public void logout(HttpSession session);

	public User myPageUserInfo(User info);

	public void myPageUserUpdate(User upt);
	
	public void myPageUserDelete(User del);

	
	public void myPageLocUpdate(User upt);

	public Payment myPageUserPayment(Payment info);

	public void myPagePayUpdate(Payment upt);

	public void myPagePayInsert(Payment upt);

}
