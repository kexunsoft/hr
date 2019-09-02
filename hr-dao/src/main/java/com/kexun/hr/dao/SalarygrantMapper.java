package com.kexun.hr.dao;

import com.kexun.hr.model.Humanfile;
import com.kexun.hr.model.Salarygrant;

import java.util.List;
import java.util.Map;

public interface SalarygrantMapper {

    int deleteByPrimaryKey(Integer salarygrantid);

    int insert(Salarygrant record);

    int insertSelective(Salarygrant record);

    Salarygrant selectByPrimaryKey(Integer salarygrantid);

    int updateByPrimaryKeySelective(Salarygrant record);

    int updateByPrimaryKey(Salarygrant record);

    List<Map<String, Object>> findFirst();

    List<Map<String, Object>> findSecound();

    List<Map<String, Object>> findThird();

    List<Map<String, Object>> findFirstfindHuman(int pid);

    List<Map<String, Object>> findSecoundfindHuman(int pid);

    List<Map<String, Object>> findThirdfindHuman(int pid);

    List<Map<String, Object>> findByCheckStatus(int status);
}