package com.sbs.sbl.mp.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.sbl.mp.util.Util;
import com.sbs.sbl.mp.dao.MemberDao;
import com.sbs.sbl.mp.dto.Member;
import com.sbs.sbl.mp.dto.ResultData;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private MailService mailservice;

	public Member getMember(int id) {
		
		return memberDao.getMemberById(id);
	}


	public int join(Map<String, Object> param) {
		memberDao.join(param);
		sendWelcomeMail((String) param.get("email"));
		return Util.getAsInt(param.get("id"));
	}


	private void sendWelcomeMail(String email) {
		String title = String.format("[%s] 회원이 되신 것을 환영합니다.", siteName);
		
	}


	public Member getMemberByLoginId(String loginId) {
		// TODO Auto-generated method stub
		return memberDao.getMemberByLoginId(loginId);
	}


	public ResultData checkLoginIdJoinable(String loginId) {
		int count = memberDao.getLoginIdCount(loginId);
		
		if (count == 1) {
			return new ResultData("F-1", "이미 사용중인 아이디입니다.");
		}
		return new ResultData("S-1", "사용 가능한 아이디입니다.");
	}
	
	public int getCount(String loginId) {
		return memberDao.getLoginIdCount(loginId);
	}


	public ResultData checkForDupEntry(Map<String, Object> param) {
		
		int loginIdCount = memberDao.getLoginIdCount(Util.getAsStr(param.get("loginId")));
		int nicknameCount = memberDao.getNicknameCount(Util.getAsStr(param.get("nickname")));
		int emailCount = memberDao.getEmailCount(Util.getAsStr(param.get("email")));
		int cellphoneNocount = memberDao.getCellphoneNoCount(Util.getAsStr(param.get("cellphoneNo")));

		if(loginIdCount == 1) {
			return new ResultData("F-1", "이미 사용중인 아이디입니다.");
		}
		else if(nicknameCount == 1) {
			return new ResultData("F-1", "이미 사용중인 닉네임입니다.");
		}
		else if(emailCount == 1) {
			return new ResultData("F-1", "이미 등록된 이메일입니다.");
		}
		else if(cellphoneNocount == 1) {
			return new ResultData("F-1", "이미 등록된 번호입니다.");
		}
		return new ResultData("S-1", "사용 가능한 아이디입니다.");
	}
	

}
