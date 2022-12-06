package com.demo.service.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.customer.QuestionDto;
import com.demo.mapper.customer.QuestionMapper;

@Service
public class QuestionService {

	@Autowired
	private QuestionMapper mapper;
	
	/* 1:1 문의 추가 */
	public void questInsert(QuestionDto question) {
		mapper.insert(question);
	}
	
	/* 1:1 문의 리스트 */
	public  List<QuestionDto> questList() {
		return mapper.getList();
	}
	
	/* 1:1 문의 내용 보기 */
	public QuestionDto ContentList(int q_number) {
		return mapper.select(q_number);
	}

}
