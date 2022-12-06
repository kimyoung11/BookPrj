package com.demo.domain.customer;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class QuestionDto {
	private int q_number;
	private String q_title;
	private String q_content;
	private LocalDateTime q_date;
	private String q_img;
	private String u_id;
}
