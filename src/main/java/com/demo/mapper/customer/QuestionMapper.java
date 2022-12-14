package com.demo.mapper.customer;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.demo.domain.customer.QuestionDto;

public interface QuestionMapper {

	int insert(QuestionDto question);

	QuestionDto select(int q_number);

	List<QuestionDto> getList(int offset, int records);

	int allCount();

	int add(QuestionDto quest);

	List<QuestionDto> answerSelect(int q_number);

	int insertFile(int q_number, String fileName);
}