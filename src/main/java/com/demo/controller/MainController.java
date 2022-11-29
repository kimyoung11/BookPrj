package com.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.domain.OrdersDto;
import com.demo.service.OrdersService;

@Controller
@RequestMapping("main")
public class MainController {
	
	@Autowired
	private OrdersService service;
	
	@GetMapping("cart")
	public void cart() {
	
	}
	
	@GetMapping("orderpage")
	public void orderpage() {
		
	}
	
	@GetMapping("ordermanage")
	public void ordermanage(Model model) {
		List<OrdersDto> orders =  service.ordermanage();
		model.addAttribute("orders", orders);
		
	}
	
	
	@GetMapping("orderend")
	public void orderend() {
	}
	
}
