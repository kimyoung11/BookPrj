package com.demo.mapper.customer;

import java.util.List;

import com.demo.domain.customer.NoticeDto;

public interface NoticeMapper {

	int insert(NoticeDto notice);

	NoticeDto select(int n_id);

	/* pagination */
	
	List<NoticeDto> noticeList(int offset, int records, String type, String keyword);

	int allCount(String type, String keyword);



	
}
