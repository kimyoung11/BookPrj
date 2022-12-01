package com.demo.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.demo.domain.customer.NoticeDto;
import com.demo.service.customer.NoticeService;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private NoticeService service;
	
	@GetMapping("noticeRegister")
	public void ad_notice(NoticeDto notice) {
		System.out.println(notice);
	}
	
}
