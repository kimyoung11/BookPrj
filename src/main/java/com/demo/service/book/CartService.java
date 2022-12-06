package com.demo.service.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.book.CartDto;
import com.demo.mapper.book.CartMapper;


@Service
public class CartService {
	
	@Autowired
	private CartMapper cartMapper;

	public List<CartDto> getById(String u_id) {
		return cartMapper.selectById(u_id);
	}

	public int insertToCart(int c_cnt, String u_id, int b_code) {
		int c_count = c_cnt;
		return cartMapper.insert(c_count,u_id,b_code);
	}




}
