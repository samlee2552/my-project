package com.sbs.sbl.mp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping("/test/member/list")
	public String showMember() {
		return "member/list";
	}
	
	
}
