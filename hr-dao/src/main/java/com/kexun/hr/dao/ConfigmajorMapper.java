package com.kexun.hr.dao;

import java.util.List;
import java.util.Map;

import com.kexun.hr.model.Configmajor;

/*
 * 职位设置
 */
public interface ConfigmajorMapper {
	
	//添加
	boolean insertSelective(Configmajor record);
	//删除
	boolean deleteByPrimaryKey(Integer majorid);

	//查询所有分页
	public List<Map<String,Object>> findconConfigmajorQueryAll();
	//查询所有去添加界面
	public List<Map<String,Object>> findQueryAllAdd();


	//根据职位分类id查询对应职位
	List<Configmajor> findByidMajorKindIdConfigmajor(Integer majorKindId);
}