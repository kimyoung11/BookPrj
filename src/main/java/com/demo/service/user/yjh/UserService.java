package com.demo.service.user.yjh;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.demo.domain.user.yjh.UserDto;
import com.demo.mapper.user.yjh.UserMapper;

@Transactional
@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;

	public UserDto getUserInfo(String id) {
		return userMapper.selectUserInfo(id);
	}

	public UserDto getUserPageInfo(String id) {
		
		return userMapper.selectUserPageInfo(id);
	}
	
	public UserDto getDetailOrderByUser(String id) {
		return userMapper.selectDetailOrdersByUser(id);
	}
	
	public List<UserDto> getOrderByUser(String id) {
		
		return userMapper.selectOrderByUser(id);
	}
	
	public int countLikeByUser(String id) {
		return userMapper.countLikeByUserId(id);
	}
	
	public int countCartByUser(String id) {
		return userMapper.countCartByUserId(id);
	}
	
	public Map<String, Object> updateLike(String userId) {
		
		Map<String, Object> map = new HashMap<>();
		
		int countLikeByUserId = userMapper.countLikeByUserId(userId);
		
		map.put("countLike", countLikeByUserId);
		
		return map;
		
	}

	public int updateUser(UserDto user) {
		
		return userMapper.updateUser(user);
	}
	
	public List<UserDto> getBookLikeList(String id){
		
		return userMapper.selectBookLikeListByUser(id);
	}
	
	public List<UserDto> getReviewList(String id){
		
		return userMapper.selectReviewListByUser(id);
	}
	
	public List<UserDto> getQuestList(String id){
		
		return userMapper.selectQuestListByUser(id);
	}
	
}
