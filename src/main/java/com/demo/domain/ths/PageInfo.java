package com.demo.domain.ths;

import lombok.Data;

@Data
public class PageInfo {

	private int lastPageNumber;
	private int leftPageNumber;
	private int rightPageNumber;
	private int currentPageNumber;	
	private int prePageNumber;
	private int nextPageNumber;
		
}
