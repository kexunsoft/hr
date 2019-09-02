package com.kexun.hr.dao;

import java.util.List;
import java.util.Map;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.kexun.hr.model.Humanfile;
import com.kexun.hr.model.Salarystandarddetails;

public class HumanFileTest {
	@SuppressWarnings("resource")
	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");
		
		HumanfileMapper humanfileMapper=(HumanfileMapper)context.getBean("humanfileMapper");
		
		//测试新增
		/*Humanfile record=new Humanfile();
		record.setHumanname("admin");
		boolean insertSelective = humanfileMapper.insertSelective(record);
		System.out.println(insertSelective);*/
	
		//测试查询
		/*List<Map<String, Object>> findMoreTableHumanfile = humanfileMapper.findMoreTableHumanfile();
		for (Map<String, Object> map : findMoreTableHumanfile) {
		System.out.println(map);	
		}*/
		
		//测试 转入主键查询单个对象
		Map<String, Object> selectByPrimaryKeyMoreTable = humanfileMapper.selectByPrimaryKeyMoreTable(1);
		System.out.println(selectByPrimaryKeyMoreTable);
	}
}
