package com.demo.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.domain.customer.NoticeDto;
import com.demo.domain.customer.PageInfo;
import com.demo.service.customer.NoticeService;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private NoticeService service;

	@GetMapping("noticeRegister")
	public void ad_notice() {

	}
	
	/* 공지사항 추가 */
	@PostMapping("noticeRegister")
	public String noticeInsert(NoticeDto notice) {
		
		service.noticeRegister(notice);
		
		return "redirect:/admin/notice";

	}
	
	/* 공지사항 리스트 보여주기 */
	@GetMapping("notice") 
	public void notice( @RequestParam(name = "page", defaultValue = "1") int page,
									  PageInfo pageInfo, Model model) { 
		  // business logic 
		  List<NoticeDto> list = service.listNotice(page, pageInfo);
	  
		  // add attribute
		  model.addAttribute("noticeList", list);
	  }
	
	/* 공지사항 수정하기 */
	@GetMapping("modify")
	public void modify(int n_id, Model model) {
		NoticeDto notice = service.get(n_id);
		
		model.addAttribute("notice", notice);
	
	}
	
	@PostMapping("modify")
	public String modify(NoticeDto notice) {
		service.updateList(notice);
		 return "redirect:/admin/notice";
		
	}
	
	/* 공지사항 삭제하기 */
	@PostMapping("remove")
	public String remove(int id) {
		service.remove(id);
		
		return "redirect:/admin/notice";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	  
	 

}
