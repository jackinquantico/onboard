package com.jk.onboard.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Board {

	private int boardNo;
	private int boardType;
	private String boardTitle;
	private String boardContent;
	private String writeDate;
	private int count;
	private String boardStatus;
	private String userNo;
}
