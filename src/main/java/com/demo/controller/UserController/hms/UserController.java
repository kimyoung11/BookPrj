package com.demo.controller.UserController.hms;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.mapper.hms.MemberUserMapper;
import com.demo.mapper.hms.UserVo;
import com.demo.service.hms.MemberUserService;

@Controller // 현재 클래스를 Spring에서 관리하는 Controller bean 생성
@RequestMapping("/user/*") // 모든 Mapping은 /user/를 상속
public class UserController { // 로그인, 로그아웃 매핑
	// 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired // @Inject를 대신함
	MemberUserService memberUserService;

	// 01. 로그인 화면

	/* @RequestMapping("/login.do") public String login() { return "login"; } */

	@RequestMapping("/login.do")
	public String login() {
		return "user/login";
		// views/user/login.jsp로 포워드
	}

	// 02. 로그인 처리

	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute UserVo vo, HttpSession session) {
		boolean result = memberUserService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if (result == true) { // 로그인 성공 시 // main.jsp로 이동
			mav.setViewName("book/main");
			mav.addObject("msg", "success");
		} else { // 로그인 실패 시 // login.jsp로 이동 mav.setViewName("user/login");
			mav.setViewName("user/fail");
			mav.addObject("msg", "failure");
		}
		return mav;
	}
	// 로그인 버튼 클릭시 loginCheck.do에서 요청이 오고 controller에서 처리
	// 사용자가 받아온 값을 vo를 통해 mapper에 넘기고 반환값을 vo에 담는다

		
	// 03. 로그아웃 처리 시

	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		memberUserService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("book/main");
		mav.addObject("msg", "logout");
		
		return mav;
	}

	// 04. 회원가입 처리
	@GetMapping("signup") // 해당 경로로 올 떄 signup으로 forward
	public void signup() {

	}

	@PostMapping("signup") // @ModelAttribute은 생략 가능
	public String signup(@ModelAttribute UserVo vo, RedirectAttributes rttr) {
		System.out.println(vo); // 작동 되는지 확인

		int cnt = memberUserService.insert(vo);
		
		// 가입 성공
		rttr.addFlashAttribute("message", "회원가입 되었습니다.");
		return "book/main";
	}

	// 05. 아이디 중복 확인
	@GetMapping("existId/{u_id}")
	@ResponseBody
	public Map<String, Object> existId(@PathVariable String u_id) {
		Map<String, Object> map = new HashMap<>();

		UserVo vo = memberUserService.getByu_id(u_id);

		if (vo == null) {
			map.put("status", "not exist");
			map.put("message", "사용가능한 아이디입니다.");
		} else {
			map.put("status", "exist");
			map.put("message", "이미 존재하는 아이디입니다.");
		}

		return map;
	}

	// 06. 전화번호 중복 확인
	@GetMapping("existPhone/{u_phone}")
	@ResponseBody
	public Map<String, Object> existPhone(@PathVariable String u_phone) {
		Map<String, Object> map = new HashMap<>();

		UserVo vo = memberUserService.getByu_phone(u_phone);

		if (vo == null) {
			map.put("status", "not exist");
			map.put("message", "사용가능한 전화번호입니다.");
		} else {
			map.put("status", "exist");
			map.put("message", "이미 존재하는 전화번호입니다.");
		}

		return map;
	}

	// 07. 이메일 중복 확인
	@GetMapping("existEmail/{u_email}")
	@ResponseBody
	public Map<String, Object> existEmail(@PathVariable String u_email) {
		Map<String, Object> map = new HashMap<>();

		UserVo vo = memberUserService.getByu_email(u_email);

		if (vo == null) {
			map.put("status", "not exist");
			map.put("message", "사용가능한 이메일입니다.");
		} else {
			map.put("status", "exist");
			map.put("message", "이미 존재하는 이메일입니다.");
		}

		return map;
	}

}
