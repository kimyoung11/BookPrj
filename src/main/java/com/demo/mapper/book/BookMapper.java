package com.demo.mapper.book;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.demo.domain.book.BookDto;
import com.demo.domain.book.CartDto;

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

	
	
}
