package com.kexun.hr.dao;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.kexun.hr.model.Configfilesecondkind;
import com.kexun.hr.model.Configmajorkind;

public class ConfigmajorkindTest {
	@SuppressWarnings("resource")
	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		ConfigmajorkindMapper configmajorkindMapper=(ConfigmajorkindMapper)context.getBean("configmajorkindMapper");
		
		List<Configmajorkind> findConfigmajorkind = configmajorkindMapper.findConfigmajorkind();
		
		for (Configmajorkind configmajorkind : findConfigmajorkind) {
			System.out.println(configmajorkind);
		}
	}
}
