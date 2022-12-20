package com.demo.controller.kyj;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
import com.demo.domain.review.yjh.ReviewDto;
import com.demo.domain.user.yjh.UserDto;
import com.demo.service.book.BookService;
import com.demo.service.book.CartService;
import com.demo.service.review.yjh.ReviewService;
import com.demo.service.user.yjh.UserService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;


@Controller
@RequestMapping("book")
public class BookController {
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ReviewService reviewService;
	
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
//		System.out.println("호출됨");
//		System.out.println(paramMap.get("value"));
		String temp = "%"+(String)paramMap.get("value")+"%";
		List<Map<String,Object>> resultList = bookService.autocomplete(temp);
		paramMap.put("resultList", resultList);
		
		return paramMap;
	}
	
	
	@GetMapping("list")
	public String list(Model model,@RequestParam(defaultValue = "1") int page) {//all books page
		//List<BookDto> list = bookService.listBoard();
		PageHelper.startPage(page, 10);
		Page<BookDto> books = bookService.selectAllBook();
		System.out.println(books);
		model.addAttribute("pageNum", books.getPageNum());
		model.addAttribute("pageSize", books.getPageSize());
		model.addAttribute("pages", books.getPages());
		model.addAttribute("total",books.getTotal());
		model.addAttribute("bookList", books.getResult());
		return "book/list/all";
	}
	
	@GetMapping("listKeyword")
	public String listKeyword(Model model,@RequestParam(defaultValue ="1")int page,String b_keyword) {
		PageHelper.startPage(page, 10);
		String new_keyword = "%"+b_keyword+"%";
		Page<BookDto> books = bookService.getBookByKeyword(new_keyword);
		model.addAttribute("pageNum", books.getPageNum());
		model.addAttribute("pageSize", books.getPageSize());
		model.addAttribute("pages", books.getPages());
		model.addAttribute("total",books.getTotal());
		model.addAttribute("bookList", books.getResult());
		return "book/list/all";
	}

	@GetMapping("list/new")
	public String listNew(Model model,@RequestParam(defaultValue = "1") int page) {//all books page
		PageHelper.startPage(page, 10);
		Page<BookDto> books = bookService.getByDate();
		model.addAttribute("pageNum", books.getPageNum());
		model.addAttribute("pageSize", books.getPageSize());
		model.addAttribute("pages", books.getPages());
		model.addAttribute("total",books.getTotal());
		model.addAttribute("bookList", books.getResult());
		return "book/list/new";
	}
	
	@GetMapping("list/new/{b_genre}")
	public String newListByGenre(@PathVariable String b_genre,Model model,@RequestParam(defaultValue = "1") int page) {
		//System.out.println(b_genre);
		PageHelper.startPage(page,10);
		Page<BookDto> books = bookService.getBookByGenre(b_genre);
		System.out.println("genre" + b_genre);
		//System.out.println(list);
		model.addAttribute("pageNum", books.getPageNum());
		model.addAttribute("pageSize", books.getPageSize());
		model.addAttribute("pages", books.getPages());
		model.addAttribute("total",books.getTotal());
		model.addAttribute("bookList", books.getResult());
		model.addAttribute("genre",b_genre);
		
		return "book/list/new";
	}
	
	@GetMapping("list/{b_genre}")
	public String listByGenre(@PathVariable String b_genre,Model model,@RequestParam(defaultValue = "1") int page) {
		//System.out.println(b_genre);
		PageHelper.startPage(page,10);
		Page<BookDto> books = bookService.getByGenre(b_genre);
		//System.out.println(list);
		model.addAttribute("pageNum", books.getPageNum());
		model.addAttribute("pageSize", books.getPageSize());
		model.addAttribute("pages", books.getPages());
		model.addAttribute("total",books.getTotal());
		model.addAttribute("bookList", books.getResult());
		model.addAttribute("genre",b_genre);
		
		return "book/list/genre";
	}
		
	
	@GetMapping("detail/{b_code}")
	public String get(@PathVariable int b_code,
			Model model,HttpSession session) {
		String u_id = (String)session.getAttribute("id");
//		List<BookDto> temp = service.getByCodeAndId(u_id,b_code);
		BookDto temp = bookService.getByCode(b_code); //1번책
//		System.out.println(temp);
		List<ReviewDto> review = reviewService.getByBookCode(b_code);
		double starAvg = bookService.getByReviewAvg(b_code);
		double starAvg2 = Math.round(starAvg*10)/10.0;
		System.out.println("staravg" + starAvg2);
		int peopleCnt = bookService.getByPeopleCnt(b_code);
//		System.out.println("this is temp:" + temp);
		//System.out.println("this is review:" + review);
		
		
		int likeStatus = bookService.getLikeCount(b_code, u_id);
		System.out.println("this is likeStatus:" + likeStatus);
		if(likeStatus ==0)
			model.addAttribute("likeStatus", "false");
		else if(likeStatus ==1)
			model.addAttribute("likeStatus", "true");
		model.addAttribute("book", temp);
		model.addAttribute("review", review);
		model.addAttribute("peopleCnt",peopleCnt);
		model.addAttribute("reviewAvg",starAvg2);
		return "/book/detail";
	}
	
	
	@GetMapping("order/{b_code}")
	public String orderBasket(@PathVariable int b_code,Model model, int c_cnt,HttpSession session) {
		String u_id=(String) session.getAttribute("id");
		System.out.println("this is b_code" + b_code);
		BookDto temp = bookService.getByCode(b_code);
		UserDto user = userService.getById(u_id);
		System.out.println(temp);
		
		List<CartDto> temp2 = cartService.getById(u_id);
		System.out.println(temp2);
		model.addAttribute("user",user);
		model.addAttribute("book", temp);
		model.addAttribute("cnt",c_cnt);
		return "/book/order";
	}
	
	
	@PostMapping("cart")
	@ResponseBody
	public Map<String,Object> addToCart(@RequestBody CartDto cart,HttpSession session) {
		String u_id = (String)session.getAttribute("id");
		cart.setC_count(1);
		CartDto temp = cart;
		System.out.println(temp);
		int isInsert = cartService.insertToCart(temp.getC_count(),u_id,temp.getB_code());
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
		//System.out.println("실행 된거 맞나?"+ b_code + " " + c_cnt); //3번책 7권
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
		System.out.println("this is order:" + b_code + " " + c_cnt);
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