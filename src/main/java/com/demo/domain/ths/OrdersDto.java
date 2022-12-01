package com.demo.domain.ths;

import java.time.LocalDateTime;

import lombok.Data;
@Data
public class OrdersDto {
	private int o_number;
	private int o_count;
	private LocalDateTime o_date;
	private String o_status;
	private String b_title;
	private String u_name;
	private int b_price;
	
}
