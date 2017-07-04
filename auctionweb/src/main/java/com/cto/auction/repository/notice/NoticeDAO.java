package com.cto.auction.repository.notice;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cto.auction.vo.notice.Notice;

@Repository
public interface NoticeDAO {
	public ArrayList<Notice> noticeList(Map<String, Object> map);
	public void insertNotice(Notice ins);
	public Notice readNotice(int notice_id);
	public void updateNotice(Notice upt);
	public void deleteNotice(int notice_id);
	public int countNotice();	
}
