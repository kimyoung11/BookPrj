package com.demo.domain.book;

import lombok.Data;

@Data
public class UserDto {
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_phone;
	private String u_email;
	private String u_address;
}
