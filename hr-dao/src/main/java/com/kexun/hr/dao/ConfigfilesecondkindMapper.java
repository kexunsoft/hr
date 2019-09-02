package com.kexun.hr.dao; 

import java.util.List;
import java.util.Map;

import com.kexun.hr.model.Configfilefirstkind;
import com.kexun.hr.model.Configfilesecondkind;

public interface ConfigfilesecondkindMapper {

	

	// 添加	
	 boolean insertSelective(Configfilesecondkind record);
	//修改
	boolean updateByPrimaryKeySelective(Configfilesecondkind record);
	//删除
	boolean deleteByPrimaryKey(Integer secondkindid);
	//查询一级机构ID查询二级机构
	List<Configfilesecondkind> findByFirstKindId(Integer firstKindId);
	//查询单个二级机构
	public Map<String, Object> inquireSecondkindSingle(Integer secondkindid);
	//查询所有二级机构
	public List<Map<String,Object>> findByFirstKindQueryAll();
	
	// 查询所有二级机构
	public List<Configfilesecondkind> findConfigfilesecondkind();
			
	
}