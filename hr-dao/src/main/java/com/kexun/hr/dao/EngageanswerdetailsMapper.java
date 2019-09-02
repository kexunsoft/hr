package com.kexun.hr.dao;

import com.kexun.hr.model.Engageanswerdetails;

public interface EngageanswerdetailsMapper {

	int deleteByPrimaryKey(Integer andid);

	int insertSelective(Engageanswerdetails record);

	int updateByPrimaryKeySelective(Engageanswerdetails record);

}