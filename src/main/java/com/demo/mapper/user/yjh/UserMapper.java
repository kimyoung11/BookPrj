package com.demo.mapper.user.yjh;

import java.util.List;

import com.demo.domain.user.yjh.UserDto;

public interface UserMapper {
	
	UserDto selectById(String u_id);

	UserDto selectUserInfo(String u_id);

	UserDto selectUserPageInfo(String id);
	
	int countLikeByUserId(String userId);
	
	int countCartByUserId(String userId);

	int updateUser(UserDto user);
	
	List<UserDto> selectOrderByUser(String u_id);
	
	List<UserDto> selectBookLikeListByUser(String u_id);
	
	List<UserDto> selectReviewListByUser(String u_id);
	
	List<UserDto> selectMakeReviewListByUser(String u_id);
	
	List<UserDto> selectQuestListByUser(String u_id);
	
	UserDto selectDetailOrdersByUser(String u_id);
	
}
