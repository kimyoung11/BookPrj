package com.demo.controller.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.book.BookDto;
import com.demo.domain.customer.NoticeDto;
import com.demo.domain.customer.PageInfo;
import com.demo.domain.customer.QuestionDto;
import com.demo.service.book.BookService;
import com.demo.service.customer.NoticeService;
import com.demo.service.customer.QuestionService;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private NoticeService service;

	@Autowired
	private QuestionService questService;

	@Autowired
	private BookService bookService;

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
	public void notice(@RequestParam(name = "page", defaultValue = "1") int page, PageInfo pageInfo, Model model) {
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


	
	
	
	
	/* 1:1문의 보기 */
	@GetMapping("question")
	public void questList( @RequestParam(name = "page", defaultValue = "1") int page,
			  PageInfo pageInfo, Model model) { 

		List<QuestionDto> list = questService.questList(page, pageInfo);

		model.addAttribute("questionList", list);

	}
	
	/* 1:1 문의 삭제하기 */
	@GetMapping("removeQuest")
	public String removeQuest(int q_number, RedirectAttributes rttr) {
		
		int cnt = questService.removeQuest(q_number);
		
		
		if(cnt == 1) {
			rttr.addFlashAttribute("message", "게시물이 삭제되었습니다.");
		}else {
			rttr.addFlashAttribute("message", "게시물이 삭제되지 않았습니다.");
		}
		
		return "redirect:/admin/question";
	}
	

	/* 1:1문의 내용보기 */
	@GetMapping("answer")
	public void questContent(int q_number, Model model) {
		
		QuestionDto question = questService.ContentList(q_number);
		System.out.println(question);
		model.addAttribute("questContent", question);

	}

	/* 1:1 문의 답변 추가 */
	@PostMapping("add")
	@ResponseBody
	public void add(@RequestBody QuestionDto quest) {
		questService.answerAdd(quest);
	}
	
	/* 1:1 문의 답변 보여주기 */
	@GetMapping("answerList/{q_number}")
	@ResponseBody
	public List<QuestionDto> answerList(@PathVariable int q_number) {
		return questService.answerView(q_number);
	}
	
	/* 1:1 문의 답변 삭제하기 */
	@DeleteMapping("remove/{a_id}")
	@ResponseBody
	public Map<String, Object> removeAnswer(@PathVariable int a_id) {
		Map<String, Object> map = new HashMap<>();
		
		int cnt = questService.removeById(a_id);
		
		System.out.println(cnt);
		
		if (cnt == 1) {
			map.put("message", "댓글이 삭제되었습니다.");
		} else {
			map.put("message", "댓글이 삭제되지 않았습니다.");
		}
		return map;
	}
	
	/* 1:1 문의 답변 내용 가져오기(수정) */
	@GetMapping("getAnswer/{a_id}")
	@ResponseBody
	public QuestionDto get(@PathVariable int a_id) {
		return questService.getAnswer(a_id);
		
	}
	
	/* 1:1 문의 답변 내용 수정하기 */
	@PostMapping("modifyAnswer")
	@ResponseBody
	public Map<String, Object> modifyAnswer(@RequestBody HashMap<String, Object> answer){
		
		int a_id = Integer.valueOf((String) answer.get("a_id"));
		String a_content = (String)answer.get("a_content");
		int cnt = questService.modify(a_id, a_content);
		
		Map<String, Object> map = new HashMap<>();
		
		if(cnt == 1) {
			map.put("message","답변이 변경되었습니다.");
		} else {
			map.put("message", "답변이 수정되지 않았습니다.");
		}

		return map;
	}
	
	
	
	
	

	/* 책 등록 */
	@GetMapping("book")
	public void book() {

	}

	@PostMapping("book")
	public void bookRegister(BookDto bookDto,MultipartFile file) {
		int cnt = bookService.insertBook(bookDto,file);
		System.out.println("file:" +file);
		System.out.println("isdfsd"+bookDto); 
		
	}

	@GetMapping("bookList")
	public List<BookDto> bookList(Model model) {
		List<BookDto> temp = bookService.getBookList();
		//System.out.println(temp);
		model.addAttribute("bookList", temp);
		return temp;
	}

	
	@GetMapping("modifyBook")
	public String modifyBook(@RequestParam int b_code,Model model) {
		System.out.println(b_code);
		BookDto temp = bookService.getByCode(b_code);
		System.out.println(temp);
		model.addAttribute("book",temp);
		return "admin/modifyBook";
	}
	 
	 @PostMapping("modifyBook")
	 public String modifyBookDto(BookDto bookDto) {
		 System.out.println(bookDto);
		 int cnt = bookService.modifyBook(bookDto);
		 return "redirect:/admin/bookList";
	 }
	 
	 @DeleteMapping("deleteBook")
	 public String deleteBook(@RequestBody Map<String,String> map) {
		 System.out.println(map.get("b_code").getClass());
		 int cnt = bookService.removeBook(Integer.parseInt(map.get("b_code")));
		 return "redirect:/admin/bookList";
	 }

	 

}