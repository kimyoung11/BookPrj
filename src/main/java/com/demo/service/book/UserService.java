package com.demo.service.book;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.domain.book.UserDto;
import com.demo.mapper.book.UserMapper;

@Service
public class UserService {

	@Autowired
	UserMapper userMapper;

	public UserDto getById(String u_id) {
		return userMapper.selectById(u_id);
	}
}
