package com.kexun.hr.dao;

import com.kexun.hr.model.Configprimarykey;

public interface ConfigprimarykeyMapper {

	int deleteByPrimaryKey(Integer prkid);

	int insertSelective(Configprimarykey record);

	int updateByPrimaryKeySelective(Configprimarykey record);

}