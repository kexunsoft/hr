package com.kexun.hr.service.system;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.UserMapper;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Users;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    //分页查询所有用户
    public PageInfo<Users> findUsers(int page, int size) {

        PageHelper.startPage(page, size);

        List<Users> users = userMapper.findUsers();

        PageInfo<Users> pageInfo = new PageInfo<Users>(users, 5);

        return pageInfo;
    }

    //登录
    public Msg login(String username, String password, HttpSession session) {

        Users user = userMapper.findUserByName(username);

        if (user != null) {
            if (password.equals(user.getuPassword())) {
                session.setAttribute("user", user);
                return new Msg().success("登录成功").data("username", user.getTrueName());
            } else {
                return new Msg().error("账号或密码错误");
            }
        } else {
            return new Msg().error("用户名或密码不存在");
        }

    }

    //添加用户
    public Msg addUser(Users users) {

        //判断用户名是否已经存在
        Users userByName = userMapper.findUserByName(users.getuName());
        if (userByName == null) {
            return userMapper.addUser(users) ? new Msg().success("添加成功") : new Msg().error("系统错误");
        } else {
            return new Msg().error("用户名已经存在");
        }


    }

    //删除用户
    public Msg delUser(int uid) {


        return userMapper.delUser(uid) ? new Msg().success("删除成功") : new Msg().error("系统错误");

    }

    //修改用户密码
    public Msg updUser(Users users, String lastPassword) {


        if (users != null) {
            //判断密码是否正确

            //根据传过来的用户id去查询用户
            Users userById = userMapper.findUserById(users.getuId());
            if (userById != null) {
                //判断前台的密码与数据库密码是否相同
                if (lastPassword.equals(userById.getuPassword())) {
                    //相同 修改
                    return userMapper.updUser(users) ? new Msg().success("修改成功") : new Msg().success("修改失败");
                } else {
                    return new Msg().error("原密码不正确");
                }

            } else {
                return new Msg().error("用户信息不存在");
            }

        } else {
            return new Msg().error("缺少参数");

        }


    }

    //根据id查询用户
    public Users findUserById(int id) {
        return userMapper.findUserById(id);
    }

}
