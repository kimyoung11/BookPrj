package com.demo.domain.customer;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Data;

@Data
public class NoticeDto {
	private int n_id;
	private String n_title;
	private String n_content;
	private LocalDate n_date;
	private String u_id;
	
	
	
}
