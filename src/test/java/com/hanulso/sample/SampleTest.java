package com.hanulso.sample;


import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
// 현재 테스트 코드가 스프링을 실행하는 역할을 할 것이다
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//지정된 클래스나 문자열을 이용해서 필요한 객체들을 스프링 내에 객체로 등록한다
@Log4j
//lombok을 이용해서 로그나 기록하는 logger를 변수로 생성한다. 별도의 처리 없이도 사용가능하다
public class SampleTest {
	@Setter(onMethod_ = @Autowired)
	private Restaurant restaurant;
	
	@Test
	public void test() {
		assertNotNull(restaurant);//restaurant 변수가 null이 아니어야 테스트 성공
		log.info("-------------");
		log.info(restaurant.getChef());
	}
}
