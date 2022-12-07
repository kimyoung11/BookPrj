package com.demo.mapper.book;

import org.apache.ibatis.annotations.Mapper;

import com.demo.domain.book.UserDto;

@Mapper
public interface UserMapper {

	UserDto selectById(String u_id);

}
