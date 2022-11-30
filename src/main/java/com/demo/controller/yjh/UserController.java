package com.demo.controller.yjh;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.user.yjh.UserDto;
import com.demo.service.user.yjh.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService service;
	
	
//	@PutMapping("like")
//	@ResponseBody
//	public Map<String, Object> like(@RequestBody Map<String, String> req){
//		
//		Map<String, Object> result = service.updateLike(req.get("userId"), "userID");
//		
//		
//	}
	@GetMapping("myPage")
	public void getUserPage(String id, Model model) {
		
		UserDto user = service.getUserPageInfo(id);
		
		List<UserDto> orders = service.getOrderByUser(id);
		
		List<UserDto> bookLikeList = service.getBookLikeList(id);
		
		List<UserDto> reviewList = service.getReviewList(id);
		
		List<UserDto> questList = service.getQuestList(id);
		
		//user 정보 보내기	
		model.addAttribute("user",user);
		//user 주문내역 보내기
		model.addAttribute("orderList", orders);
		//user 좋아요 리스트
		model.addAttribute("likeList", bookLikeList);
		//user 리뷰 리스트
		model.addAttribute("reviewList", reviewList);
		//user 문의 리스트
		model.addAttribute("questList", questList);
		
	}
	
	@GetMapping("editInfo")
	public void getUserInfo(String id, Model model) {
		
		UserDto user = service.getUserInfo(id);
		
		model.addAttribute("user", user);
	}
	
	@PostMapping("editInfo")
	public String editUserInfo(UserDto user, RedirectAttributes rttr) {
		
		
		service.updateUser(user);
		
		rttr.addAttribute("id", user.getId());

		return "redirect:/user/editInfo";
	}
}
