package com.demo.mapper.hms;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberUserMapper {

	int insert(UserVo vo);

	String loginCheck(UserVo vo);
	
	UserVo viewUser(UserVo vo);

	UserVo selectByUserId(String u_id);
	
	UserVo selectByUserPhone(String u_phone);
	
	UserVo selectByUserEmail(String u_email);
}
