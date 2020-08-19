package com.sbs.sbl.mp.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.sbl.mp.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("/member/join")
	public String showJoin() {
		return "member/join";
	}

	@RequestMapping("/member/doJoin")
	public String doJoin(@RequestParam Map<String, Object> param, Model model) {

		int newMemberId = memberService.join(param);

		System.out.println("newMemberId : " + newMemberId);
		System.out.println("newMemberId : " + newMemberId);
		System.out.println("newMemberId : " + newMemberId);
		System.out.println("newMemberId : " + newMemberId);
		System.out.println("newMemberId : " + newMemberId);
		return "home/main";
	}

	@RequestMapping("/member/login")
	public String showLogin() {
		return "member/login";
	}

	@RequestMapping("/member/doLogin")
	public String doLogin() {
		
		return "redirect:/home/main";
	}
}
