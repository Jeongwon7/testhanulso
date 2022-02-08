package com.hanulso.mapper;

import java.util.List;

import com.hanulso.domain.NoticeVO;
import com.hanulso.domain.PortfolioVO;

public interface MainMapper {
 
	public List<PortfolioVO> portList();
	public List<NoticeVO> noticeList();
}
