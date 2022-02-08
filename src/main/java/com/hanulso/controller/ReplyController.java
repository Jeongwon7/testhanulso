package com.hanulso.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hanulso.domain.Criteria;
import com.hanulso.domain.ReplyVO;
import com.hanulso.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

//url 기준으로 동작할 수 있게 작성한다
//작업   url          http:전송 방식
//등록/replies/new,  post
//조회/replies/:rno, get
//삭제/replies/:rno, delete
//수정/replies/:rno, put or patch
//페이징/replies/pages/:rno/:page, get

@RequestMapping("/replies")
@RestController //메서드의 리턴 타입으로 사용자가 정의한 클래스 타입을 사용할 수 있고 이를 JSON이나 XML로 자동으로 처리할 수 있다
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyService service;
	
	//consumes: 클라이언트가 보내는 content 타입이 명시한 미디어 타입과 같아야한다(입력받는 값이 json인지 체크)
	//produces에 명시한 미디어 타입과 같을 때에 해당 type으로 리스폰스를 보내준다(처리된 데이터를 브라우저로 보낼 때(response)해당 type이 맞는지)
	//ResponseEntity는 정상적인 데이터인지 비정상적인 데이터인지 구분하며, 데이터와 함께 http 헤더의 상태메시지를 같이 전달한다(처리된 상태의 값을 기억)
	//requestBody 는 json 데이터를 원하는 타입으로 바인딩한다. 대부분 json데이터를 서버에 보내서 원하는 타입의 객체로 변환하는 용도로 사용(vo에 값이 저장된다)
	//댓글이 추가된 숫자를 확인해서 브라우저에서 200k 혹은 500 Internal server Error를 반환한다
	
	//consumes는 들어오는 데이터 타입을 정의할 때 사용
	// uri를 호출하는 쪽에서는 헤더에 보내는 데이터가 json이라는 것을 명시해야 한다.
	// Content-Type:application/json
	// produces는 반환하는 데이터 타입을 정의
	// MediaType.APPLICATION_JSON_UTF8_VALUE
	// 이럴 경우 반환 타입이 json으로 강제된다.
	
	//댓글 등록
	@PreAuthorize("isAuthenticated()")//로그인 사람들만 댓글 쓰기 가능
	@PostMapping(value="/new", consumes="application/json", produces = {MediaType.TEXT_PLAIN_VALUE})//TEXT_PLAIN_VALUE 문자
	public ResponseEntity<String> create(@RequestBody ReplyVO vo){
		log.info("VO: "+vo);
		int insertCount = service.register(vo);
		log.info("reply insert count: "+insertCount);
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : //석세스 문자와 상태값 200 리턴
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);//상태값 500 리턴
	}
	
	//댓글 조회
	@GetMapping(value="/{rno}", produces = {MediaType.APPLICATION_XML_VALUE, 
			MediaType.APPLICATION_JSON_UTF8_VALUE}) //직접 처리하고자하는 데이터를 url? uri?에 받을 수 있다 -> REST
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") long rno){//@PathVariable: value값을 타입 변환 해줌
		log.info("get: "+rno);
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	
	//댓글 수정
	@PreAuthorize("principal.username == #vo.replyer")
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH}, value="/{rno}",
			 consumes = "application/json",//넘어오는 데이터 타입 확인(ajax의 contentType과 맞아야 함)
			 produces = {MediaType.TEXT_PLAIN_VALUE})//보내주는 데이터 타입 확인 / 리턴하는 데이터타입이 미디어타입과 같냐
	public ResponseEntity<String> modify (@RequestBody ReplyVO vo, @PathVariable("rno") long rno){
		vo.setRno(rno);
		log.info("modify: "+vo);
		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : 
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 삭제
	@PreAuthorize("principal.username == #vo.replyer")
	@DeleteMapping(value="/{rno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@RequestBody ReplyVO vo, @PathVariable("rno") long rno){
		return service.remove(rno) == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : //"success"를 보내야하니까 <String>
			new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//목록
	@GetMapping(value="/pages/{bno}/{page}", 
			produces = {MediaType.APPLICATION_ATOM_XML_VALUE, 
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReplyVO>> getList(@PathVariable("page") int page, @PathVariable("bno") long bno){
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}
}
