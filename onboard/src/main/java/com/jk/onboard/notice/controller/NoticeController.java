package com.jk.onboard.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jk.onboard.common.model.vo.PageInfo;
import com.jk.onboard.common.template.Pagination;
import com.jk.onboard.notice.model.service.NoticeService;
import com.jk.onboard.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("list.no")
	public String noticeListView(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = noticeService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
				
		ArrayList<Notice> nList = noticeService.selectNoticeList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("nlist", nList);
		
		return "notice/noticeListView";
	}
}
