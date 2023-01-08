package com.jk.onboard.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@ResponseBody
	@RequestMapping(value="idCheck.me", produces="text/html; charset=UTF-8")
	public String idCheck(Member m) {
		
		int count = memberService.idCheck(m);
		
		return (count > 0) ? "NNNNN" : "YYYYY";
	}
	
	@RequestMapping("login.me")
	public String loginUser(Member m, HttpSession session) {
		
		// System.out.println(m);
		Member loginUser = memberService.loginMember(m);
		
		session.setAttribute("loginUser", loginUser);
		
		return "redirect:/";
	}
	
	@RequestMapping("logout.me")
	public String logoutUser(HttpSession session) {
		
		session.removeAttribute("loginUser");
		
		return "redirect:/";
	}
	
}
