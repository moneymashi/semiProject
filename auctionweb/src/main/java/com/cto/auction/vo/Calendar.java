package com.cto.auction.vo;
//id, title, start, end, url
// tester
public class Calendar {
	private int calendar_id;
	private String title;
	private String start_date;
	private String end_date;
	private String url;
	/*
	title: 'Meeting',
	start: '2017-05-12T10:30:00',
	end: '2017-05-12T12:30:00'
	*/	
	public int getCalendar_id() {
		return calendar_id;
	}
	public void setCalendar_id(int calendar_id) {
		this.calendar_id = calendar_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
	
	/* 
	/////////// 선생님 예제 VO그대로 따라해야할것.
	///////////  full calendar doc 참고할것.!!!!!
	
	package springweb.i02_calen;
//id, title, start, end, url
// springweb.i02_calen.Calendar
public class Calendar {
	private int id;
	private String title;
	private String start;
	private String end;
	private String url;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}

	
	
	
	
	 * */
	
	
	
	
	
	
}
