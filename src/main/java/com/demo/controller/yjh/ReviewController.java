
package com.demo.controller.yjh;

import java.util.HashMap; 
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RestController; 
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.review.yjh.ReviewDto; 
import com.demo.service.review.yjh.ReviewService;

@RestController
@RequestMapping("review") 
	public class ReviewController {

	@Autowired 
	ReviewService service;
	
	@GetMapping("get/{r_id}")
	public ReviewDto get(@PathVariable int r_id) {
		
		return service.getByR_id(r_id);
	}
	
	@PutMapping("modify")
	public Map<String, Object> modify(@RequestBody ReviewDto review){
		
		Map<String, Object> map = new HashMap<>();
		
		int cnt = service.modifyReview(review);
		
		if(cnt == 1) {
			map.put("message", "리뷰가 수정되었습니다.");
		} else	{
			map.put("message", "리뷰가 수정되지 않았습니다.");
		}
		
		return map;
	}
	
	@DeleteMapping("remove/{r_id}")
	public Map<String, Object> remove(@PathVariable int r_id){
		Map<String, Object> map = new HashMap<>();
		
		int cnt = service.removeByR_id(r_id);
		
		if(cnt == 1) {
			map.put("message", "리뷰가 삭제되었습니다.");
		} else {
			map.put("message", "리뷰가 삭제되지 않았습니다.");
		}
		
		return map;
	}

	@PostMapping("add") 
	public Map<String, Object> add(@RequestBody ReviewDto review, RedirectAttributes rttr){
		
		Map<String,Object> map = new HashMap<>();
		
		int cnt = service.addReview(review);
		
		if(cnt==1) {
			map.put("message", "리뷰가 등록되었습니다.");
		} else {
			map.put("message", "리뷰가 등록되지 않았습니다.");
		}
		
		return map;
	} 
}
