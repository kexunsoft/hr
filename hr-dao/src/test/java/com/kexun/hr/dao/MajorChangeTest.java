package com.kexun.hr.dao;

import java.util.List;
import java.util.Map;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MajorChangeTest {
	@SuppressWarnings("resource")
	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		MajorchangeMapper bean = (MajorchangeMapper) context.getBean("majorchangeMapper");
		Map<String, Object> selectByKeySingleMajorchange = bean.selectByKeySingleMajorchange(27);
		System.out.println(selectByKeySingleMajorchange);
	}
}
