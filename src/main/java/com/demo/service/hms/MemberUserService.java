package com.demo.service.hms;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.demo.mapper.hms.MemberUserMapper;
import com.demo.mapper.hms.UserVo;

@Service // 현재 클래스를 스프링에서 관리하는 service bean으로 등록
public class MemberUserService { // 인터페이스 구현

	@Autowired
	MemberUserMapper mapper;

	// 01_1 회원 로그인 체크
	public boolean loginCheck(UserVo vo, HttpSession session) {
		String result = mapper.loginCheck(vo);
		if (result != null) { // true일 경우 session에 등록
			UserVo vo2 = viewUser(vo);
			// 세션 변수 등록
			session.setAttribute("u_id", vo2.getu_id());
			session.setAttribute("u_name", vo2.getu_name());
		}
		return result != null;
	}

	// 01_2 회원 로그인 정보
	public UserVo viewUser(UserVo vo) {
		return mapper.viewUser(vo);
	}

	// 02 회원 로그아웃
	public void logout(HttpSession session) {
		// session 변수 개별 삭제
		// session.removeAttribute("userID");
		// session 정보 초기화
		session.invalidate();
	}

	// 03. 회원가입
	public int insert(UserVo vo) {
		System.out.println(vo);
		return mapper.insert(vo);
	}

	// 04. 아이디 중복 확인
	public UserVo getByu_id(String u_id) {
		return mapper.selectByUserId(u_id);
	}

	// 05. 전화번호 중복 확인
	public UserVo getByu_phone(String u_phone) {
		return mapper.selectByUserPhone(u_phone);
	}

	// 06. 이메일 중복 확인
	public UserVo getByu_email(String u_email) {
		return mapper.selectByUserEmail(u_email);
	}

	// 07. 아이디 찾기
	public UserVo findID(UserVo vo) {
		return mapper.findID(vo);
	}

	// 08. 비밀번호 찾기, 수정
	public UserVo findPassword(UserVo vo) {
		return mapper.findPassword(vo);
	}

	// 09. 비밀번호 수정
	public int updatePassword(UserVo vo) {
		return mapper.updatePassword(vo);
	}

}
