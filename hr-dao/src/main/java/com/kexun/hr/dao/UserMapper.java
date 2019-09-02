package com.kexun.hr.dao;

import java.util.List;

import com.kexun.hr.model.Users;


 public interface UserMapper {

    // 根据用户名查询用户
     Users findUserByName(String name);

    //查询所有用户
     List<Users> findUsers();

    //添加用户
     boolean addUser(Users users);

    //删除用户
     boolean delUser(int uid);

    //修改用户密码
     boolean updUser(Users users);

    //根据id查询用户
     Users findUserById(int uid);


}
