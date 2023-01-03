package com.jk.onboard.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Member {

	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String phone;
	private String birth;
	private String gender;
	private String address;
	private Date enrollDate;
	private String userStatus;
	private String profile;
	private String emailKey;
	private String emailAuth;
	
}
