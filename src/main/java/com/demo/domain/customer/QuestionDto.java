package com.demo.domain.customer;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.Data;

@Data
public class QuestionDto {
	private int q_number;
	private String q_title;
	private String q_content;
	private LocalDateTime q_date;
	private String q_img;
	private String u_id;
	
	
	/* answer */
	private int a_id;
	private String ad_id;
	private String a_content;
	
	/* 날짜 json 스트링 형식으로 변경 */
	@JsonFormat(shape = Shape.STRING)
	private LocalDateTime a_date;

}
