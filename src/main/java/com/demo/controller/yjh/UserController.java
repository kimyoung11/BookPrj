package com.demo.controller.yjh;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.demo.domain.user.yjh.UserDto;
import com.demo.service.user.yjh.UserService;

@Controller
@RequestMapping("user/yjh")
public class UserController {
	@Autowired
	private UserService service;

	
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

	@GetMapping("editInfo")
	public void getUserInfo(String u_id, Model model) {

		UserDto user = service.getUserInfo(u_id);

		model.addAttribute("user", user);
	}

	@PostMapping("editInfo")
	public String editUserInfo(UserDto user, RedirectAttributes rttr) {

		service.updateUser(user);

		rttr.addAttribute("u_id", user.getU_id());

		return "redirect:/user/yjh/editInfo";
	}
}
