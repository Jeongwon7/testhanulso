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
// ���� �׽�Ʈ �ڵ尡 �������� �����ϴ� ������ �� ���̴�
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//������ Ŭ������ ���ڿ��� �̿��ؼ� �ʿ��� ��ü���� ������ ���� ��ü�� ����Ѵ�
@Log4j
//lombok�� �̿��ؼ� �α׳� ����ϴ� logger�� ������ �����Ѵ�. ������ ó�� ���̵� ��밡���ϴ�
public class SampleTest {
	@Setter(onMethod_ = @Autowired)
	private Restaurant restaurant;
	
	@Test
	public void test() {
		assertNotNull(restaurant);//restaurant ������ null�� �ƴϾ�� �׽�Ʈ ����
		log.info("-------------");
		log.info(restaurant.getChef());
	}
}
