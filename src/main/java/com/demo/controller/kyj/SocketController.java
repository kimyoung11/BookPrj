package com.demo.controller.kyj;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SocketController {
	
	@RequestMapping("chat123123")
	@GetMapping
	private String chat(Locale locale, Model model) {
		
		return "chat";
	}
}
