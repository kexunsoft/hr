package com.kexun.hr.dao;

import com.kexun.hr.model.Engagemajorrelease;

import java.util.List;
import java.util.Map;

public interface EngagemajorreleaseMapper {
    boolean deleteByPrimaryKey(Integer mreid);

    boolean insertSelective(Engagemajorrelease record);

    Engagemajorrelease selectByPrimaryKey(Integer mreid);

    boolean updateByPrimaryKeySelective(Engagemajorrelease record);

    //查询所有
    List<Map<String,Object>> findAll();

    //查询单个返回map
    Map<String,Object> findOneById(int mreId);



}