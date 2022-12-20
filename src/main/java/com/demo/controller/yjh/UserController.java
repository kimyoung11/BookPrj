package com.demo.controller.yjh;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.customer.QuestionDto;
import com.demo.domain.review.yjh.ReviewDto;
import com.demo.domain.user.yjh.UserDto;
import com.demo.mapper.hms.UserVo;
import com.demo.service.hms.MemberUserService;
import com.demo.service.user.yjh.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired // @Inject를 대신함
	MemberUserService memberUserService;
	
	@Autowired
	private UserService service;
	
	
	// 회원정보수정 이메일 중복확인
	@PostMapping("changeEmail")
	@ResponseBody
	public Map<String, Object> changeEmail(@RequestBody Map<String, String> req){
		Map<String, Object> map = new HashMap<>();
		
		UserDto user = service.getEmail(req.get("email"));
		
		if(user == null) {
			map.put("status", "not change");
			map.put("message", "사용 가능한 이메일입니다.");
		} else {
			map.put("status", "change");
			map.put("message", "이미 존재하는 이메일입니다.");
		}
		
		return map;
	}
	
	// 마이페이지 좋아요 리스트
	@GetMapping("bookLikeList/{u_id}")
	@ResponseBody
	public List<UserDto> getUserBookLike(@PathVariable String u_id){
		
		return service.getBookLikeList(u_id);
	}
	
	// 마이페이지 주문 리스트
	 @GetMapping("orderList/{u_id}")
	 @ResponseBody
	 public List<UserDto> getUserOrderPage(@PathVariable String u_id) {
	 
		 return service.getOrderByUser(u_id);
	 
	 }
	 

	// 마이페이지 유저정보
	 @GetMapping("myPage") 
	 public void getUserPageInfo(HttpSession session, Model model) {
	 
	 String u_id = (String)session.getAttribute("id");
	 UserDto user = service.getUserPageInfo(u_id);
	 model.addAttribute("user", user);
	 
	 }
	 
	// 마이페이지 문의 확인
	 @GetMapping("userAnswer")
	 public void getQuest(int q_number, Model model) {
		 
		 QuestionDto quest = service.getAnswer(q_number);
		 
		 model.addAttribute("questContent", quest);
	 }
	 
	 // 마이페이지 리뷰 리스트
	 @GetMapping("reviewList/{u_id}")
	 @ResponseBody
	 public List<UserDto> getUserReviewList(@PathVariable String u_id) {
	 
		 return service.getReviewList(u_id);
	 
	 }
	 
	
	 // 마이페이지 작성 가능한 리뷰 리스트
	  @GetMapping("makeReviewList/{u_id}")
	  @ResponseBody
	  public List<UserDto> getUserMakeReviewPage(@PathVariable String u_id) {
	  
	  return service.getMakeReviewList(u_id);
	  
	  }
	 
	  // 마이페이지 문의 리스트
	@GetMapping("questList/{u_id}")
	@ResponseBody
	public List<UserDto> getUserQuestList(@PathVariable String u_id) {
		 
		return service.getQuestList(u_id);
		 
	}
	// 마이페이지 회원정보 수정에 회원정보 얻기
	@GetMapping("editInfo/{u_id}")
	@ResponseBody
	public UserDto getUserInfo(@PathVariable String u_id) {

		return service.getUserInfo(u_id);
		
	}
	
	// 마이페이지 회원정보수정 
	@PutMapping("editInfo")
	@ResponseBody
	public Map<String, Object> editInfo(@RequestBody UserDto user) {
		
		Map<String, Object> map = new HashMap<>();
		
		int cnt = service.updateUser(user);

		if(cnt==1) {
			map.put("message", "회원정보가 수정되었습니다.");
		} else {
			map.put("message", "회원정보가 수정되지 않았습니다.");
		}
		
		return map;
	}
	//합치는 라인
	
	
	

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
			mav.setViewName("redirect:/book/main");
			/* mav.addObject("id", vo.getu_id()); */
			session.setAttribute("id", vo.getu_id());
		} else { // 로그인 실패 시 // login.jsp로 이동 mav.setViewName("user/login");
			mav.setViewName("redirect:/user/login.do");
			/* mav.addObject("msg", "failure"); */
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
		mav.setViewName("redirect:/book/main");
		/* mav.addObject("msg", "logout"); */
		
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
	
	// 08. 아이디 찾기 
	@RequestMapping("/findID.do")
	public String findID() {
		return "/user/findID";
	}

}
