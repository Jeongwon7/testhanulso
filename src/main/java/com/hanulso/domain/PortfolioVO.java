package com.hanulso.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PortfolioVO {
	private int bno;
	private String writer;
	private String title;
	private String content;
	private Date regdate;
	private String imgurl;
	private int viewcount;
}
