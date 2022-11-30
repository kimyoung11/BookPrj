package com.demo.mapper.user.yjh;

import java.util.List;

import com.demo.domain.user.yjh.UserDto;

public interface UserMapper {

	UserDto selectUserInfo(String id);

	UserDto selectUserPageInfo(String id);
	
	int countLikeByUserId(String userId);
	
	int countCartByUserId(String userId);

	int updateUser(UserDto user);
	
	List<UserDto> selectOrderByUser(String id);
	
	List<UserDto> selectBookLikeListByUser(String id);
	
	List<UserDto> selectReviewListByUser(String id);
	
	List<UserDto> selectQuestListByUser(String id);
	
	UserDto selectDetailOrdersByUser(String id);
	
}
