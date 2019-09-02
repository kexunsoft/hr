package com.kexun.hr.dao;

import com.kexun.hr.model.Engageinterview;

import java.util.List;
import java.util.Map;

public interface EngageinterviewMapper {

    boolean deleteByPrimaryKey(Integer einid);

    boolean insertSelective(Engageinterview record);

    Engageinterview selectByPrimaryKey(Integer einid);

    boolean updateByPrimaryKeySelective(Engageinterview record);


    List<Map<String, Object>> findAll(int checkStatus);

    Map<String, Object> findByEinId(int einId);

    boolean updCheckStatus(Map<String, Object> map);
}