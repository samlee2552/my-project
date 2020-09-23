package com.sbs.sbl.mp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sbs.sbl.mp.dto.Article;
import com.sbs.sbl.mp.dto.Member;
import com.sbs.sbl.mp.dto.ResultData;
import com.sbs.sbl.mp.service.ArticleService;
import com.sbs.sbl.mp.service.MemberService;
import com.sbs.sbl.mp.util.Util;

@Controller
@RequestMapping("usr/member/*")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ArticleService articleService;

	// 회원가입 시작
	@RequestMapping("join")
	public String showJoin() {
		return "member/join";
	}

	@RequestMapping("doJoin")
	public String doJoin(@RequestParam Map<String, Object> param, Model model) {
		Util.changeMapKey(param, "loginPwReal", "loginPw");

		String loginId = Util.getAsStr(param.get("loginId"));
		String nickname = Util.getAsStr(param.get("nickname"));
		String email = Util.getAsStr(param.get("email"));

		ResultData checkForDupEntryResultData1 = memberService.checkLoginIdJoinable(loginId);
		ResultData checkForDupEntryResultData2 = memberService.checkNickNameJoinable(nickname);
		ResultData checkForDupEntryResultData3 = memberService.checkEmailJoinable(email);
		// 중복체크
		/* 시작 */
		if (checkForDupEntryResultData1.isFail()) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", checkForDupEntryResultData1.getMsg());
			return "common/redirect";
		}
		if (checkForDupEntryResultData2.isFail()) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", checkForDupEntryResultData2.getMsg());
			return "common/redirect";
		}
		if (checkForDupEntryResultData3.isFail()) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", checkForDupEntryResultData3.getMsg());
			return "common/redirect";
		}
		/* 끝 */

		String redirectUri = (String) param.get("redirectUri");
		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", String.format("%s님, 회원이 되신것을 환영합니다! 이메일 인증 후 로그인 가능합니다", nickname));
		int newMemberId = memberService.join(param);
		return "common/redirect";
	}

	// 회원 이메일 인증
	@RequestMapping("authentication")
	public String verifyEmail(String email, Model model) {
		memberService.updateAuthStatus(email);

		model.addAttribute("alertMsg", "이메일 인증이 완료되었습니다.");
		String redirectUri = "/usr/member/login";
		model.addAttribute("redirectUri", redirectUri);
		return "common/redirect";
	}

	// 회원가입 끝
	// 로그인 시작
	@RequestMapping("login")
	public String showLogin() {
		return "member/login";
	}

	@RequestMapping("doLogin")
	public String doLogin(String loginId, String loginPwReal, String redirectUri, Model model, HttpSession session) {
		String loginPw = loginPwReal;

		Member member = memberService.getMemberByLoginId(loginId);

		// 로그인 조건 검사
		if (member == null) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "존재하지 않는 회원입니다.");
			return "common/redirect"; // WEB-INF/jsp/common/redirect.jsp
		}

		if (member.isDelStatus() == true) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "탈퇴회원입니다. 회원가입 탭에서 탈퇴 철회가 가능합니다.");
			return "common/redirect";
		}

		if (member.getLoginPw().equals(loginPw) == false) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			return "common/redirect";
		}

		if (member.isAuthStatus() == false) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "이메일 인증 후 로그인 해주시기 바랍니다.");
			return "common/redirect";
		}
		// 끝
		boolean isLogined = true;

		session.setAttribute("loginedMemberId", member.getId());

		if (redirectUri == null || redirectUri.length() == 0) {
			redirectUri = "/home/main";
		}

		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", String.format("%s님, 환영합니다!", member.getNickname()));

		return "common/redirect";
	}

	// 로그인 끝
	// 로그아웃
	@RequestMapping("logout")
	public String doLogout(String redirectUri, Model model, HttpSession session) {
		session.removeAttribute("loginedMemberId");

		if (redirectUri == null || redirectUri.length() == 0) {
			redirectUri = "/usr/home/main";
		}

		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", "로그아웃 되었습니다.");

		return "common/redirect";
	}

	// 아이디 찾기 시작
	@RequestMapping("/findLoginId")
	public String showfindLoginId() {
		return "member/findLoginId";
	}

	@RequestMapping("/doFindLoginId")
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
		model.addAttribute("alertMsg", String.format("회원님의 아이디는 \"%s\" 입니다!", member.getLoginId()));

		return "common/redirect";
	}

	// 아이디 찾기 끝
	// 비밀번호 찾기 시작
	@RequestMapping("findLoginPw")
	public String showfindLoginPw() {
		return "member/findLoginPw";
	}

	@RequestMapping("/doFindLoginPw")
	public String doFindLoginPw(String loginId, String email, String redirectUri, Model model, HttpSession session) {
		Member member = memberService.getMemberByLoginId_email(loginId, email);

		if (member == null) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "아이디 또는 이메일을 확인 바랍니다.");
			return "common/redirect";
		}

		if (redirectUri == null || redirectUri.length() == 0) {
			redirectUri = "/home/main";
		}

		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", String.format("\"%s\" 로 임시 비밀번호를 발송했습니다.", email));
		session.removeAttribute("loginedMemberId");
		memberService.sendTempPw(loginId, email);

		return "common/redirect";
	}

	// 비밀번호 찾기 끝
	// 회원정보 수정 시작
	@RequestMapping("modify")
	public String showModify(HttpServletRequest req, Model model) {
		int loginedMemberId = (int) req.getAttribute("loginedMemberId");
		Member member = memberService.getMemberById(loginedMemberId);

		model.addAttribute("member", member);

		return "member/modify";
	}

	@RequestMapping("doModify")
	public String doModify(@RequestParam Map<String, Object> param, Model model, HttpServletRequest req) {
		Util.changeMapKey(param, "loginPwReal", "loginPw");

		int loginedMemberId = (int) req.getAttribute("loginedMemberId");
		Member member = memberService.getMemberById(loginedMemberId);

		String paramNickname = (String) param.get("nickname");
		String paramEmail = (String) param.get("email");

		// 로그인된 회원의 정보를 제외한 중복 검사 시작
		if (member.getNickname().equals(paramNickname) == false) {
			ResultData checkForDupEntryResultData2 = memberService.checkNickNameJoinable(paramNickname);
			if (checkForDupEntryResultData2.isFail()) {
				model.addAttribute("historyBack", true);
				model.addAttribute("alertMsg", checkForDupEntryResultData2.getMsg());
				return "common/redirect";
			}
		}

		if (member.getEmail().equals(paramEmail) == false) {
			ResultData checkForDupEntryResultData3 = memberService.checkEmailJoinable(paramEmail);
			if (checkForDupEntryResultData3.isFail()) {
				model.addAttribute("historyBack", true);
				model.addAttribute("alertMsg", checkForDupEntryResultData3.getMsg());
				return "common/redirect";
			}
		}
		// 중복검사 끝

		memberService.modify(param);

		String redirectUri = (String) param.get("redirectUri");
		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", "회원님의 정보가 수정되었습니다. 다시 로그인 해주시기 바랍니다.");

		return "common/redirect";
	}

	// 회원 탈퇴
	@RequestMapping("delete")
	public String delete(@RequestParam Map<String, Object> param, Model model, HttpServletRequest req) {
		int loginedMemberId = (int) req.getAttribute("loginedMemberId");

		return "member/delete";
	}

	@RequestMapping("doDelete")
	public String doDelete(Model model, HttpSession session, String loginPwReal, String loginPwConfirm,
			String redirectUri) {
		String loginPw = loginPwReal;
		int loginedMemberId = (int) session.getAttribute("loginedMemberId");
		Member member = memberService.getMemberById(loginedMemberId);

		if (member.getLoginPw().equals(loginPw) == false) {
			model.addAttribute("historyBack", true);
			model.addAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			return "common/redirect";
		}
		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("alertMsg", "탈퇴완료.");

		memberService.delete(loginedMemberId);
		// 로그아웃 처리
		session.removeAttribute("loginedMemberId");

		return "common/redirect";
	}
	
	@RequestMapping("profile")
	public String showProfile(@RequestParam Map<String, Object> param, Model model, HttpServletRequest req) {
		int memberId = Integer.parseInt((String) param.get("memberId")); 
		
		Member member = memberService.getMemberById(memberId);
		List<Article> articles = articleService.getForPrintArticlesByMemberId(memberId);

		model.addAttribute("member", member);
		model.addAttribute("articles", articles);
		return "member/profile";
	}
}
