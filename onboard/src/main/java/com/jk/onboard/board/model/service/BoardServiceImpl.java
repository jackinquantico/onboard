package com.jk.onboard.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk.onboard.board.model.dao.BoardDao;
import com.jk.onboard.board.model.vo.Board;
import com.jk.onboard.common.model.vo.PageInfo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Board> selectFdboardList(PageInfo pi) {
		return boardDao.selectFdboardList(sqlSession, pi);
	}

	@Override
	public int selectFdboardListCount() {
		return boardDao.selectFdboardListCount(sqlSession);
	}

	@Override
	public int insertFdboard(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateFdboard(Board b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFdboard(int bno) {
		return boardDao.deleteFdboard(sqlSession, bno);
	}

	@Override
	public Board selectBoard(int bno) {
		return boardDao.selectBoard(sqlSession, bno);
	}

	@Override
	public int increaseCount(int bno) {
		return boardDao.increaseCount(sqlSession, bno);
	}

}
