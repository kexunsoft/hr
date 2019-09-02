package com.kexun.hr.dao;

import java.util.List;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.kexun.hr.model.Configfilefirstkind;
import com.kexun.hr.model.Configfilesecondkind;

public class ConfigfilefirstkindTest {
	@SuppressWarnings("resource")
	public static void main(String[] args) {

		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("spring-mybatis.xml");

		ConfigfilefirstkindMapper configfilefirstkindMapper  = (ConfigfilefirstkindMapper) context
				.getBean("configfilefirstkindMapper");
		/**
		 * 添加
		 */
//		Configfilefirstkind record = new Configfilefirstkind();
//		record.setFirstkindname("四级分公司");
//		record.setFirstKindSalaryId("t005");
//		record.setFirstKindSaleId("s005");
//		boolean b = configfilefirstkindMapper.insertSelective(record);
		/**
		 * 删除
		 */
//		boolean b = configfilefirstkindMapper.deleteByPrimaryKey(6);
		/**
		 * 修改
		 */
		Configfilefirstkind record = new Configfilefirstkind();
		record.setFirstkindid(7);
		record.setFirstkindname("四级分公司66");
		record.setFirstKindSalaryId("t005");
		record.setFirstKindSaleId("s005");
		boolean b = configfilefirstkindMapper.updateByPrimaryKeySelective(record);
		List<Configfilefirstkind> findConfigfilefirstkind = configfilefirstkindMapper.findConfigfilefirstkind();
				for (Configfilefirstkind configfilefirstkind : findConfigfilefirstkind) {
					System.out.println(configfilefirstkind);
				}
	}
}
