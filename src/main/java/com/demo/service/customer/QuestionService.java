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
	
	public void questInsert(QuestionDto question) {
		mapper.insert(question);
	}

	public  List<QuestionDto> questList() {
		return mapper.getList();
	}

}
