package com.sbs.sbl.mp.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.sbs.sbl.mp.util.Util;
import com.sbs.sbl.mp.dao.MemberDao;
import com.sbs.sbl.mp.dto.Member;
import com.sbs.sbl.mp.dto.Reply;
import com.sbs.sbl.mp.dto.ResultData;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MailService mailService;
	@Value("${custom.siteName}")
	private String siteName;
	@Value("${custom.siteMainUri}")
	private String siteMainUri;

	// 회원가입
	public int join(Map<String, Object> param) {
		memberDao.join(param);
		sendWelcome_AuthMail((String) param.get("email"));
		return Util.getAsInt(param.get("id"));
	}

	// 임시 비밀번호 발급
	public void sendTempPw(String loginId, String email) {
		String newPw = Util.getTempPassword(8);
		sendTempPwMail(email, newPw);
		memberDao.updateLoginPw(loginId, newPw);
	}

	// 가입환영 이메일
	private void sendWelcome_AuthMail(String email) {
		String title = String.format("[%s] 회원이 되신 것을 환영합니다.", siteName);
		StringBuilder body = new StringBuilder();
		
		String authQStr = "email=" + Util.getUriEncoded(email) + "&code=" + Util.getTempPassword(10);
		String authUri = "http://localhost:8085/usr/member/authentication?" + (authQStr);
		body.append("<h1>가입이 완료되었습니다.</h1>");
		body.append(String.format("<p><a href=\"%s\" target=\"_blank\">계정인증하러 가기</a>로 이동</p>", authUri));

		mailService.send(email, title, body.toString());

	}

	// 임시비밀번호 이메일 발송
	public void sendTempPwMail(String email, String tempPw) {
		String title = String.format("[%s] 임시 비밀번호 발급 안내.", siteName);
		StringBuilder body = new StringBuilder();

		body.append(String.format("<h1>회원님의 임시 비밀번호는 \"%s\" 입니다 </h1>", tempPw));
		body.append("<h1>회원정보 수정 탭에서 비밀번호를 변경해주시기 바랍니다.</h1>");
		body.append(String.format("<p><a href=\"%s\" target=\"_blank\">%s</a>로 이동</p>", siteMainUri, siteName));
		body.append(String.format("<p><a href=\"%s\" target=\"_blank\">%s</a>로 이동</p>", siteMainUri, siteName));

		mailService.send(email, title, body.toString());
	}

	// 번호로 멤버 찾기
	public Member getMemberById(int id) {
		return memberDao.getMemberById(id);
	}

	// 닉네임으로 멤버 찾기
	public Member getMemberByNickname(String nickname) {
		return memberDao.getMemberByNickname(nickname);
	}
	
	// 로그인
	public Member getMemberByLoginId(String loginId) {
		return memberDao.getMemberByLoginId(loginId);
	}
	
	//회원 정보 찾기
	/* 아이디 찾기 */
	public Member getMemberByName_email(String name, String email) {
		return memberDao.getMemberByName_email(name, email);
	}

	/* 비번 찾기 */
	public Member getMemberByLoginId_email(String loginId, String email) {
		return memberDao.getMemberByLoginId_email(loginId, email);
	}

	// 중복체크 시작
	/* 로그인 아이디 */
	public ResultData checkLoginIdJoinable(String loginId) {
		int count = memberDao.getLoginIdCount(loginId);

		if (count == 1) {
			return new ResultData("F-1", "이미 사용중인 아이디입니다.");
		}
		return new ResultData("S-1", "사용 가능한 아이디입니다.");
	}

	/* 닉네임 */
	public ResultData checkNickNameJoinable(String loginId) {
		int count = memberDao.getNicknameCount(loginId);

		if (count == 1) {
			return new ResultData("F-1", "이미 사용중인 닉네임입니다.");
		}
		return new ResultData("S-1", "사용 가능한 닉네임입니다.");
	}

	/* 이메일 */
	public ResultData checkEmailJoinable(String loginId) {
		int count = memberDao.getEmailCount(loginId);

		if (count == 1) {
			return new ResultData("F-1", "이미 등록된 이메일입니다.");
		}
		return new ResultData("S-1", "등록 가능한 이메일입니다.");
	}
	
	// 액터가 회원 정보를 수정 할 수 있는지 알려준다.	
	public boolean actorCanModify(Member actor, Member loginedMember) {
		return actor != null && actor.getId() == loginedMember.getId() ? true : false;
	}

	// 액터가 회원 정보를  삭제할 수 있는지 알려준다.
	public boolean actorCanDelete(Member actor, Member loginedMember) {
		return actorCanModify(actor, loginedMember);
	}
	

	public int getCount(String loginId) {
		return memberDao.getLoginIdCount(loginId);
	}

	public void modify(Map<String, Object> param) {
		memberDao.modify(param);
	}

	public void delete(int id) {
		memberDao.delete(id);
		
	}

	public void updateAuthStatus(String email) {
		memberDao.updateAuthStatus(email);
	}

	public Member getMemberByEmail(String email) {
		// TODO Auto-generated method stub
		return getMemberByEmail(email);
	}

	public ResultData updateProfileText(String profile_text, int memberId) {
	
		memberDao.updateProfileText(profile_text, memberId);
		return new ResultData("S-1", "프로필 문구를 수정하였습니다.", param);
	}

	public String getProfile_textByMemberId(int memberId) {
		return memberDao.getProfile_textByMemberId(memberId);
	}

}
