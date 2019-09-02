package com.kexun.hr.controller.system;

import javax.servlet.http.HttpSession;

import com.kexun.hr.model.Role;
import com.kexun.hr.service.system.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Users;
import com.kexun.hr.service.system.UserService;

import java.util.List;

@RequestMapping("user")
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    // 登录
    @ResponseBody
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public Msg login(String username, String password, HttpSession session) {
        return userService.login(username, password, session);
    }

    // 查询所有用户
    @RequestMapping("users")
    public String findUsers(@RequestParam(value = "page", defaultValue = "1") int page,
                            @RequestParam(value = "size", defaultValue = "5") int size, Model model) {
        PageInfo<Users> pageInfo = userService.findUsers(page, size);
        model.addAttribute("pageInfo", pageInfo);
        return "users";

    }


    //添加用户页面
    @RequestMapping(value = "useradd", method = RequestMethod.GET)
    public String useradd(Model model) {
        //查询所有角色
        List<Role> roles =
                roleService.findRoles();
        model.addAttribute("roles", roles);
        return "useradd";
    }

    //执行添加操作 post请求
    @ResponseBody
    @RequestMapping(value = "useradd", method = RequestMethod.POST)
    public Msg useradd(Users users) {
        return userService.addUser(users);
    }


    //去 修改用户页面
    @RequestMapping(value = "usermodify", method = RequestMethod.GET)
    public String updUser(Model model, @RequestParam(value = "uid", required = true) int id) {
        //查询所有角色
        List<Role> roles = roleService.findRoles();

        //根据id查询用户
        Users user = userService.findUserById(id);

        System.out.println(user.getRoleId());

        model.addAttribute("roles", roles);

        model.addAttribute("user", user);

        return "usermodify";
    }

    //执行修改用户
    @ResponseBody
    @RequestMapping(value = "usermodify", method = RequestMethod.POST)
    public Msg updUser(Users users, String lastPassword) {
        System.out.println(lastPassword);
        return userService.updUser(users, lastPassword);
    }

    //删除用户
    @RequestMapping("delUser")
    @ResponseBody
    public Msg delUser(@RequestParam(value = "uid", required = true) int uid, HttpSession session) {

        Users user = (Users) session.getAttribute("user");

        if (uid == user.getuId()) {

            return new Msg().error("当前登录用户不能删除");

        } else {
            return userService.delUser(uid);
        }


    }


    //退出登录
    @ResponseBody
    @RequestMapping("loginout")
    public Msg loginOut(HttpSession session) {
        session.removeAttribute("user");
        return new Msg().success("你以安全退出");
    }


}
