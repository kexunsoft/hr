package com.kexun.hr.dao;

import com.kexun.hr.model.Role;

import java.util.List;
import java.util.Map;

public interface RoleMapper {

    //根据id查询角色
    Role findRoleById(int id);

    //查询所有角色
    List<Role> findRoles();

    //添加
    boolean addRole(Role role);

    //修改
    boolean updRole(Role role);

    //删除角色
    boolean delRole(int roleId);

    //分配权限(输入 角色id 和权限id 添加到中间表)
    boolean allocationRight(Map<String, Object> map);

    //根据角色名称查询角色
    Role findByRoleName(String roleName);

    //删除中间表s数据
    boolean delRoleRightByRoleId(int roleId);

    //移除权限
    boolean removeRoleRight(Map<String, Object> map);


    //查询角色拥有的权限的子权限数量
    int sonCount(Map<String,Object> map);


}
