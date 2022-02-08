package com.hanulso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hanulso.domain.Criteria;
import com.hanulso.domain.NoticeVO;
import com.hanulso.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor//자동주입시키면 주입된 클래스의 모든 생성자를 생성하시오
public class NoticeServiceImpl implements NoticeService {

	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;//자동주입
	
	@Override
	public void register(NoticeVO notice) {
		
		mapper.insertSelectKey(notice);
	}
	
	@Override
	public List<NoticeVO> getList() {
		
		return mapper.getList();
	}
	
	@Override
	public List<NoticeVO> getListWithPaging(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public NoticeVO read(int bno) {
		mapper.readcount(bno);
		return mapper.read(bno);
	}
	
	@Override
	public boolean update(NoticeVO notice) {
		return mapper.update(notice) == 1;
	}
	
	@Override
	public boolean delete(int bno) {
		return mapper.delete(bno) == 1;
	}
	
	@Override
	public NoticeVO nextPage(int bno) {
		return mapper.nextPage(bno);
	}
	
	@Override
	public NoticeVO prevPage(int bno) {
		return mapper.prevPage(bno);
	}
	
	
}
