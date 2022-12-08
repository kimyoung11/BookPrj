package com.demo.service.book;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.book.BookDto;
import com.demo.mapper.book.BookMapper;

@Service
public class BookService {

	@Autowired
	private BookMapper bookMapper;
	
	public List<BookDto> listBoard() {
		
		return bookMapper.list();
	}
	
	public List<BookDto> getByGenre(String b_genre){
		return bookMapper.selectByGenre(b_genre);
	}

	public BookDto getByCode(int b_code) {
		// TODO Auto-generated method stub
		return bookMapper.selectByCode(b_code);
	}

	public List<BookDto> getByDate() {
		// TODO Auto-generated method stub
		return bookMapper.selectByDate();
	}

	public int addLike(Integer b_code, String u_id) {
		return bookMapper.insertLike(b_code, u_id);
	}

	public int removeLike(Integer b_code, String u_id) {
		return bookMapper.deleteLike(b_code,u_id);
	}

	public int getLikeCount(int b_code, String u_id) {
		return bookMapper.selectLikeCount(b_code,u_id);
	}

	public int addBookLike(Integer b_code) {
		return bookMapper.updateBookLike(b_code);
	}

	public int getBookLike(Integer b_code) {
		return bookMapper.selectBookLike(b_code);
	}

	public List<Map<String, Object>> autocomplete(String b_title) {
		/* System.out.println(paramMap.get("label")); */
		return bookMapper.autoComplete(b_title);
	}

	public List<BookDto> newBookList() {
		return bookMapper.selectNewBook();
	}

	public List<BookDto> ranBookList() {
		return bookMapper.selectRanBook();
	}

	



}
