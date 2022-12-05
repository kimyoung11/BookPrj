package com.demo.mapper.book;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.demo.domain.book.BookDto;


@Mapper
public interface BookMapper {

	public List<BookDto> list();

	public BookDto selectByCode(int b_code);

	public List<BookDto> selectByGenre(String b_genre);

	public List<BookDto> selectByDate();

	public int insertLike(int b_code,String u_id);

	public int deleteLike(int b_code, String u_id);

	public int selectLikeCount(int b_code, String u_id);

	public int updateBookLike(int b_code);

	public int selectBookLike(int b_code);

	public List<Map<String, Object>> autoComplete(Map<String, Object> paramMap);

	
	
}
