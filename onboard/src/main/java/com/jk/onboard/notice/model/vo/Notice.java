package com.jk.onboard.notice.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String writeDate;
	private int count;
	private String noticeStatus;
	private String userNo;
	
}
