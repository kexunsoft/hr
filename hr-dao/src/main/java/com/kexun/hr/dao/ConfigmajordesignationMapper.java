package com.kexun.hr.dao;

import java.util.List;
import java.util.Map;

import com.kexun.hr.model.Configmajordesignation;

/*
 * 职称设置
 */
public interface ConfigmajordesignationMapper {

	
	
	//删除
	boolean deleteByPrimaryKey(Integer cmdid);
	

	//查询所有职称
	List<Configmajordesignation> findConfigmajordesignation();
	
	//查询所有职称分页
	public List<Map<String,Object>> findtechnicalQueryAll();


	
}