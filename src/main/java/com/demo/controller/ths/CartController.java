package com.demo.controller.ths;

import java.util.List;

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
import com.demo.service.ths.OrdersService;

@Controller
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	private OrdersService service;
	
	@GetMapping("cart")
	public void cart(Model model) {
		List<CartDto> cart = service.cartlist();
		System.out.println(cart);
		model.addAttribute("cartlist", cart);
	}
	
	@PostMapping("deleteCart")
	public String deleteCart(@RequestParam List<String> u_id, @RequestParam List<Integer> b_code) {
		service.deleteCart(u_id, b_code);
		System.out.println(u_id);
		System.out.println(b_code);
		return "redirect:/cart/cart";
	}
	
	@GetMapping("order")
	public void order() {
		
	}
	
	@PostMapping("order")
	public void order1(
			@RequestParam List<String> u_id, 
			@RequestParam List<Integer> b_code, 
			@RequestParam List<Integer> c_count,
			Model model) {
		List<CartDto> Orderlist = service.cartToOrder(u_id, b_code, c_count);
		model.addAttribute("toOrderlist", Orderlist);
		model.addAttribute("fromCart", true);
		System.out.println(u_id);
		System.out.println(b_code);
		System.out.println(c_count);
	}
	
	@GetMapping("ordermanage") public void ordermanage(Model model) {
	List<OrdersDto> orders = service.ordermanage(); model.addAttribute("orders",orders);
	}
	
	
	@GetMapping("orderend")
	public void orderend() {
	}
	
}
