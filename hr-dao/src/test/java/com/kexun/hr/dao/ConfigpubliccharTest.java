package com.kexun.hr.dao;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.kexun.hr.model.Configmajor;
import com.kexun.hr.model.Configpublicchar;

public class ConfigpubliccharTest {
	@SuppressWarnings("resource")
	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		ConfigpubliccharMapper configpubliccharMapper=(ConfigpubliccharMapper)context.getBean("configpubliccharMapper");
		List<Configpublicchar> findConfigpubliccharXueli = configpubliccharMapper.findConfigpubliccharXueli("学历");
		for (Configpublicchar configpublicchar : findConfigpubliccharXueli) {
			System.out.println(configpublicchar);
		}
	}
}
