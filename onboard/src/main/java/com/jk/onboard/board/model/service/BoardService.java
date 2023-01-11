package com.jk.onboard.board.model.service;

import java.util.ArrayList;

import com.jk.onboard.board.model.vo.Board;
import com.jk.onboard.common.model.vo.PageInfo;

public interface BoardService {
	
	ArrayList<Board> selectFdboardList(PageInfo pi);
	
	int selectFdboardListCount();
	
	int insertFdboard(Board b);
	
	int updateFdboard(Board b);
	
	int deleteFdboard(int bno);
	
	Board selectBoard(int bno);
	
	int increaseCount(int bno);

}
