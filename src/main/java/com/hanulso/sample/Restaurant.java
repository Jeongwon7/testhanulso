package com.hanulso.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Setter;

@Component
@Data
public class Restaurant {
	
	@Setter(onMethod_ = @Autowired)
	// 자동으로 Setter 메서드를 생성해 주는 역할
	// onMethod 속성: Setter 메서드의 생성시 메서드에 추가할 어노테이션을 지정한다
	// setChef()에 @Autowired 어노테이션을 추가하도록 한다
	// @Autowired: 스프링 내부에서 자신이 특정한 객체에 의존적이므로 
	// 자신에게 해당 타입의 빈을 주입하라는 표시이다 chef 타입의 객체가 자동으로 주입된다
	private Chef chef;
	
	
}
