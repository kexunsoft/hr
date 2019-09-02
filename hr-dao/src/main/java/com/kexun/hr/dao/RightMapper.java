package com.kexun.hr.dao;

import java.util.List;

import com.kexun.hr.model.Right;

public interface RightMapper {
	
	//根据pid 查询权限
    List<Right> findRights(int pid);
    
    //根据角色id查询权限
    List<Right> findRightByRoleId(int roleID);

    //查询所有权限
    List<Right> findAllRights();
}
