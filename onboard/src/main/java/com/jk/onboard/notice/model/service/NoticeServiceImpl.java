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
		return noticeDao.insertNotice(sqlSession, n);
	}

	@Override
	public int updateNotice(Notice n) {
		return noticeDao.updateNotice(sqlSession, n);
	}

	@Override
	public int deleteNotice(int nno) {
		return noticeDao.deleteNotice(sqlSession, nno);
	}

	@Override
	public Notice selectNotice(int nno) {
		return noticeDao.selectNotice(sqlSession, nno);
	}

	@Override
	public int selectListCount() {
		return noticeDao.selectListCount(sqlSession);
	}

	@Override
	public int increaseCount(int nno) {
		return noticeDao.increaseCount(sqlSession, nno);
	}

}
