package com.demo.domain.ths;

import java.time.LocalDate;

import lombok.Data;
@Data
public class OrdersDto {
	private int o_number;
	private int o_count;
	private LocalDate o_date;
	private String o_status;
	private String b_title;
	private String u_name;
	private int b_price;
	private String u_id;
	private String b_img;
	private int od_count;
	private int o_total;
	private int b_code;
}
