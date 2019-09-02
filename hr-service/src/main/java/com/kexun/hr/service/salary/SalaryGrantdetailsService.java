package com.kexun.hr.service.salary;

import com.kexun.hr.dao.SalarygrantdetailsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class SalaryGrantdetailsService {


    @Autowired
    private SalarygrantdetailsMapper salarygrantdetailsMapper;


    public List<Map<String, Object>> findBysalaryGrantId(String salaryGrantId) {

       return salarygrantdetailsMapper.findBysalaryGrantId(salaryGrantId);
    }
}
