package com.jk.onboard.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jk.onboard.common.model.vo.PageInfo;
import com.jk.onboard.notice.model.dao.NoticeDao;
import com.jk.onboard.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return noticeDao.selectNoticeList(sqlSession, pi);
	}

	@Override
	public int insertNotice(Notice n) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(Notice n) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Notice selectNotice(Notice n) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectListCount() {
		return noticeDao.selectListCount(sqlSession);
	}

}
