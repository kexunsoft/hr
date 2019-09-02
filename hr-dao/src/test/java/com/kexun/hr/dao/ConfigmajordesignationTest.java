package com.kexun.hr.dao;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.kexun.hr.model.Configmajordesignation;
import com.kexun.hr.model.Configmajorkind;

public class ConfigmajordesignationTest {
	@SuppressWarnings("resource")
	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		ConfigmajordesignationMapper configmajordesignationMapper=(ConfigmajordesignationMapper)context.getBean("configmajordesignationMapper");
		List<Configmajordesignation> findConfigmajordesignation = configmajordesignationMapper.findConfigmajordesignation();
		for (Configmajordesignation configmajordesignation : findConfigmajordesignation) {
			System.out.println(configmajordesignation);
		}
	}
}
