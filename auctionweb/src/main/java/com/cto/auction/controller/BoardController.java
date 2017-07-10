package com.cto.auction.controller;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cto.auction.service.BoardService;
import com.cto.auction.vo.Bid;
import com.cto.auction.vo.Board;
import com.cto.auction.vo.BoardPage;
import com.cto.auction.vo.Item;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Autowired(required=false)
	private BoardService service;
	// 카운트다운을 위한 날짜 변환
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	
	// 01. 게시글 목록
	@RequestMapping("list.do")
	public ModelAndView boardList(@RequestParam(defaultValue="board_title") String option,
			@RequestParam(defaultValue="") String keyword, @RequestParam(defaultValue="1") int curPage, 
			@RequestParam int auction_id, ModelAndView mav, HttpSession session) throws ParseException{
		service.itemHit(auction_id);
		// 세션 itemInfo : 해당 물품에 대한 셍서정보. 탭 변환시에도 해당 아이템을 유지하기 위한 세션
	    session.setAttribute("itemInfo", service.itemInfo(auction_id));
	    // 세션 aucion_id : 해당 물품에 대한 auction_id. 탭 변환시에도 해당 아이템정보를 유지하기 위한 세션
	    session.setAttribute("auction_id", service.itemInfo(auction_id).getAuction_id());
	    // 세션 auctioneer_id : 해당 물품을 올린 판매자의 id. 입찰과 댓글 등에 필요한 세션
	    session.setAttribute("auctioneer_id", service.itemInfo(auction_id).getAuctioneer_id());
	    // 세션 endDate : 카운트다운에 필요한 세션
	    session.setAttribute("endDate", sdf.format(service.itemInfo(auction_id).getEnd_date()));
	    // 세션 bidList : 입찰 로그 세션
	    session.setAttribute("bidList", service.bidList(auction_id));
	    
	    // 경매종료 로직(경매마감시간과 현재시간 계산)
	    // 날짜형문자로 변환
	    String nowDate = sdf.format(new Date());
	    String endDate = sdf.format(service.itemInfo(auction_id).getEnd_date());
	    // 날짜형숫자로  변환
	    Date parseEnd = sdf.parse(endDate);
	    Date parseNow = sdf.parse(nowDate);
	    // 경매마감일 - 현재시간 계산
	    long gap = parseEnd.getTime() - parseNow.getTime();		

		// 레코드의 갯수 계산
		int count = service.countBoard(option, keyword, auction_id);
		
		// 페이지 나누기 관련 처리
		BoardPage boardPage = new BoardPage(count, curPage);
		int start = boardPage.getPageBegin();
		int end = boardPage.getPageEnd();
	    
		// 데이터를 맵에 저장
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("list", service.boardList(start, end, option, keyword, auction_id)); // list
	    map.put("count", service.countBoard(option, keyword, auction_id)); // 레코드의 갯수
	    map.put("option", option); // 검색옵션
	    map.put("keyword", keyword); // 검색키워드
	    map.put("boardPage", boardPage); // 페이징처리
	    
	    // view단에서 status값이 list면 게시판 목록이 나옴
	    mav.addObject("status", "list"); 
	    // 마감시간-현재시간이 0보다 같거나 작으면
	    if(gap<=0){
	    	service.changeStaus(auction_id);
	    	mav.addObject("time", "end");
	    // 아닐 경우
	    }else{
	    	mav.addObject("time","ing");
	    }
	    mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
	    mav.setViewName("item/item"); // 뷰를 list.jsp로 설정
	    // view화면은 item/item
	    return mav;
	}

	// 02_01. 게시글 작성화면
	@RequestMapping("insert.do")
	public String insert() {
		// view화면은 item/item
		return "item/item";
	}

	// 02_02. 게시글 작성처리
	@RequestMapping("insertProc.do")
	public String insertProc(@ModelAttribute Board ins, HttpSession session){
		// 세션값 변수 선언
		String name = (String) session.getAttribute("name");
		int user_id = (int) session.getAttribute("id");
		int auction_id = (int) session.getAttribute("auction_id");
		// 세션값들을 해당 컬럼값들로 설정
		ins.setAuction_id(auction_id);
		ins.setBoard_writer_id(user_id);
		ins.setBoard_name(name);
		service.insert(ins);
		// view화면은 item/item
		return "redirect:list.do?auction_id="+session.getAttribute("auction_id");
	}

	// 03. 게시글 상세내용 조회, 게시글 조회수 증가 처리
	// HttpSession 세션객체
	@RequestMapping("read.do")
	public ModelAndView read(@RequestParam int board_id, HttpSession session, ModelAndView mav){
		// 조회수 증가 처리
		service.increaseHit(board_id, session);
		// 뷰의 이름
		mav.setViewName("item/item");
		// view단에서 status값이 read면 글내용(정보)가 나옴
		mav.addObject("status", "read");
		mav.addObject("read", service.read(board_id));
		// view화면은 item/item
		return mav;
	}
	
	// 04-1. 게시글 수정화면
	@RequestMapping("update.do")
	public ModelAndView update(@RequestParam int board_id, ModelAndView mav){
		mav.setViewName("item/item");
		// view단에서 status값이 update면 게시글 수정화면이 나옴
		mav.addObject("status", "update");
		mav.addObject("upt", service.read(board_id));
		// view화면은 item/item
		return mav;
	}
	

	// 04-2. 게시글 실제 수정 처리
	// 폼에서 입력한 내용들은 @ModelAttribute Board upt로 전달됨
	@RequestMapping("updateProc.do")
	public String updateProc(@ModelAttribute Board upt, HttpSession session){
		service.update(upt);
		// view화면은 item/item
		return "redirect:list.do?auction_id="+session.getAttribute("auction_id");
	}

	// 05. 게시글 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int board_id, HttpSession session){
		service.delete(board_id);
		// view화면은 item/item
		return "redirect:list.do?auction_id="+session.getAttribute("auction_id");
	}
	
	// 06-1. 답변 화면
	@RequestMapping("reply.do")
	public ModelAndView reply(@RequestParam int board_id, ModelAndView mav, HttpSession session){
		mav.setViewName("item/item");
		// view단에서 status값이 reple이면 답글 작성란이 나옴
		mav.addObject("status", "reple");
		mav.addObject("reply", service.getReply(board_id, session));
		// view화면은 item/item
		return mav;
	}
	
	// 06-2. 답변 실제 등록 처리
	@RequestMapping("replyProc.do")
	public String insertReply(@ModelAttribute Board reply, @RequestParam int board_group, HttpSession session){
		// 세션값 가져와서 변수 선언
		String name = (String) session.getAttribute("name");
		int user_id = (int) session.getAttribute("id");
		int auction_id = (int) session.getAttribute("auction_id");
		// 변수값 컬럼명에 삽입
		reply.setBoard_writer_id(user_id);
		reply.setAuction_id(auction_id);
		reply.setBoard_name(name);
		reply.setBoard_group(board_group);
		service.replyInsert(reply);
		// view화면은 item/item
		return "redirect:list.do?auction_id="+session.getAttribute("auction_id");
	}
	
	@RequestMapping(value="bid.do", method=RequestMethod.POST)
	public String bidding(@RequestParam(value="bid_amount",defaultValue="0") int bid_amount,
			@RequestParam(value="current_bid_amount") int current_bid_amount,
			@RequestParam int auction_id, Item upt, Bid bid, Model m, HttpSession session) throws ParseException{
		
		// 세션값 변수로 선언
		int auctioneer = (int) session.getAttribute("auctioneer_id");
		String name = (String) session.getAttribute("name");
		int id = (int) session.getAttribute("id");
	    // 경매종료 로직(경매마감시간과 현재시간 계산)
	    String nowDate = sdf.format(new Date());
	    Date parseNow = sdf.parse(nowDate);
	    String endDate = sdf.format(service.itemInfo(auction_id).getEnd_date());
	    Date parseEnd = sdf.parse(endDate);
	    long gap = parseEnd.getTime() - parseNow.getTime();
	    
	    // 만약 마감시간-현재시간이 0보다 작거나 같으면
	    if(gap<=0){
	    	m.addAttribute("msg", "경매가 종료되었습니다.");
	    // user id와 판매자 id가 같으면
	    }else if(auctioneer==id){
			m.addAttribute("msg", "자신의 물품에는 입찰할 수 없습니다.");
		// 입찰값이 현재 가격보다 작거나 같으면
		}else if(bid_amount<=current_bid_amount){
			System.out.println(upt.getCurrent_bid_amount());
			m.addAttribute("msg", upt.getCurrent_bid_amount()+"보다 더 높은 가격을 입찰하세요.");
		// 그 외는 입찰 성공
		}else{
			m.addAttribute("msg", name+"님 입찰에 성공하셨습니다!");
			bid.setBidder_id(id);
			// 입찰 테이블에 입찰자 정보가 있으면
			if(service.bidCheck(bid)!=null){
				// 입찰 테이블을 수정
				service.bidUpdate(bid);
			}else{
				// 없을 경우는 insert로 추가
				service.bidInsert(bid);
			}
			// 아이템 테이블에 값 설정한 후 수정SQL 돌리기
			upt.setCurrent_bidder_id(id);
			upt.setCurrent_bidder(name);
			upt.setCurrent_bid_amount(bid_amount);
			service.itemUpdate(upt);
		}
	    // view화면은 item/item
		return "forward:list.do?auction_id="+session.getAttribute("auction_id");
	}

}
