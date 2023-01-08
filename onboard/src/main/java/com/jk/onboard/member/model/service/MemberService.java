package com.jk.onboard.member.model.service;

import com.jk.onboard.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);
	
	Member selectMember(Member m);
	
	int updateMember(Member m);
	
	int deleteMember(Member m);
	
	int idCheck(Member m);
	
	Member loginMember(Member m);
	
	int countUserId(Member m);
	
	String findUserId(Member m);
	
	int countUserPwd(Member m);
	
	String findUserPwd(Member m);
	
}
