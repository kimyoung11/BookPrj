package com.demo.mapper.customer;

import java.util.List;

import com.demo.domain.customer.QuestionDto;

public interface QuestionMapper {

	int insert(QuestionDto question);

	 List<QuestionDto> getList();
}
