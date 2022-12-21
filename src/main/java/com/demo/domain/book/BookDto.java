package com.demo.domain.book;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BookDto {
	private int b_code;
	private String b_title;
	private String b_writer;
	private String b_pubDate;
	private int b_price;
	private String b_genre;
	private String b_img;
	private int b_like;
	private double star;
	
	
	private boolean b_status;
	private BookLikeDto bookLike_dto;
	private MultipartFile b_file; 
}
