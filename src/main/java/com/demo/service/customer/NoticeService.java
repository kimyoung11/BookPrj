package com.demo.service.customer;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.customer.NoticeDto;
import com.demo.domain.customer.PageInfo;
import com.demo.mapper.customer.NoticeMapper;

@Service
public class NoticeService {

	@Autowired
	private NoticeMapper mapper;
	
//  공지사항 추가하기
	public void noticeRegister(NoticeDto notice) {
		mapper.insert(notice);
		
	}

	
	/* get이랑 겹침 */
	 public NoticeDto listContent(int n_id) { return mapper.select(n_id); }
	 
	
	
	/* 수정하기 데이터 가져오기 */
	public NoticeDto get(int n_id) {
		return mapper.select(n_id);
	}


	/* LIST pagination */
	public List<NoticeDto> listNotice(int page, PageInfo pageInfo) {
		int records = 10;
		int offset = (page -1) * records;
		
		int allCount = mapper.allCount();
		int lastPage = (allCount - 1) / records + 1;
		
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
		
		return mapper.noticeList(offset, records);
	}
    
	/* 데이터 수정하기 */
	public int updateList(NoticeDto notice) {
		return mapper.update(notice);
	}


	public int remove(int id) {
		return mapper.delete(id);
		
	}








}
