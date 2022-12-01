package com.demo.service.customer;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.customer.NoticeDto;
import com.demo.domain.customer.pageInfo;
import com.demo.mapper.customer.NoticeMapper;
import com.study.domain.board.PageInfo;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper mapper;
	
//  공지사항 추가하기
	public void noticeRegister(NoticeDto notice) {
		mapper.insert(notice);
		
	}

	/*
	 * public List<NoticeDto> listNotice() { return mapper.noticeList(); }
	 */	

	public NoticeDto listContent(int n_id) {
		return mapper.select(n_id);
	}

	public List<NoticeDto> listNotice(int page, String type, String keyword, PageInfo pageInfo) {
		int records = 10;
		int offset = (page -1) * records;
		
		int allCount = mapper.allCount(type, "%" + keyword + "%");
		int lastPage = (allCount - 1) / records + 1;
		
		pageInfo.setLastPageNumber(lastPage);
		
		int leftPageNumber = (page - 1) / 10 * 10 + 1;
		int rightPageNumber = leftPageNumber + 9;
		rightPageNumber = Math.min(rightPageNumber, lastPage);
		
		// 이전버튼 유무
		boolean hasPrevButton = page > 10;
		// 다음버튼 유무
		boolean hasNextButton = page <= ((lastPage - 1) / 10 * 10);
		
		// 이전버튼 눌렀을 때 가는 페이지 번호
		int jumpPrevPageNumber = (page - 1) / 10 * 10 - 9;
		int jumpNextPageNumber = (page - 1) / 10 * 10 + 11; 
		
		pageInfo.setHasPrevButton(hasPrevButton);
		pageInfo.setHasNextButton(hasNextButton);
		pageInfo.setJumpPrevPageNumber(jumpPrevPageNumber);
		pageInfo.setJumpNextPageNumber(jumpNextPageNumber);
		pageInfo.setCurrentPageNumber(page);
		pageInfo.setLeftPageNumber(leftPageNumber);
		pageInfo.setRightPageNumber(rightPageNumber);
		pageInfo.setLastPageNumber(lastPage);
		
		return mapper.noticeList(offset, records, type, "%" + keyword + "%");
	}


}
