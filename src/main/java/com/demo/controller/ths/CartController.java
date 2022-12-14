package com.demo.controller.ths;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.domain.ths.CartDto;
import com.demo.domain.ths.OrdersDto;
import com.demo.domain.ths.PageInfo;
import com.demo.service.ths.OrdersService;

@Controller
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	private OrdersService service;
	
	@GetMapping("cart")
	public void cart(HttpSession session, Model model) {
		String u_id = (String) session.getAttribute("id");
		List<CartDto> cart = service.cartlist(u_id);
		System.out.println(cart);
		model.addAttribute("cartlist", cart);
	}
	
	// 장바구니 선택 삭제
	@PostMapping("deleteCart")
	public String deleteCart(@RequestParam List<String> u_id, @RequestParam List<Integer> b_code) {
		service.deleteCart(u_id, b_code);
		System.out.println(u_id);
		System.out.println(b_code);
		return "redirect:/cart/cart";
	}
	
	// 장바구니 페이지
	@GetMapping("order")
	public void order() {
		
	}
	
	// 장바구니에서 선택주문
	@PostMapping("order")
	public void order1(
			HttpSession session, 
			@RequestParam List<Integer> b_code, 
			@RequestParam List<Integer> c_count,
			Model model) {
		String u_id = (String) session.getAttribute("id");
		List<CartDto> Orderlist = service.cartToOrder(u_id, b_code, c_count);
		model.addAttribute("toOrderlist", Orderlist);
		model.addAttribute("fromCart", true);
		
		CartDto userData = service.userData(u_id);
		model.addAttribute("userData", userData);
		
		// System.out.println(u_id);
		// System.out.println(b_code);
		// System.out.println(c_count);
	}
	
	// 주문 관리 페이지
	@GetMapping("ordermanage") 
	public void ordermanage(
			@RequestParam(name="page", defaultValue = "1") int page, 
			@RequestParam(name="q", defaultValue = "") String keyword,
			PageInfo pageInfo,
			Model model) {
	List<OrdersDto> orders = service.ordermanage(page, keyword, pageInfo); 
	model.addAttribute("orders",orders);
	}
	
	// 주문 내역 삭제
	@PostMapping("orderDelete")
	public String orderDelete(int o_number) {
		service.orderDelete(o_number);
		return "redirect:/cart/ordermanage";
	}
	
	@GetMapping("orderend")
	public void orderend() {
	
	}
		
}
