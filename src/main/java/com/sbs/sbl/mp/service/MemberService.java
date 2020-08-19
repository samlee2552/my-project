package com.sbs.sbl.mp.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sbs.sbl.mp.util.Util;
import com.sbs.sbl.mp.dao.MemberDao;
import com.sbs.sbl.mp.dto.Member;

@Service
public class MemberService {
	@Autowired
	private MemberDao memberDao;


	public Member getMember(int id) {
		
		return memberDao.getMemberById(id);
	}


	public int join(Map<String, Object> param) {
		memberDao.join(param);
		return Util.getAsInt(param.get("id"));
	}
	
	

}
