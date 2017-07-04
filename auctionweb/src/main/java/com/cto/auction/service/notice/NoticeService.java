package com.cto.auction.service.notice;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.cto.auction.repository.notice.NoticeDAO;
import com.cto.auction.vo.notice.Notice;

@Service
public class NoticeService {

	@Autowired(required=false)
	private NoticeDAO dao;
	
	public ArrayList<Notice> noticeList(int start, int end){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		return dao.noticeList(map);
	}
	
	public Notice readNotice(int notice_id){
		return dao.readNotice(notice_id);
	}
	
	public void insertNotice(Notice ins){
		String title = ins.getNotice_title();
		String content = ins.getNotice_content();
		title = title.replace("<", "&lt;");
	    title = title.replace(">", "&gt;");
	    title = title.replace("  ", "&nbsp;&nbsp;");
	    content = content.replace("\n", "<br>");
	    ins.setNotice_title(title);
	    ins.setNotice_content(content);
	    dao.insertNotice(ins);
	}
	
	public void updateNotice(Notice upt){
		dao.updateNotice(upt);
	}
	
	public void delete(int notice_id){
		dao.deleteNotice(notice_id);
	}
	
	public int countNotice(){
		return dao.countNotice();
	}
}
