package com.jk.onboard.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jk.onboard.common.model.vo.PageInfo;
import com.jk.onboard.common.template.Pagination;
import com.jk.onboard.member.model.vo.Member;
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
	
	@RequestMapping("enroll.no")
	public String noticeEnrollForm() {
		return "notice/noticeEnrollForm";
	}
	
	@RequestMapping("insert.no")
	public String insertNotice(Notice n, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		n.setUserNo(String.valueOf(loginUser.getUserNo()));
		
		int result = noticeService.insertNotice(n);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 공지사항이 등록되었습니다.");
		} else {
			session.setAttribute("alertMsg", "공지사항 작성에 실패했습니다.");
		}
		
		return "redirect:/list.no";
	}

	@RequestMapping("detail.no")
	public String selectNotice(int nno, Model model, HttpSession session) {
		
		int result = noticeService.increaseCount(nno);
		
		if (result > 0) {
			Notice n = noticeService.selectNotice(nno);			
			model.addAttribute("n", n);
			return "notice/noticeDetailView";
		} else {
			session.setAttribute("alertMsg", "해당 공지사항이 존재하지 않습니다.");
			return "redirect:/list.no";
		}
	}
	
	@RequestMapping("updateForm.no")
	public String updateNoticeForm(int nno, Model model) {
		
		Notice n = noticeService.selectNotice(nno);
		
		model.addAttribute("n", n);
		
		return "notice/noticeUpdateForm";
	}
	
	@RequestMapping("update.no")
	public String updateNotice(Notice n, HttpSession session) {
		
		int result = noticeService.updateNotice(n);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "공지사항을 성공적으로 수정했습니다.");
			
			return "redirect:/detail.no?nno=" + n.getNoticeNo();
		} else {
			session.setAttribute("alertMsg", "공지사항 수정에 실패했습니다.");
						
			return "redirect:/list.no";
		}		
	}
	
	@RequestMapping("delete.no")
	public String deleteNotice(int nno, HttpSession session) {
		
		int result = noticeService.deleteNotice(nno);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 공지사항을 삭제했습니다.");
		} else {
			session.setAttribute("alertMsg", "공지사항 삭제에 실패했습니다.");
		}
		
		return "redirect:/list.no";
	}
}
