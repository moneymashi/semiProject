/*CREATE TABLE AUCTION_USER
(
   USER_ID            NUMBER (10),
   USER_NAME          VARCHAR2 (100),
   EMAIL              VARCHAR2 (40),
   PASSWORD           VARCHAR2 (20),    
   REGISTER_DATE      DATE DEFAULT SYSDATE,
   AUTH               NUMBER (1) DEFAULT 1,
   USER_POINT         NUMBER (10) DEFAULT 0,
   REAL_NAME          VARCHAR2 (100),
   ADDRESS            VARCHAR2 (100),
   ZIP_CODE           VARCHAR2 (5),
   PHONE_NUMBER       VARCHAR2 (11),
   PICTURE_LOCATION   VARCHAR2 (500)
)
NOCACHE
LOGGING;*/

package com.cto.auction.vo.member;

import java.util.Date;

public class Member {
	private Integer user_id;
	private String user_name;
	private String email;
	private String password;
	private Date register_date;
	private Integer auth;
	private Integer user_point;
	private String real_name;
	private String address;
	private String zip_code;
	private String phone_number;
	private String picture_location;
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Date getRegister_date() {
		return register_date;
	}
	public void setRegister_date(Date register_date) {
		this.register_date = register_date;
	}
	public Integer getAuth() {
		return auth;
	}
	public void setAuth(Integer auth) {
		this.auth = auth;
	}
	public Integer getUser_point() {
		return user_point;
	}
	public void setUser_point(Integer user_point) {
		this.user_point = user_point;
	}
	public String getReal_name() {
		return real_name;
	}
	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getPicture_location() {
		return picture_location;
	}
	public void setPicture_location(String picture_location) {
		this.picture_location = picture_location;
	}
	
	

}
