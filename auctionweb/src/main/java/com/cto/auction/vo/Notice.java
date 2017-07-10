/*CREATE TABLE AUCTION_NOTICE(
	NOTICE_ID NUMBER PRIMARY KEY,
	NOTICE_TITLE VARCHAR2(1000) NOT NULL,
	NOTICE_CONTENT VARCHAR2(3000) NOT NULL,
	NOTICE_DATE DATE DEFAULT SYSDATE,
)*/
package com.cto.auction.vo;

import java.util.Date;


public class Notice {
	private int notice_id;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private int notice_no;
	
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public int getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(int notice_id) {
		this.notice_id = notice_id;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	
}
