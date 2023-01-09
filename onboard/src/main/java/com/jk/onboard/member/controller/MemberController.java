package com.jk.onboard.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.Session;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	
	/**
	 * 회원가입 처리
	 * @param m : 가입할 회원의 정보
	 * @param profileFile : 프로필 사진 파일
	 */
	@RequestMapping("enroll.me")
	public String insertMember(Member m, HttpSession session, MultipartFile profileFile) {
		
		if (!profileFile.getOriginalFilename().equals("")) {
			
			// 파일명 수정 작업 후 서버에 업로드하기
			// 1. 원본 파일명
			String originName = profileFile.getOriginalFilename();
			
			// 2. 원본 파일명에서 확장자 뽑기
			String ext = originName.substring(originName.lastIndexOf("."));
			
			// 2-2. 현재 시간 추출해서 파일명에 합치기
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			// 3. 멤버아이디 + 확장자 이어붙이기
			String changeName = m.getUserId() + currentTime + ext;
			
			// 4. 업로드하고자 하는 서버의 실경로 알아내기
			String savePath = session.getServletContext().getRealPath("/resources/images/");
			
			// 5. 실경로 + 파일명 합친 뒤 파일 업로드
			try {
				profileFile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			m.setProfile(changeName);
		}
		
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
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	@RequestMapping("update.me")
	public String updateMember(Member m, MultipartFile changeFile, String originFile, HttpSession session) {
		
		// 만약 새로 업로드된 파일이 있을 경우에는 기존 파일 삭제
		
		// 1. 업로드 서버의 실경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/images/");
		
		if (!changeFile.getOriginalFilename().equals("")) {

			// 기존 파일 삭제
			new File(savePath + originFile).delete();
			
			// 1. 원본 파일명
			String originName = changeFile.getOriginalFilename();
						
			// 2. 원본 파일명에서 확장자 뽑기
			String ext = originName.substring(originName.lastIndexOf("."));
			
			// 2-2. 현재 시간 추출해서 파일명에 합치기
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			// 3. 멤버아이디 + 확장자 이어붙이기
			String changeName = m.getUserId() + currentTime + ext;

			try {
				changeFile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			m.setProfile(changeName);
		}
		
		int result = memberService.updateMember(m);
		
		if (result > 0) {
			
			// 세션의 loginUser 정보가 변경되지 않아 변경전 정보로 보이는 이슈
			// => loginUser 정보를 업데이트해주기
			Member loginUser = memberService.selectMember(m);
			
			// 이후에도 파일명이 같으면 강력 새로고침하지 않는 이상 기존 파일을 보여주는 이슈
			// => 파일명에 시간 포함해서 구분
			
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "회원정보 수정에 성공했습니다.");
		} else {
			session.setAttribute("alertMsg", "회원정보 수정에 실패했습니다.");
		}
		
		return "redirect:/myPage.me";
	}
	
	@RequestMapping("delete.me")
	public String deleteMember(Member m, HttpSession session) {
		
		int result = memberService.deleteMember(m);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "성공적으로 탈퇴처리가 완료되었습니다.");
			
			// 탈퇴 이후에는 로그아웃되도록 처리
			logoutUser(session);
		} else {
			session.setAttribute("alertMsg", "회원 탈퇴에 실패했습니다.");
		}
		
		return "redirect:/";
	}
}
