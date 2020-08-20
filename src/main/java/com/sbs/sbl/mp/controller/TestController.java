package com.sbs.sbl.mp.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.sbl.mp.dto.Member;
import com.sbs.sbl.mp.service.MemberService;

@Controller
public class TestController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("/test")
	public String showMember(@RequestParam Map<String, Object> param, Model model) {
		int id = Integer.parseInt((String) param.get("id"));
	
		Member member = memberService.getMember(id);
		model.addAttribute("member", member);
		System.out.println(member);
		System.out.println(member);
		System.out.println(member);
		System.out.println(member);
		System.out.println(member);
		System.out.println(member);
		System.out.println(member);
		System.out.println(member);
		return "member/list";
	}
	
	@RequestMapping("/test/count")
	public String showMemberCount(String loginId, Model model) {
		int count = memberService.getCount(loginId);
		System.out.println("count : " + count);
		System.out.println("count : " + count);
		System.out.println("count : " + count);
		System.out.println("count : " + count);
		System.out.println("count : " + count);
		return "member/list";
	}
}
