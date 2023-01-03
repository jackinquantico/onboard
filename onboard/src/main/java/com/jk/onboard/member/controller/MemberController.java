package com.jk.onboard.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jk.onboard.member.model.service.MemberService;
import com.jk.onboard.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired private MemberService memberService;
	 
	/**
	 * 회원가입 페이지로 포워딩
	 */
	@RequestMapping("enrollForm.me")
	public String memberEnrollForm() {
		
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("enroll.me")
	public String insertMember(Member m, HttpSession session) {
		
		int result = memberService.insertMember(m);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 회원가입되었습니다.");
		} else {
			session.setAttribute("alertMsg", "회원가입에 실패했습니다.");
		}
		
		return "redirect:/";
	}
	
	
}
