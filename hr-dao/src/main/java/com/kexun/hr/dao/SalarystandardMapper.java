package com.kexun.hr.dao;

import com.kexun.hr.model.Salarystandard;

import java.util.List;

public interface SalarystandardMapper {


    boolean deleteByPrimaryKey(Integer standardid);

    boolean insert(Salarystandard record);

    boolean insertSelective(Salarystandard record);

    Salarystandard selectByPrimaryKey(String standardid);

    boolean updateByPrimaryKeySelective(Salarystandard record);

    boolean updateByPrimaryKey(Salarystandard record);

    List<Salarystandard> findByCheckStatus(int checkStatus);

    List<Salarystandard> findAllSalary();

}