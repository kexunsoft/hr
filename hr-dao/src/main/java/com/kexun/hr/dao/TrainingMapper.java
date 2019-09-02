package com.kexun.hr.dao;

import com.kexun.hr.model.Training;

public interface TrainingMapper {

	int insertSelective(Training record);

	int updateByPrimaryKeySelective(Training record);

}