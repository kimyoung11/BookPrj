package com.demo.mapper.hms;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.demo.mapper.hms.UserVo;

@Repository // 현재 클래스를 스프링에서 관리하는 dao bean으로 등록
public class UserDAOImpl implements UserDAO { // 인터페이스 구현
	// SQLSession 객체를 Spring에서 생성하여 주입
	// Dependency Injection 주입. 느슨한 결합(Injection을 Autowired로 대체)
	
	@Autowired
	SqlSession sqlSession; // mybatis 실행 객체
	
	// 01_1. 회원 로그인 체그
	public boolean loginCheck(UserVo vo) {
		String name = sqlSession.selectOne("user.loginCheck", vo);
		return (name == null) ? false : true;
	}
	
	// 01_2. 회원 로그인 정보
	@Override
	public UserVo viewUser(UserVo vo) {
		return sqlSession.selectOne("user.viewUser", vo);
	}
	
	// 02. 회원 로그아웃
	@Override
	public void logout(HttpSession session) {
		
	}
	
}






