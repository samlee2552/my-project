package com.sbs.sbl.mp.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public String showMember(Model model, HttpSession session) {

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
	
	@RequestMapping("/test/test")
	public String testtest(@RequestParam Map<String, Object> param, Model model, HttpSession session) {
		int id = (int) session.getAttribute("loginedMemberId");
		System.out.println("id: " + id);
		System.out.println("id: " + id);
		System.out.println("id: " + id);
		System.out.println("id: " + id);
		Member member = memberService.getMemberById(id);
		System.out.println(member.getName());
		System.out.println(member.getNickname());
		System.out.println(member.getNickname());
		System.out.println(member.getNickname());
		System.out.println(member);
		System.out.println(member);
		System.out.println(member);
		System.out.println(member);
	
		return "home/main";
	}
	
}
