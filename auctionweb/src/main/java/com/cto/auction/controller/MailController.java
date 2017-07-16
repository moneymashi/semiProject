package com.cto.auction.controller;



import java.io.PrintWriter;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cto.auction.service.MailService;
import com.cto.auction.service.UserService;

@Controller
@RequestMapping("/*")
public class MailController{
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("mail/mailSending.do")
	public String mailSending(HttpServletRequest request) {
		   
	    String tomail  = request.getParameter("tomail"); 
	    String title   = request.getParameter("title"); 
	    String content = request.getParameter("content"); 
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");

	      messageHelper.setTo(tomail); 
	      messageHelper.setSubject(title);
	      messageHelper.setText(content); 
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    return "redirect:/notice/qna.do";
	}
	
	@RequestMapping(value = "login/codeSend.do")
	public void codeSend(HttpServletRequest request, HttpServletResponse res, ModelMap model) throws Exception {
		PrintWriter out = res.getWriter();
    	String joinCode = MainController.randomNum(4);
    	String tomail  = request.getParameter("signEmail"); 
    	String title   = "인증번호입니다.";  
    	String content = "귀하의 인증번호는 [ "+joinCode+"] 입니다."; 
    	
		try {
 	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");

	      messageHelper.setTo(tomail); 
	      messageHelper.setSubject(title);
	      messageHelper.setText(content); 
	     
	      mailSender.send(message);
	      out.print(joinCode);
	      out.flush();
	      out.close();
	      
	    } catch(Exception e){
	      System.out.println("[ERROR]login/codeSend.do:"+e);
	    }
	}
	
	// whyNot 테스트중 현재 usercontroller에서 위에랑 같은 소스로 진행중
/*	private UserService userService;
    private MailService mailService;
    
    public void setUserDAO(UserService userService) {
        this.userService = userService;
    }
 
    public void setMailDAO(MailService mailService) {
        this.mailService = mailService;
    }
    // 회원가입 이메일 인증
    @RequestMapping(value = "login/codeSend.do")
    @ResponseBody
    public boolean sendMailCode(HttpSession session, @RequestParam("signEmail") String email) {
    	//main컨트롤러에 있는 랜덤함수 가져옴
    	System.out.println(">>>>>>>>>>>>>"+email);
    	String joinCode = MainController.randomNum(4);
        session.setAttribute("joinCode", joinCode);
 
        String subject = "회원가입 인증 코드 발급 안내 입니다.";
        String text = ("귀하의 인증 코드는 [ " + joinCode + " ] 입니다.");
        return mailService.send(subject, text, "whytestnot@gmail.com", email, null);
    }
    
    // 아이디 찾기
    @RequestMapping(value = "/sendMail/id", method = RequestMethod.POST)
    public String sendMailId(HttpSession session, @RequestParam String email, @RequestParam String captcha, RedirectAttributes ra) {
        String captchaValue = (String) session.getAttribute("captcha");
        if (captchaValue == null || !captchaValue.equals(captcha)) {
            ra.addFlashAttribute("resultMsg", "자동 방지 코드가 일치하지 않습니다.");
            return "redirect:/find/id";
        }
 
        User user = userService.findAccount(email);
        if (user != null) {
            String subject = "아이디 찾기 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 아이디는 " + user.getId() + " 입니다.");
            mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
            ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 해당 이메일로 가입된 아이디를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "redirect:/find/id";
    }
 
    // 비밀번호 찾기
    @RequestMapping(value = "/sendMail/password", method = RequestMethod.POST)
    public String sendMailPassword(HttpSession session, @RequestParam String id, @RequestParam String email, @RequestParam String captcha, RedirectAttributes ra) {
        String captchaValue = (String) session.getAttribute("captcha");
        if (captchaValue == null || !captchaValue.equals(captcha)) {
            ra.addFlashAttribute("resultMsg", "자동 방지 코드가 일치하지 않습니다.");
            return "redirect:/find/password";
        }
 
        User user = userService.findAccount(email);
        if (user != null) {
            if (!user.getId().equals(id)) {
                ra.addFlashAttribute("resultMsg", "입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.");
                return "redirect:/find/password";
            }
            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String password = String.valueOf(ran);
            userService.updateInfo(user.getNo(), "password", password); // 해당 유저의 DB정보 변경
 
            String subject = "임시 비밀번호 발급 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
            mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
            ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "redirect:/find/password";
    }*/
}
