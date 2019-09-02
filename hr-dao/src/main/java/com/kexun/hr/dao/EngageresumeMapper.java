package com.kexun.hr.dao;

import com.kexun.hr.model.Engageresume;

import java.util.List;
import java.util.Map;

public interface EngageresumeMapper {
    boolean deleteByPrimaryKey(Integer resid);

    boolean insertSelective(Engageresume record);

    Engageresume selectByPrimaryKey(Integer resid);

    boolean updateByPrimaryKeySelective(Engageresume record);

    List<Map<String, Object>> findByExample(Map<String, Object> map);


    Map<String, Object> findOneById(int resumeId);


}