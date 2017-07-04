package com.cto.auction.repository.board;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cto.auction.vo.bid.Bid;
import com.cto.auction.vo.board.Board;
import com.cto.auction.vo.item.Item;

@Repository
public interface BoardDAO {
	//	게시판 리스트
	public ArrayList<Board> boardList(Map<String, Object> map);
	// 게시판 읽기
	public Board read(int board_id);
	// 게시글 작성
	public void insert(Board ins);
	// 게시글 수정
	public void update(Board upt);
	// 게시글 삭제
	public void delete(int board_id);
	// 게시글 조회수 증가
	public void increaseHit(int board_id);
	// 게시글 갯수 확인
	public int countBoard(Map<String, Object> map);
	// 리플 달기
	public void insertReply(Board reply);
	// 리플 모양
	public void shapeReply(Board shape);
	// 물품상세정보
	public Item itemInfo(int auction_id);
	// 입찰테이블에 입찰자가 있는지 없는지 확인
	public Bid bidCheck(Bid bid);
	// 입찰시 아이템테이블 비드값, 비드아이디 수정
	public void itemUpdate(Item upt);
	// 입찰로그 확인
	public ArrayList<Bid> bidList(int auction_id);
	// 첫입찰자면 비드테이블 값 추가
	public void bidInsert(Bid bid);
	// 기존 입찰자면 비드테이블 값 수정
	public void bidUpdate(Bid bid);
	// 아이템 리스트에서 클릭시 조회수 1 증가
	public void itemHit(int auction_id);
	// 경매종료시 아이템 상태 변경
	public void changeStaus(int auction_id);
}
