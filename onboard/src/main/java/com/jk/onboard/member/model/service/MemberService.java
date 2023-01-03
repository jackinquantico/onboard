package com.jk.onboard.member.model.service;

import com.jk.onboard.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);
	
	Member selectMember(Member m);
	
	int updateMember(Member m);
	
	int deleteMember(Member m);
}
