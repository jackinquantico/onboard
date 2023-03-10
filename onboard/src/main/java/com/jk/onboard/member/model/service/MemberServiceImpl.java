package com.jk.onboard.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk.onboard.member.model.dao.MemberDao;
import com.jk.onboard.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public Member selectMember(Member m) {
		return memberDao.selectMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		return memberDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(Member m) {
		return memberDao.deleteMember(sqlSession, m);
	}

	@Override
	public int idCheck(Member m) {
		return memberDao.idCheck(sqlSession, m);
	}

	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public String findUserId(Member m) {
		return memberDao.findUserId(sqlSession, m);
	}

	@Override
	public int countUserId(Member m) {
		return memberDao.countUserId(sqlSession, m);
	}
	
	@Override
	public String findUserPwd(Member m) {
		return memberDao.findUserPwd(sqlSession, m);
	}

	@Override
	public int countUserPwd(Member m) {
		return memberDao.countUserPwd(sqlSession, m);
	}

}
