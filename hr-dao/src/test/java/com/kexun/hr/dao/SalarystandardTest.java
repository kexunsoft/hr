package com.kexun.hr.dao;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.kexun.hr.model.Salarystandard;

public class SalarystandardTest {
	@SuppressWarnings("resource")
	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		SalarystandardMapper humanfileMapper=(SalarystandardMapper)context.getBean("salarystandardMapper");
		
		List<Salarystandard> findByCheckStatus = humanfileMapper.findByCheckStatus(1);
		for (Salarystandard salarystandard : findByCheckStatus) {
			System.out.println(salarystandard);
		}
	}
}
