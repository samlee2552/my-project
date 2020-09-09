package com.sbs.sbl.mp.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.sbs.sbl.mp.dto.Member;

@Mapper
public interface MemberDao {
	//회원가입
	void join(Map<String, Object> param);

	//회원 불러오기
	Member getMemberByLoginId(@Param("loginId") String loginId);
	Member getMemberByName_email(@Param("name") String name, @Param("email") String email );
	Member getMemberByLoginId_email(@Param("loginId") String loginId,@Param("email") String email);
	Member getMemberById(@Param("id") int id);
	Member getMemberByEmail(@Param("email") String email);
	//회원가입 중복체크 
	int getLoginIdCount(@Param("loginId") String loginId);
	int getNicknameCount(@Param("nickname") String nickname);
	int getEmailCount(@Param("email") String email);
	//비밀번호 변경
	void updateLoginPw(@Param("loginId") String loginId, @Param("newPw") String newPw);

	//회원 정보 수정
	void modify(Map<String, Object> param);

	void delete(@Param("id") int id);

	void updateAuthStatus(@Param("email") String email);

}
