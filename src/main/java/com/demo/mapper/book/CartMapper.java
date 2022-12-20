package com.demo.mapper.book;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.demo.domain.book.CartDto;

@Mapper
public interface CartMapper {

	public List<CartDto> selectById(String u_id);

	public int insert(int c_count, String u_id, int b_code);

	public int deleteBook(int b_code);


}
