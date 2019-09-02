package com.kexun.hr.dao;

import com.kexun.hr.model.Engageanswer;

public interface EngageanswerMapper {

	int deleteByPrimaryKey(Integer ansid);

	int insertSelective(Engageanswer record);

	int updateByPrimaryKeySelective(Engageanswer record);

}