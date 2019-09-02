package com.kexun.hr.dao;

import java.util.List;
import java.util.Map;

import com.kexun.hr.model.Configmajorkind;

public interface ConfigmajorkindMapper {
	
	//删除
	boolean deleteByPrimaryKey(Integer majorkindid);
	//添加
	boolean insertSelective(Configmajorkind record);
	//查询所有分页
	public List<Map<String,Object>> findconfigmajorkindQueryAll();
	
	//查询所有职位分类
	List<Configmajorkind> findConfigmajorkind();
	
	public List<Map<String,Object>> findConfigmajorkindQueryAll();
}