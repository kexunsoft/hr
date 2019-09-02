package com.kexun.hr.dao;

import java.util.List;
import java.util.Map;

import com.kexun.hr.model.Configfilethirdkind;

public interface ConfigfilethirdkindMapper {

	
	//添加
	boolean insertSelective(Configfilethirdkind record);
	//修改
	boolean updateByPrimaryKeySelective(Configfilethirdkind record);
	//删除
	boolean deleteByPrimaryKey(Integer thirdkindid);
	//查询所有
	List<Configfilethirdkind> findBysecondKindIdConfigfilethirdkind(Integer secondKindId);
	
	//查询单个三级机构
	public Map<String, Object> inquireConfigfilethirdkind(Integer thirdkindid);
	//查询所有三级机构
	public List<Map<String,Object>> findConfigfilethirdkindQueryAll();
		
	// 查询所有三级机构
	public List<Configfilethirdkind> findConfigfilethirdkind();
}