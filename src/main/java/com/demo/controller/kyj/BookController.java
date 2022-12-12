package com.demo.controller.kyj;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.header.writers.frameoptions.StaticAllowFromStrategy;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.demo.domain.book.BookDto;
import com.demo.domain.book.CartDto;
import com.demo.domain.user.yjh.UserDto;
import com.demo.service.book.BookService;
import com.demo.service.book.CartService;
import com.demo.service.user.yjh.UserService;


@Controller
@RequestMapping("book")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("main")
	public void main(Model model) {
		List<BookDto> newBook = bookService.newBookList();
		model.addAttribute("newBookList", newBook);
		
		List<BookDto> ranBook = bookService.ranBookList();
		model.addAttribute("ranBookList", ranBook);
	}
	
	@GetMapping("autoComplete")
	@ResponseBody
	public Map<String, Object> autocomplete(
			@RequestParam Map<String, Object> paramMap
			) {
		System.out.println("호출됨");
		System.out.println(paramMap.get("value"));
		String temp = "%"+(String)paramMap.get("value")+"%";
		List<Map<String,Object>> resultList = bookService.autocomplete(temp);
		paramMap.put("resultList", resultList);
		
		return paramMap;
	}
	
	@GetMapping("list")
	public String list(Model model) {//all books page
	
		List<BookDto> list = bookService.listBoard();
		model.addAttribute("bookList", list);
		return "book/list/all";
	}
	
	@GetMapping("list/new")
	public String listByDate(Model model) {
		List<BookDto> list = bookService.getByDate();
		model.addAttribute("bookList",list);
		return "book/list/new";
	}
	
	@GetMapping("list/{b_genre}")
	public String listByGenre(@PathVariable String b_genre,Model model) {
		//System.out.println(b_genre);
		List<BookDto> list = bookService.getByGenre(b_genre);
		//System.out.println(list);
		model.addAttribute("bookList", list);
		
		return "book/list/all";
	}
		
	
	@GetMapping("detail/{b_code}")
	public String get(@PathVariable int b_code,
			Model model,HttpSession session) {
		String u_id = (String)session.getAttribute("id");
//		List<BookDto> temp = service.getByCodeAndId(u_id,b_code);
		BookDto temp = bookService.getByCode(b_code); //1번책
//		System.out.println(temp);
		
		int likeStatus = bookService.getLikeCount(b_code, u_id);
		System.out.println("this is likeStatus:" + likeStatus);
		if(likeStatus ==0)
			model.addAttribute("likeStatus", "false");
		else if(likeStatus ==1)
			model.addAttribute("likeStatus", "true");
		model.addAttribute("book", temp);
		return "/book/detail";
	}
	
	
	@GetMapping("order/{b_code}")
	public String orderBasket(@PathVariable int b_code,Model model, int number,HttpSession session) {
		String u_id=(String) session.getAttribute("id");
		//System.out.println("this is b_code" + b_code);
		BookDto temp = bookService.getByCode(b_code);
		UserDto user = userService.getById(u_id);
		System.out.println(temp);
		
		List<CartDto> temp2 = cartService.getById(u_id);
		//System.out.println(temp2);
		model.addAttribute("user",user);
		model.addAttribute("book", temp);
		model.addAttribute("cnt",number);
		return "/book/order";
	}
	
	
	@PostMapping("cart")
	@ResponseBody
	public Map<String,Object> addToCart(@RequestBody CartDto cart,HttpSession session) {
		cart.setC_count(1);
		CartDto temp = cart;
		System.out.println(temp);
		int isInsert = cartService.insertToCart(temp.getC_count(),temp.getU_id(),temp.getB_code());
		HashMap<String,Object> hm = new HashMap<>();
		if(isInsert ==1) {
			hm.put("message", "장바구니에 추가완료");
		}else if(isInsert ==0){
			hm.put("message", "이미 장바구니에 있습니다.");
		}
		
		return hm;
	}
	
	@GetMapping("cart")
	public String cartBasket(@RequestParam int b_code, @RequestParam int c_cnt,RedirectAttributes rttr,HttpSession session) {
		String u_id=(String) session.getAttribute("id");
		//System.out.println("실행 된거 맞나?"+ " " + c_cnt); //3번책 7권
		rttr.addAttribute("b_code", b_code);
		int isInsert = cartService.insertToCart(c_cnt,u_id,b_code);
		if(isInsert ==1) {
			rttr.addFlashAttribute("message", "장바구니에 추가완료");
		}else if(isInsert ==0){
			rttr.addFlashAttribute("message", "이미 장바구니에 있습니다");
		}
		try {
			Thread.sleep(15000);
		}catch(InterruptedException e) {
			e.printStackTrace();
		}
		return "redirect:/book/detail/{b_code}";
	}
	
	@GetMapping("order")
	public void order(@RequestParam int b_code,@RequestParam int c_cnt,Model model,HttpSession session) {
		String u_id=(String) session.getAttribute("id");
		//System.out.println("this is order:" + b_code + " " + c_cnt);
		BookDto temp = bookService.getByCode(b_code);
		UserDto user = userService.getById(u_id);
//		System.out.println(user);
		model.addAttribute("book",temp);
		model.addAttribute("cnt", c_cnt);
		model.addAttribute("user", user);
//		System.out.println(temp);
	}
	
	@PostMapping("like")
	@ResponseBody
	public Map<String,Object> like1(@RequestBody Map<String, Object> map,HttpSession session) {
		//System.out.println("호출 완료");
		String u_id = (String) session.getAttribute("id");
		System.out.println("this is u_id:" + u_id);
		int likeStatus = bookService.addLike((Integer)map.get("b_code"),u_id);
		bookService.addBookLike((Integer)map.get("b_code"));
		int bookCnt = bookService.getBookLike((Integer)map.get("b_code"));
		System.out.println(bookCnt);
		Map<String,Object> hm = new HashMap<>();
		//insert 좋아요 갯수 
		if(likeStatus ==1) {
			hm.put("status","true");
			hm.put("bookCnt", bookCnt); 
		}else {
			hm.put("status","false");
			hm.put("bookCnt", bookCnt); 
		}
		return hm;
	}
	
	@PutMapping("like")
	@ResponseBody
	public Map<String,Object> like2(@RequestBody Map<String, Object> map,HttpSession session) {
		String u_id = (String) session.getAttribute("id");
		System.out.println("호출 완료2");
		System.out.println(map);
		int likeStatus = bookService.removeLike((Integer)map.get("b_code"),u_id);
		bookService.addBookLike((Integer)map.get("b_code"));
		int bookCnt = bookService.getBookLike((Integer)map.get("b_code"));
		System.out.println(bookCnt); 
		Map<String,Object> hm = new HashMap<>();
		// update 좋아요 갯수 없애기
		if(likeStatus ==1) {
			hm.put("status","false");
			 hm.put("bookCnt", bookCnt); 
		}else {
			hm.put("status","true");
			hm.put("bookCnt", bookCnt); 
		}
		return hm;
	}
	
	@RequestMapping("chat")
	@GetMapping
	private String chat(Locale locale,Model model) {
		return "chat";
	}

}
