package com.kexun.hr.dao;

import com.kexun.hr.model.Engageexam;

public interface EngageexamMapper {

	int deleteByPrimaryKey(Integer examnumber);

	int insertSelective(Engageexam record);

	int updateByPrimaryKeySelective(Engageexam record);

}