package com.kexun.hr.dao;

import com.kexun.hr.model.Configquestionsecondkind;

public interface ConfigquestionsecondkindMapper {

    int deleteByPrimaryKey(Integer secondkindid);


    int insertSelective(Configquestionsecondkind record);


    int updateByPrimaryKeySelective(Configquestionsecondkind record);

}