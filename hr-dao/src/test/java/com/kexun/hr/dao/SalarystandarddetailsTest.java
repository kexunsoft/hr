package com.kexun.hr.dao;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.kexun.hr.model.Salarystandarddetails;
import com.kexun.hr.model.Users;

public class SalarystandarddetailsTest {
	@SuppressWarnings("resource")
	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		SalarystandarddetailsMapper salarystandarddetailsMapper=(SalarystandarddetailsMapper)context.getBean("salarystandarddetailsMapper");
		
		List<Salarystandarddetails> findSalarystandarddetails = salarystandarddetailsMapper.findSalarystandarddetails();
		
		for (Salarystandarddetails salarystandarddetails : findSalarystandarddetails) {
			System.out.println(salarystandarddetails);
		}
	}
}
