package com.hanulso.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Setter;

@Component
@Data
public class Restaurant {
	
	@Setter(onMethod_ = @Autowired)
	// �ڵ����� Setter �޼��带 ������ �ִ� ����
	// onMethod �Ӽ�: Setter �޼����� ������ �޼��忡 �߰��� ������̼��� �����Ѵ�
	// setChef()�� @Autowired ������̼��� �߰��ϵ��� �Ѵ�
	// @Autowired: ������ ���ο��� �ڽ��� Ư���� ��ü�� �������̹Ƿ� 
	// �ڽſ��� �ش� Ÿ���� ���� �����϶�� ǥ���̴� chef Ÿ���� ��ü�� �ڵ����� ���Եȴ�
	private Chef chef;
	
	
}
