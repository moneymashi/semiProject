package com.cto.auction.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cto.auction.repository.CalendarDAO;
import com.cto.auction.vo.Calendar;

@Service
public class CalendarService {
	@Autowired(required=false)
	private CalendarDAO dao;
	
	public ArrayList<Calendar> list(){
		return dao.list();
	}	
}
