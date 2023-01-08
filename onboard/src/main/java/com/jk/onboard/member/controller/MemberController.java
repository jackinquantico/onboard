package com.jk.onboard.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
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
	public String loginUser(Member m, HttpSession session, String saveId, HttpServletResponse response) {
		
		// 아이디 저장 쿠키
		if (saveId != null && saveId.equals("Y")) {
			Cookie cookie = new Cookie("saveId", m.getUserId());
			cookie.setMaxAge(1 * 60 * 60 * 24);
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("saveId", m.getUserId());
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		Member loginUser = memberService.loginMember(m);
		
		if (loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "로그인에 성공했습니다.");
		} else {
			session.setAttribute("alertMsg", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("logout.me")
	public String logoutUser(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("find.id")
	public String findId() {
		return "member/findId";
	}
	
	@RequestMapping("find.pwd")
	public String findPwd() {
		return "member/findPwd";
	}
	
	@ResponseBody
	@RequestMapping(value="findId.me", produces="text/html; charset=UTF-8")
	public String findUserId(Member m) {
		
		int result = memberService.countUserId(m);

		String userId = "";
		
		if (result > 0) {
			userId = memberService.findUserId(m);
		}
		
		return userId;
	}
	
	@ResponseBody
	@RequestMapping(value="findPwd.me", produces="text/html; charset=UTF-8")
	public String findUserPwd(Member m) {
		
		int result = memberService.countUserPwd(m);
		
		String userPwd = "";
		
		if (result > 0) {
			userPwd = memberService.findUserPwd(m);
		}
		
		System.out.println(result);
		System.out.println(userPwd);
		
		return userPwd;
	}
	
}
