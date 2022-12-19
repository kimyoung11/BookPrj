package com.demo.mapper.book;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.demo.domain.book.BookDto;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;


@Mapper
public interface BookMapper {

	public List<BookDto> list();

	public BookDto selectByCode(int b_code);

	public Page<BookDto> selectByGenre(String b_genre);

	public Page<BookDto> selectByDate();

	public int insertLike(int b_code,String u_id);

	public int deleteLike(int b_code, String u_id);

	public int selectLikeCount(int b_code, String u_id);

	public int updateBookLike(int b_code);

	public int selectBookLike(int b_code);

	public List<Map<String, Object>> autoComplete(String b_title);

	public List<BookDto> selectNewBook();

	public List<BookDto> selectRanBook();

	public int insertBook(BookDto bookDto);

	public List<BookDto> selectBookList();

	public int updateBook(BookDto bookDto);

	public int deleteBook(int b_code);

	public int countBook();
	
	public Page<BookDto> selectAllBook();

	public Page<BookDto> selectBookByGenre(String b_genre);

	public int deleteBookLike(int b_code);

}
