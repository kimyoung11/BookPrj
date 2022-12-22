package com.demo.mapper.customer;

import java.util.List;

import com.demo.domain.customer.NoticeDto;
import com.demo.domain.customer.QuestionDto;

public interface NoticeMapper {
	/* 공지사항 추가하기 */
	int insert(NoticeDto notice);

	/* list content 보여주기 */
	NoticeDto select(int n_id);
	
	// 이전글 다음글 제목 보여주기
	List<String> selectN_title();

	/* pagination */
	List<NoticeDto> noticeList(int offset, int records);

	int allCount();

	int update(NoticeDto notice);

	int delete(int id);
	
	List<Integer> selectN_idList();

}