package com.sbs.sbl.mp.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sbs.sbl.mp.dto.Member;
import com.sbs.sbl.mp.service.MemberService;

@Controller
@RequestMapping("usr/test/*")
public class TestController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("/test")
	public String showMember(Model model, HttpSession session) {

		return "test/test";
	}
	
	@RequestMapping("/doSetSessionA")
	@ResponseBody
	public String doSetSessionA(HttpSession session) {
		session.setAttribute("a", 16);

		return "세션설정완료";
	}

	@RequestMapping("/getSessionA")
	@ResponseBody
	public int getSessionA(HttpSession session) {
		return (int) session.getAttribute("a");
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
	
		return "test/main";
	}
	
}
