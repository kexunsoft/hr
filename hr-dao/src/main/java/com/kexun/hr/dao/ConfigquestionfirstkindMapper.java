package com.kexun.hr.dao;

import com.kexun.hr.model.Configquestionfirstkind;

public interface ConfigquestionfirstkindMapper {

    int deleteByPrimaryKey(Integer firstkindid);


    int insertSelective(Configquestionfirstkind record);


    int updateByPrimaryKeySelective(Configquestionfirstkind record);

}