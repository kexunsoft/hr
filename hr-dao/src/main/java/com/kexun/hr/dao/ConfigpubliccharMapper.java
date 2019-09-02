package com.kexun.hr.dao;

import java.util.List;
import java.util.Map;

import com.kexun.hr.model.Configpublicchar;

/*
 * 公共字段
 */
public interface ConfigpubliccharMapper {
	
	//添加
	boolean insertSelective(Configpublicchar record);
	
	//删除
	boolean deleteByPrimaryKey(Integer pbcid);
	//查询所有
	public List<Map<String,Object>> findConfigpubliccharQueryAll();
	// 查询所有属性返回list集合
	public List<Map<String,Object>> findConfigpublicchar();
	
	//查询所有学历
	List<Configpublicchar> findConfigpubliccharXueli(String attributekind);
}