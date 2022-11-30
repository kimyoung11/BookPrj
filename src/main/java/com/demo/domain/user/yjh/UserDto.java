package com.demo.domain.user.yjh;

import java.sql.Date;

import lombok.Data;

@Data
public class UserDto {
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String address;
	
	private int countLike;
	private int countCart;

	private int orderNum;
	private int orderCount;
	
	private String reviewContent;
	private int reviewStar;
	
	private String orderDate;
	private String orderStatus;
	
	private String bookTitle;
	
	private String q_title;
	private String q_content;
	private String q_date;
}
