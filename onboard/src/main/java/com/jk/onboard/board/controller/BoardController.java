package com.jk.onboard.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jk.onboard.board.model.service.BoardService;
import com.jk.onboard.board.model.vo.Board;
import com.jk.onboard.common.model.vo.PageInfo;
import com.jk.onboard.common.template.Pagination;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("list.fb")
	public String fdboardListView(@RequestParam(value="cpage", defaultValue="1")int currentPage, Model model) {
		
		int listCount = boardService.selectFdboardListCount();
		int pageLimit = 5;
		int boardLimit = 10;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> blist = boardService.selectFdboardList(pi);
		
		model.addAttribute("blist", blist);
		model.addAttribute("pi", pi);
		
		return "fboard/fboardListView";
	}
	
	@RequestMapping("detail.fb")
	public String fdboardDetailView(int bno, Model model, HttpSession session) {
		
		int result = boardService.increaseCount(bno);
		
		if (result > 0) {
			
			Board b = boardService.selectBoard(bno);
			model.addAttribute("b", b);
			return "fboard/fboardDetailView";
		} else {
			
			session.setAttribute("alertMsg", "해당 게시글이 존재하지 않습니다.");
			return "redirect:/list.fb";
		}
	}
}
