package com.demo.controller.kyj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.service.book.AdminService;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	AdminService adminService;
	
	@GetMapping("book")
	private void book() {
		
	}
}
