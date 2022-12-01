package com.demo.controller.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

//spring security 설정 완료하면, TeamprojectApplication 
//7라인 (exclude = SecurityAutoConfiguration.class) 삭제
@Controller
public class HomeController {
	
	@RequestMapping("")
	@ResponseBody
	private String home() {
		return "home";
	}
}
