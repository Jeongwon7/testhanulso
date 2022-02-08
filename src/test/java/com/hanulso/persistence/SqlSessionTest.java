package com.hanulso.persistence;

import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SqlSessionTest {
	
	
	@Setter(onMethod_ = @Autowired)
	private DataSource datasource;
	
	@Setter(onMethod_ = @Autowired)
	private SqlSessionFactory sqlsessionfactory;
	
	@Test
	public void testMybatis() {
		
		try {
			SqlSession session = sqlsessionfactory.openSession();//세션 객체 생성
			Connection conn = session.getConnection();//디비 테스트
			log.info(session);
			log.info(conn);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
