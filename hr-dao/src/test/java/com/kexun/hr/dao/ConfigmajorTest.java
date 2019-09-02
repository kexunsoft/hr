package com.kexun.hr.dao;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.kexun.hr.model.Configmajor;
import com.kexun.hr.model.Configmajorkind;

public class ConfigmajorTest {
	@SuppressWarnings("resource")
	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		ConfigmajorMapper configmajorMapper=(ConfigmajorMapper)context.getBean("configmajorMapper");
		
		List<Configmajor> findByidMajorKindIdConfigmajor = configmajorMapper.findByidMajorKindIdConfigmajor(1);
	
		for (Configmajor configmajor : findByidMajorKindIdConfigmajor) {
			System.out.println(configmajor);
		}
	}
}
