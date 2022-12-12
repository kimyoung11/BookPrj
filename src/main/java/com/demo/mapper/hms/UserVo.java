package com.demo.mapper.hms;

import lombok.ToString;

@ToString
public class UserVo { // 데이터 저장소
	
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_phone; 
	private String u_email;
	private String u_address; 
	
	// User ID
	public String getu_id() {
		return u_id;
	}
	public void setu_id(String u_id) {
		this.u_id = u_id;
	}
	
	// User Password
	public String getu_pw() {
		return u_pw;
	}
	public void setu_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	
	// User Name
	public String getu_name() {
		return u_name;
		
	}
	public void setu_name(String u_name) {
		this.u_name = u_name;
	}
	
	// User Phone
	public String getu_phone() {
		return u_phone;
	}
	public void setu_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	
	// User Email
	public String getu_email() {
		return u_email;
	}
	public void setu_email(String u_email) {
		this.u_email = u_email;
	}
	
	// User Address
	public String getu_address() {
		return u_address;
	}
	public void setu_address(String u_address) {
		this.u_address = u_address;
	}
	
	
	
	
	
		
}
	
	
	