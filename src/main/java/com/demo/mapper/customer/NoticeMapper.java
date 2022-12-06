package com.demo.mapper.customer;

import java.util.List;

import com.demo.domain.customer.NoticeDto;

public interface NoticeMapper {
	/* 공지사항 추가하기 */
	int insert(NoticeDto notice);

	/* list content 보여주기 */
	NoticeDto select(int n_id);
	

	/* pagination */
	List<NoticeDto> noticeList(int offset, int records);

	int allCount();

	int update(NoticeDto notice);

	int delete(int id);
}
