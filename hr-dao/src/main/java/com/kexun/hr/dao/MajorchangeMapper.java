package com.kexun.hr.dao;

import java.util.List;
import java.util.Map;

import com.kexun.hr.model.Humanfile;
import com.kexun.hr.model.Majorchange;

/*
 * 职位调动管理dao层
 */
public interface MajorchangeMapper {
    
	//高级查询 多条件查询
	List<Map<String, Object>> findByMoreIfMajorchange(Map<String,Object> map);
	
	//插入调动记录
	boolean insertSelective(Majorchange majorchange);
	
	//查询未审核通过的所有数据
	List<Map<String, Object>> findByMajorChangeCheckStatusNo();
	
	//根据主键查询单个对象 多表
	Map<String, Object> selectByKeyMajorChangeck(Integer mchId);
	
	//进行审核修改
	boolean updateByPrimaryKeySelective(Majorchange majorchange);
	
	//查询已审核通过的数据
	List<Map<String, Object>> findByMajorChangeCheckStatusYes(Map<String, Object> map);
	
	//根据主键查询单个对象 14连表
	Map<String, Object> selectByKeySingleMajorchange(Integer mchid);
}