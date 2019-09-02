package com.kexun.hr.dao;

import com.kexun.hr.model.Engageexamdetails;

public interface EngageexamdetailsMapper {

	int deleteByPrimaryKey(Integer exdid);

	int insertSelective(Engageexamdetails record);

	int updateByPrimaryKeySelective(Engageexamdetails record);

}