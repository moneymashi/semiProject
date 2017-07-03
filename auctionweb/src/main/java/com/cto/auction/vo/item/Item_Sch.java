package com.cto.auction.vo.item;

public class Item_Sch {
	/* 
	 * 0703, 16:22.
	 * 2.2차 작업 - 유저 가격필터적용 및 주석작업완료. - JB.
	 * 
	 */
	//검색 찾기.
	private String schAll;  // 전체검색 - header의 검색기능
	private String schDept;  // 자식카테고리
	private String schParentDept; // 부모카테고리
	
	// filter부분
	private String priceOrder;  // 입찰가격 order by.  
	private String userStartDate;  // 구매자가 조회하고싶은 최소 입찰기간
	private String userEndDate; // 구매자가 조회하고싶은 최대 입찰기간
	private String endDateOrder; // 입찰마감기간 order by
	private String aucStatus; // 입찰상태
	private String minCurrentBidPrice;  // minCurrentBidPrice 유저 최소입찰가격 필터
	private String maxCurrentBidPrice;  // maxCurrentBidPrice 유저 최대입찰가격 필터
	
	//페이징처리
	private int start;  // ROWNUM 시작부분
	private int end;  // ROWNUM 끝부분
	private int curPage; // 현재페이지번호
	private int pageCount;  // 검색결과에따른 페이지수량
	private int pageSize; // 각 페이지당 물품리스트갯수
	private int count;  // 검색결과수
	
	
	public String getMinCurrentBidPrice() {
		return minCurrentBidPrice;
	}
	public void setMinCurrentBidPrice(String minCurrentBidPrice) {
		this.minCurrentBidPrice = minCurrentBidPrice;
	}
	public String getMaxCurrentBidPrice() {
		return maxCurrentBidPrice;
	}
	public void setMaxCurrentBidPrice(String maxCurrentBidPrice) {
		this.maxCurrentBidPrice = maxCurrentBidPrice;
	}
	public String getAucStatus() {
		return aucStatus;
	}
	public void setAucStatus(String aucStatus) {
		this.aucStatus = aucStatus;
	}
	public String getEndDateOrder() {
		return endDateOrder;
	}
	public void setEndDateOrder(String endDateOrder) {
		this.endDateOrder = endDateOrder;
	}
	public String getUserStartDate() {
		return userStartDate;
	}
	public void setUserStartDate(String userStartDate) {
		this.userStartDate = userStartDate;
	}
	public String getUserEndDate() {
		return userEndDate;
	}
	public void setUserEndDate(String userEndDate) {
		this.userEndDate = userEndDate;
	}
	public String getPriceOrder() {
		return priceOrder;
	}
	public void setPriceOrder(String priceOrder) {
		this.priceOrder = priceOrder;
	}
	public String getSchParentDept() {
		return schParentDept;
	}
	public void setSchParentDept(String schParentDept) {
		this.schParentDept = schParentDept;
	}
	public String getSchAll() {
		return schAll;
	}
	public void setSchAll(String schAll) {
		this.schAll = schAll;
	}
	public String getSchDept() {
		return schDept;
	}
	public void setSchDept(String schDept) {
		this.schDept = schDept;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	
}
