package com.cto.auction.service.item;

import java.io.File; 
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.cto.auction.repository.item.ItemDAO;
import com.cto.auction.vo.item.Item;
import com.cto.auction.vo.item.Item_Sch;

@Service
public class ItemService {
	// 로그 확인
	private static final Logger logger = LoggerFactory.getLogger(ItemService.class);
	// servelet.xml에서 bean(임시폴더 경로) 자원 사용
	@Resource(name="tempPath")
	private String tempPath;
	
	@Autowired(required=false)
	private ItemDAO dao;
	
	// 아이템 리스트 // 정효형 리스트업
//	public ArrayList<Item> itemList(){
//		return dao.itemList();
//	}
	
	// 모든 검색처리.
		public ArrayList<Item> searchLists(Item_Sch sch){
			
	/*		private String priceOrder;  // 입찰가격 order by.  
			private String endDateOrder; // 입찰마감기간 order by
	*/		
			// filter - default 선택자.
			
			/*  private int start;
				private int end;
				private int curPage;
				private int pageCount;
				private int pageSize;
				private int count;
			 */
			// 페이징처리
			// 검색결과수 처리.
			sch.setCount(dao.totCnt(sch));  
			// 각 페이지 물품갯수를 지정하지않으면 default로 5개.
			if(sch.getPageSize() ==0) sch.setPageSize(6); 
			// 페이지수계산 - 나머지값이 있으면 무조건 올림 ex) 각페이지당 5개, 검색결과 6개 -> 2페이지.
			sch.setPageCount( (int)Math.ceil(sch.getCount() / (double)sch.getPageSize()) );
			//초기 페이지 설정
			if(sch.getCurPage() ==0 ) sch.setCurPage(1);
			// ROWNUM 시작부분처리
			sch.setStart( (sch.getCurPage() -1)*sch.getPageSize() + 1 );  //첫번째 5.
			// ROWNUM 마지막부분처리
			sch.setEnd( (sch.getCurPage()*sch.getPageSize()) );
			
			
			// 검색결과 처리 - MainMapper.xml참고
			return dao.searchLists(sch);
			
		}
		// 최고입찰가
		public Item highestBid(){
			return dao.highestBid();
		}
		// 최다조회물품
		public Item highestHit(){
			return dao.highestHit();
		}
		// 랜덤 물품조회
		public Item randomOne(){
			return dao.randomOne();
		}
		//페이징처리용
		public int totCnt(Item_Sch sch){
			return dao.totCnt(sch);
		}
	
	// 아이템 등록
	public void itemInsert(Item ins, MultipartFile file) throws IOException{
		//임시저장소에서 이동시킬 경로
		String realPath = "C:/a01_prog/eclipse/workspace_auction/auctionweb/src/main/webapp/resources/upload/";
		// uuid 생성(Universal Unique IDentifier, 범용 고유 식별자)
		UUID uuid = UUID.randomUUID();
		// 파일명 : uuid_기존파일명 ==> 파일명 중복 안되게 처리
        String filename = uuid.toString()+"_"+file.getOriginalFilename();
        // 임시파일(서버 임시저장소)과 타켓파일 설정(워크스페이스내 실제 저장소)
        File temp = new File(tempPath+filename);
        File target = new File(realPath+filename);
        // 임시폴더에 파일 저장
        file.transferTo(temp);
        // 임시폴더 내의 파일을 실제 경로로 저장
        FileCopyUtils.copy(temp, target);
        // 경로확인 로그
        logger.info("파일이름 :"+file.getOriginalFilename());
        logger.info("파일크기 : "+file.getSize()/1024+"kb");
        logger.info("컨텐트 타입 : "+file.getContentType());
        logger.info("임시파일 경로:"+temp.getPath());
        logger.info("타겟파일 경로:"+target.getPath());
		// 파일이름을 테이블 컬럼에 설정
		ins.setPicture_location(filename);
		dao.itemInsert(ins);
	}
/*
	public void copy(File temp, File target) throws IOException{
		FileInputStream in = new FileInputStream(temp);
		FileOutputStream out = new FileOutputStream(target);
		byte[] buff = new byte[1024*8];
		int inRead;
		while( (inRead=in.read(buff))!=-1){
			out.write(buff, 0, inRead);
		}
		in.close();
		out.close();
	}*/
	
	
	
	
	
	
	
}
