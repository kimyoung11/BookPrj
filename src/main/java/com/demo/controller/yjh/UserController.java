package com.demo.controller.yjh;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.review.yjh.ReviewDto;
import com.demo.domain.user.yjh.UserDto;
import com.demo.service.user.yjh.UserService;

@Controller
@RequestMapping("user/yjh")
public class UserController {
	@Autowired
	private UserService service;
	
	
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
	
	@GetMapping("bookLikeList/{u_id}")
	@ResponseBody
	public List<UserDto> getUserBookLike(@PathVariable String u_id){
		
		return service.getBookLikeList(u_id);
	}
	
	 @GetMapping("orderList/{u_id}")
	 @ResponseBody
	 public List<UserDto> getUserOrderPage(@PathVariable String u_id) {
	 
		 return service.getOrderByUser(u_id);
	 
	 }
	 

	
	 @GetMapping("myPage") 
	 public void getUserPageInfo(String id, Model model) {
	  
	 UserDto user = service.getUserPageInfo(id);
	 
	 model.addAttribute("user", user);
	 
	 }
	 

	 @GetMapping("reviewList/{u_id}")
	 @ResponseBody
	 public List<UserDto> getUserReviewList(@PathVariable String u_id) {
	 
		 return service.getReviewList(u_id);
	 
	 }

	
	  @GetMapping("makeReviewList/{u_id}")
	  @ResponseBody
	  public List<UserDto> getUserMakeReviewPage(@PathVariable String u_id) {
	  
	  return service.getMakeReviewList(u_id);
	  
	  }
	 

	@GetMapping("questList/{u_id}")
	@ResponseBody
	public List<UserDto> getUserQuestList(@PathVariable String u_id) {
		 
		return service.getQuestList(u_id);
		 
	}

	@GetMapping("editInfo/{u_id}")
	@ResponseBody
	public UserDto getUserInfo(@PathVariable String u_id) {

		return service.getUserInfo(u_id);
		
	}
	

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
	
}
