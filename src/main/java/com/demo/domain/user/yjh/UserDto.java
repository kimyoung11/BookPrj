package com.demo.domain.user.yjh;

import java.sql.Date;
import java.time.LocalDate;
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

	private int o_number;
	private int o_count;
	private int o_total;
	private int o_status_ready;
	private int o_status_start;
	private int o_status_ing;
	private int o_status_complete;
	
	private String r_content;
	private int r_star;
	private int r_id;
	
	@JsonFormat(shape = Shape.STRING)
	private LocalDate o_date;
	
	private String o_status;
	
	private String b_title;
	private int b_code;
    private int b_price;
    private String b_img;
    private String b_genre;
    private int b_like;
	
	private String q_title;
	private String q_content;
	private String q_option;
	@JsonFormat(shape = Shape.STRING)
	private LocalDateTime q_date;
}
