package com.hanulso.service;

import java.util.List;

import com.hanulso.domain.Criteria;
import com.hanulso.domain.ReplyVO;

public interface ReplyService {
	
	public int register(ReplyVO vo);//저장
	public ReplyVO get(long rno);
	public int remove(long rno);
	public int modify(ReplyVO reply);
	public List<ReplyVO> getListPage(Criteria cri, long bno);
	public int getCountByBno(long bno);
}
