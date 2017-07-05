package com.cto.auction.controller.mail;


import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mail")
public class mailController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping("mailSending.do")
	public String mailSending(HttpServletRequest request) {
		   
	    String setfrom = "hadbsgk@gmail.com";         
	    String tomail  = request.getParameter("tomail"); 
	    String title   = request.getParameter("title"); 
	    String content = request.getParameter("content"); 
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom); 
	      messageHelper.setTo(tomail); 
	      messageHelper.setSubject(title);
	      messageHelper.setText(content); 
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    return "redirect:/notice/qna.do";
	}
	
}
