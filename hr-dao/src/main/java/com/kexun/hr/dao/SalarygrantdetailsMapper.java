package com.kexun.hr.dao;

import com.kexun.hr.model.Salarygrantdetails;

import java.util.List;
import java.util.Map;

public interface SalarygrantdetailsMapper {

    int insertSelective(Salarygrantdetails record);

    int updateByPrimaryKeySelective(Salarygrantdetails record);

    List<Map<String, Object>> findBysalaryGrantId(String salaryGrantId);
}