package com.demo.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.domain.customer.NoticeDto;
import com.demo.domain.customer.PageInfo;
import com.demo.service.customer.NoticeService;

@Controller
@RequestMapping("customer")
public class CustomerController {

	@Autowired
	private NoticeService service;

	/*
	 * @GetMapping("notice") public void notice( @RequestParam(name = "page",
	 * defaultValue = "1") int page, PageInfo pageInfo, Model model) { // business
	 * logic List<NoticeDto> list = service.listNotice(page, type, keyword,
	 * pageInfo);
	 * 
	 * // add attribute model.addAttribute("noticeList", list);
	 * 
	 * 
	 * }
	 * 
	 * 
	 * @PostMapping("notice") public String notice(NoticeDto notice) {
	 * 
	 * service.noticeRegister(notice);
	 * 
	 * return "redirect:/customer/notice";
	 * 
	 * }
	 */

//	공지사항 내용보기
	@GetMapping("listContent/{n_id}")
	public String listContent(@PathVariable int n_id, Model model) {

		// business logic (게시물 db에서 가져오기)
		NoticeDto notice = service.listContent(n_id);

		model.addAttribute("noticeContent", notice);

		return "customer/listContent";

	}

	@GetMapping("listConent")
	public void listContent() {

	}

//	1:1문의
	@GetMapping("question")
	public void qiestion() {

	}

//	자주 묻는 질문
	@GetMapping("asked")
	public void ask() {

	}

}
