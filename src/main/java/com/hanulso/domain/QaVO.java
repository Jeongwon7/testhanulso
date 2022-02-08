package com.hanulso.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class QaVO {
	private int bno;
	private String writer;
	private String title;
	private String content; //질문
	private Date regdate;
	private int status;
	private int viewcount;
	
	private int qno;
	private String ancontent; //답글 

}
