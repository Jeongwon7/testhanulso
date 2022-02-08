package com.hanulso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanulso.domain.Criteria;
import com.hanulso.domain.ReplyVO;
import com.hanulso.mapper.ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(long rno) {
		return mapper.read(rno);
	}

	@Override
	public int remove(long rno) {
		return mapper.delete(rno);
	}

	@Override
	public int modify(ReplyVO reply) {
		return mapper.update(reply);
	}

	@Override
	public List<ReplyVO> getListPage(Criteria cri, long bno) {
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public int getCountByBno(long bno) {
		return mapper.getCountByBno(bno);
	}

}
