package com.kexun.hr.dao;

import java.util.List;

import com.kexun.hr.model.Configfilefirstkind;
import com.kexun.hr.model.Users;

/*
 * 一级机构dao
 */
public interface ConfigfilefirstkindMapper {
    
	//查询所有
	public List<Configfilefirstkind> findConfigfilefirstkind();
	//添加
	boolean insertSelective(Configfilefirstkind record);
	//删除
	boolean deleteByPrimaryKey(Integer firstkindid);
	//修改
	boolean updateByPrimaryKeySelective(Configfilefirstkind record);
	//查询单个机构
	public Configfilefirstkind findConfigfilefirstkindrById(int firstkindid);
	 
}