package com.sbs.sbl.mp.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.sbl.mp.dto.Member;
import com.sbs.sbl.mp.dto.ResultData;
import com.sbs.sbl.mp.service.MemberService;
import com.sbs.sbl.mp.util.Util;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	// 회원가입 시작
	@RequestMapping("/member/join")
	public String showJoin() {
		return "member/join";
	}

	@RequestMapping("/member/doJoin")
	public String doJoin(@RequestParam Map<String, Object> param, Model model) {
		Util.changeMapKey(param, "loginPwReal", "loginPw");

		ResultData checkForDupEntryResultData = memberService.checkForDupEntry(param);

		if (checkForDupEntryResultData.isFail()) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", checkForDupEntryResultData.getMsg());
			return "common/redirect";
		}

		int newMemberId = memberService.join(param);

		String redirectUri = (String) param.get("redirectUri");
		String nickname = (String) param.get("nickname");
		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", String.format("%s님, 회원이 되신것을 환영합니다!", nickname));

		return "common/redirect";
	}

	// 회원가입 끝
	// 로그인 시작
	@RequestMapping("/member/login")
	public String showLogin() {
		return "member/login";
	}

	@RequestMapping("/member/doLogin")
	public String doLogin(String loginId, String loginPwReal, String redirectUri, Model model, HttpSession session) {
		String loginPw = loginPwReal;
		
		Member member = memberService.getMemberByLoginId(loginId);
		// 로그인 조건 검사
		if (member == null) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "존재하지 않는 회원입니다.");
			return "common/redirect"; // WEB-INF/jsp/common/redirect.jsp
		}

		if (member.getLoginPw().equals(loginPw) == false) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			return "common/redirect";
		}
		// 끝

		session.setAttribute("loginedMemberId", member.getId());
		if (redirectUri == null || redirectUri.length() == 0) {
			redirectUri = "/home/main";
		}

		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", String.format("%s님, 환영합니다!", member.getNickname()));

		return "common/redirect";
	}

	// 로그인 끝
	@RequestMapping("/member/findLoginId")
	public String showfindLoginId() {
		return "member/findLoginId";
	}

	@RequestMapping("/member/doFindloginId")
	public String doFindLoginId(String name, String email, String redirectUri, Model model) {
		Member member = memberService.getMemberByName_email(name, email);
		
		if (member == null) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "입력하신 정보와 일치하는 회원이 없습니다.");
			return "common/redirect";
		}
		
		if (redirectUri == null || redirectUri.length() == 0) {
			redirectUri = "/home/main";
		}

		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", String.format("회원님의 아이디는 \"%s\", 환영합니다!", member.getName()));
		
		return "common/redirect";
	}
}
