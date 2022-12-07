package com.demo.domain.user.yjh;

import java.sql.Date;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.Data;

@Data
public class UserDto {
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_phone;
	private String u_email;
	private String u_address;
	
	private int countLike;
	private int countCart;

	private int o_id;
	private int o_count;
	
	private String r_content;
	private int r_star;
	private int r_id;
	
	@JsonFormat(shape = Shape.STRING)
	private LocalDateTime o_date;
	
	private String o_status;
	
	private String b_title;
	private int b_code;
	
	private String q_title;
	private String q_content;
	
	@JsonFormat(shape = Shape.STRING)
	private LocalDateTime q_date;
}
