/*CREATE TABLE AUCTION_BOARD
(
   AUCTION_ID        NUMBER (10),
   BOARD_ID          NUMBER (10),
   BOARD_TITLE       VARCHAR2 (100),
   BOARD_WRITER_ID   NUMBER (10),
   BOARD_NAME        VARCHAR2 (100),
   BOARD_CONTENT     VARCHAR2 (3000),
   BOARD_GROUP       NUMBER (4),
   BOARD_HIT         NUMBER (4) DEFAULT 0,
   BOARD_STEP        NUMBER (4) DEFAULT 0,
   BOARD_INDENT      NUMBER (4) DEFAULT 0,
   BOARD_DATE        DATE DEFAULT SYSDATE
)
NOCACHE
LOGGING;*/
package com.cto.auction.vo;

import java.util.Date;

public class Board {
	private int board_no;
	private int auction_id;
	private int board_id;
	private String board_title;
	private int board_writer_id;
	private String board_name;
	private String board_content;
	private int board_group;
	private int board_hit;
	private int board_step; 
	private int board_indent;
	private Date board_date;
	
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public int getAuction_id() {
		return auction_id;
	}
	public void setAuction_id(int auction_id) {
		this.auction_id = auction_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	
	public int getBoard_writer_id() {
		return board_writer_id;
	}
	public void setBoard_writer_id(int board_writer_id) {
		this.board_writer_id = board_writer_id;
	}
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getBoard_group() {
		return board_group;
	}
	public void setBoard_group(int board_group) {
		this.board_group = board_group;
	}
	public int getBoard_hit() {
		return board_hit;
	}
	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}
	public int getBoard_step() {
		return board_step;
	}
	public void setBoard_step(int board_step) {
		this.board_step = board_step;
	}
	public int getBoard_indent() {
		return board_indent;
	}
	public void setBoard_indent(int board_indent) {
		this.board_indent = board_indent;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	
	
}
