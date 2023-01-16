package com.jk.onboard.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.jk.onboard.board.model.vo.Board;
import com.jk.onboard.common.model.vo.PageInfo;

@Repository
public class BoardDao {

	public ArrayList<Board> selectFdboardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectFdboardList", null, rowBounds);
	}

	public int selectFdboardListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectFdboardListCount");
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("boardMapper.increaseCount", bno);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("boardMapper.selectBoard", bno);
	}

	public int deleteFdboard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("boardMapper.deleteFdboard", bno);
	}

}
