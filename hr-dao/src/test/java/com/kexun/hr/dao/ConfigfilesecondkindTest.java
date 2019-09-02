package com.kexun.hr.dao;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.kexun.hr.model.Configfilesecondkind;

public class ConfigfilesecondkindTest {
	@SuppressWarnings("resource")
	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		
		//���Ը���һ������������ѯ��������
		ConfigfilesecondkindMapper configfilesecondkindMapper=(ConfigfilesecondkindMapper)context.getBean("configfilesecondkindMapper");
		List<Configfilesecondkind> findByFirstKindId = configfilesecondkindMapper.findByFirstKindId(2);
		for (Configfilesecondkind configfilesecondkind : findByFirstKindId) {
			System.out.println(configfilesecondkind);
		}
	}
}
