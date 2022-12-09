package com.demo.mapper.hms;

import javax.servlet.http.HttpSession;
import com.demo.mapper.hms.UserVo;

public interface UserDAO { // 인터페이스
		// 01_1. 회원 로그인 체크
		public boolean loginCheck(UserVo vo);
		// 01_2. 회원 로그인 정보
		public  UserVo viewUser(UserVo vo);
		// 02. 회원 로그아웃
		public void logout(HttpSession session);
}
