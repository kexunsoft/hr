package com.kexun.hr.dao;

import java.util.List;
import java.util.Map;

import com.kexun.hr.model.Configpublicchar;
import com.kexun.hr.model.Salarystandarddetails;

/*
 * 薪酬标准单详细信息dao层
 */
public interface SalarystandarddetailsMapper {
	
	//删除
    boolean deleteByPrimaryKey(Integer itemid);
    //添加
    boolean insertSelective(Salarystandarddetails record);
   
    //修改
    boolean updateByPrimaryKeySelective(Salarystandarddetails record);
    //查询所有薪酬分页
  	public List<Map<String,Object>> findSalarystandarddetailsQueryAll();
  	
  
  	
    //查询所有薪酬项目
    List<Salarystandarddetails> findSalarystandarddetails();

    List<Salarystandarddetails> findBystandardId(String standardId);
    
}