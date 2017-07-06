package com.cto.auction.service.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cto.auction.repository.board.BoardDAO;
import com.cto.auction.vo.bid.Bid;
import com.cto.auction.vo.board.Board;
import com.cto.auction.vo.item.Item;

@Service
public class BoardService {
	@Autowired(required=false)
	private BoardDAO dao;
	// 게시판 리스트 작성
	public ArrayList<Board> boardList(int start, int end, String option, String keyword, int auction_id){
		// Map 선언
		Map<String, Object> map = new HashMap<String, Object>();
		// map에 값 넣기
		map.put("option", option);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("auction_id", auction_id);
		// 해당 map을 sql(mapper)에 전송
		return dao.boardList(map);
	}
	// 게시글 조회
	public Board read(int board_id){
		return dao.read(board_id);
	}
	// 게시글 작성
	public void insert(Board ins){
		String title = ins.getBoard_title();
		String content = ins.getBoard_content();
		String name = ins.getBoard_name();
// 		*태그문자 처리 (< ==> &lt; > ==> &gt;)
// 		replace(A, B) A를 B로 변경
		title = title.replace("<", "&lt;");
	    title = title.replace("<", "&gt;");
	    name = name.replace("<", "&lt;");
	    name = name.replace("<", "&gt;");
// 		*공백문자 처리
		title = title.replace("  ", "&nbsp;&nbsp;");
		name = name.replace("  ", "&nbsp;&nbsp;");
// 		*줄바꿈 문자처리
		content = content.replace("\n", "<br>");
		ins.setBoard_title(title);
		ins.setBoard_name(name);
		ins.setBoard_content(content);
		dao.insert(ins);
	}
	// 게시글 수정
	public void update(Board upt){
		dao.update(upt);
	}
	// 게시글 삭제
	public void delete(int board_id){
		dao.delete(board_id);
	}
	// 게시글 조회수 증가
	public void increaseHit(int board_id, HttpSession session){
		long update_time = 0;
// 		세션에 저장된 조회시간 검색
// 		최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행X
        if(session.getAttribute("update_time: "+board_id) != null){
// 			세션에서 읽어오기
            update_time = (long)session.getAttribute("update_time: "+board_id);
        }
// 		시스템의 현재시간을 current_time에 저장
        long current_time = System.currentTimeMillis();
// 		일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
// 		시스템현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
        if(current_time - update_time > 1000){
            dao.increaseHit(board_id);
// 			세션에 시간을 저장 : "update_time_"+board_id는 다른변수와 중복되지 않게 명명한 것
            session.setAttribute("update_time: "+board_id, current_time);
        }
	}
	// 게시글 갯수 확인
	public int countBoard(String option, String keyword, int auction_id){
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("option", option);
		 map.put("keyword", keyword);
		 map.put("auction_id", auction_id);
		 return dao.countBoard(map);
	}
	// 답글 작성
	public void replyInsert(Board reply){
		// 답글 모양 설정
		dao.shapeReply(reply);
		// 답글 입력
		dao.insertReply(reply);
	}
	// 답글 작성시 해당 게시글 글 불러오기
	public Board getReply(int board_id, HttpSession session){
		Board reply = null;
		// 게시글 불러오기
		reply = dao.read(board_id);
		reply.setBoard_title(reply.getBoard_title()+"의 답변입니다.");
		reply.setBoard_content("\n\n\n\n===이전 내용====\n"+reply.getBoard_content()+"\n");
		return reply;
	}
	// 물품상세정보
	public Item itemInfo(int auction_id){
		return dao.itemInfo(auction_id);
	}
	// 입찰테이블 작성
	public void bidInsert(Bid bid){
		dao.bidInsert(bid);
	}
	// 아이템테이블 수정(입찰값, 입찰아이디 수정)
	public void itemUpdate(Item upt){
		dao.itemUpdate(upt);
	}
	// 입찰로그 확인
	public ArrayList<Bid> bidList(int auction_id){
		return dao.bidList(auction_id);
	}
	// 입찰테이블에 입찰자 데이터가 있는지 확인
	public Bid bidCheck(Bid bid){
		return dao.bidCheck(bid);
	}
	// 있을 경우 입찰테이블을 수정
	public void bidUpdate(Bid bid){
		dao.bidUpdate(bid);
	}
	// status 변경
	public void changeStaus(int auction_id){
		dao.changeStaus(auction_id);
	}
	public void itemHit(int auction_id){
		dao.itemHit(auction_id);
	}
}
