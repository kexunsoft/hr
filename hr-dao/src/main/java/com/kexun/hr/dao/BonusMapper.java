package com.kexun.hr.dao;

import com.kexun.hr.model.Bonus;

public interface BonusMapper { 

	int deleteByPrimaryKey(Integer bonid);

	int insertSelective(Bonus record);

	int updateByPrimaryKeySelective(Bonus record);

}