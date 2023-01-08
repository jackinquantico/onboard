package com.jk.onboard.notice.model.service;

import java.util.ArrayList;

import com.jk.onboard.common.model.vo.PageInfo;
import com.jk.onboard.notice.model.vo.Notice;

public interface NoticeService {

	// 전체 조회용
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	// 리스트 카운트용
	int selectListCount();
	
	// 작성
	int insertNotice(Notice n);
	
	// 수정
	int updateNotice(Notice n);
	
	// 삭제
	int deleteNotice(Notice n);
	
	// selectOne
	Notice selectNotice(Notice n);
	
}
