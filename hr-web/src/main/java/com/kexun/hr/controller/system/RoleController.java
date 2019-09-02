package com.kexun.hr.controller.system;

import com.github.pagehelper.PageInfo;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Role;
import com.kexun.hr.service.system.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("role")
public class RoleController {
    @Autowired
    private RoleService roleService;

    //分页查询
    @RequestMapping(value = "roles", method = RequestMethod.GET)
    public String roles(@RequestParam(value = "page", defaultValue = "1") int page,
                        @RequestParam(value = "size", defaultValue = "5") int size, Model model) {

        PageInfo<Role> pageInfo = roleService.findRoles(page, size);

        model.addAttribute("pageInfo", pageInfo);

        return "roles";

    }

    //添加角色面
    @RequestMapping(value = "addRole", method = RequestMethod.GET)
    public String addRole() {

        return "addRole";
    }

    //添加操作
    @ResponseBody
    @RequestMapping(value = "addRole", method = RequestMethod.POST)
    public Msg addRole(Role role) {
        return roleService.addRole(role);
    }


    //修改页面
    @RequestMapping(value = "updRole", method = RequestMethod.GET)
    public String updRole(int roleId, Model model) {

        Role role = roleService.findRoleById(roleId);

        model.addAttribute("role", role);


        return "roleModify";

    }

    //修改操作
    @ResponseBody
    @RequestMapping(value = "updRole", method = RequestMethod.POST)
    public Msg updRole(Role role) {
        return roleService.updRole(role);
    }

    //删除角色
    @ResponseBody
    @RequestMapping("delRole")
    public Msg delRole(int roleId) {
        return roleService.delRole(roleId);
    }

    //分配权限页面
    @RequestMapping(value = "allocationRight", method = RequestMethod.GET)
    public String allocationRight(int roleId, Model model) {

        model.addAttribute("roleId", roleId);

        return "allocationRight";
    }

    //添加权限 勾选子子权限同时勾选父权限
    @ResponseBody
    @RequestMapping(value = "allocationRight", method = RequestMethod.POST)
    public Msg addRight(String rightIds, int roleId) {

        return roleService.allocationRight(rightIds, roleId);

    }


}
