package com.sbs.sbl.mp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/home/main")
	public String showTest() {
		return "home/main";
	}
	
	
}
