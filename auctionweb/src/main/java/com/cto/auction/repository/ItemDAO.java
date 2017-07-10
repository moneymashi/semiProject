package com.cto.auction.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.cto.auction.vo.Item;
import com.cto.auction.vo.Item_Sch;
@Repository
public interface ItemDAO {

	// 모든 검색 핵심 메서드. // 재현 리스트업
	public ArrayList<Item> searchLists(Item_Sch sch);
//	// 아이템 리스트   // 정효형 리스트업.
//	public ArrayList<Item> itemList();
	// 아이템 등록
	public void itemInsert(Item ins);
	// 최고 입찰금액 검색
	public Item highestBid();
	// 최다 조회물품 검색
	public Item highestHit();
	// 랜덤물품 조회
	public Item randomOne();
	// 페이징 처리에 필요.
	public int totCnt(Item_Sch sch);
	
	
}
