package com.jk.onboard.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jk.onboard.member.model.vo.Member;

@Repository
public class MemberDao {

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int idCheck(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.idCheck", m);
	}

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public String findUserId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findUserId", m);
	}

	public int countUserId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.countUserId", m);
	}

	public int countUserPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.countUserPwd", m);
	}

	public String findUserPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findUserPwd", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

}
