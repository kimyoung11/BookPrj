package com.demo.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.customer.NoticeDto;
import com.demo.domain.customer.PageInfo;
import com.demo.domain.customer.QuestionDto;
import com.demo.service.customer.NoticeService;
import com.demo.service.customer.QuestionService;

import software.amazon.awssdk.services.s3.S3Client;

@Controller
@RequestMapping("customer")
public class CustomerController {

	@Autowired
	private NoticeService service;
	
	@Autowired
	private QuestionService questService;
	


// 공지사항 리스트 보여주기	
	@GetMapping("notice") 
	public void notice( @RequestParam(name = "page", defaultValue = "1") int page,
									  PageInfo pageInfo, Model model) { 
		  // business logic 
		  List<NoticeDto> list = service.listNotice(page, pageInfo);
	  
		  // add attribute
		  model.addAttribute("noticeList", list);
	  }
	

//	공지사항 내용보기
	@GetMapping("listContent/{n_id}")
	public String listContent(@PathVariable int n_id, Model model) {

		// business logic (게시물 db에서 가져오기)
		NoticeDto notice = service.listContent(n_id);

		model.addAttribute("noticeContent", notice);

		return "customer/listContent";

	}

	@GetMapping("listContent")
	public void listContent() {

	}

//	1:1문의
	@GetMapping("question")
	public void qiestion() {

	}

	@PostMapping("question")
	public String qiest(QuestionDto question,
				 MultipartFile[] files,
				 RedirectAttributes rttr) {
		
		
		// business logic
		int cnt = questService.questInsert(question, files);
		
		
		if (cnt == 1) {
			rttr.addFlashAttribute("message", "새 게시물이 등록되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 게시물이 등록되지 않았습니다.");
		}
				
		// /board/list로 redirect
		return "redirect:/customer/question";
		
	}

	
//	자주 묻는 질문
	@GetMapping("asked")
	public void ask() {

	}

	
	
}
