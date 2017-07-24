package com.cto.auction.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.cto.auction.vo.Calendar;
// springweb.i02_calen.A03_CalenDao
@Repository
public interface CalendarDAO {
	public ArrayList<Calendar> list();
}
