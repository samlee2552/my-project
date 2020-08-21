package com.sbs.sbl.mp.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sbs.sbl.mp.dto.Member;

@Mapper
public interface MemberDao {

	void join(Map<String, Object> param);

	Member getMemberByLoginId(@Param("loginId") String loginId);
	Member getMemberByName_email(@Param("name") String name, @Param("email") String email );

	//회원가입 중복체크 
	int getLoginIdCount(@Param("loginId") String loginId);
	int getNicknameCount(@Param("nickname") String nickname);
	int getEmailCount(@Param("email") String email);

}
