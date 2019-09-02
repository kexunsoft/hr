package com.kexun.hr.service.system;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kexun.hr.dao.RightMapper;
import com.kexun.hr.dao.RoleMapper;
import com.kexun.hr.model.Msg;
import com.kexun.hr.model.Right;
import com.kexun.hr.model.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import utils.RightUtil;

import java.lang.reflect.Array;
import java.util.*;

@Service
public class RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private RightMapper rightMapper;


    //根据id查询
    public Role findRoleById(int id) {
        return roleMapper.findRoleById(id);
    }

    //查询所有角色
    public List<Role> findRoles() {
        return roleMapper.findRoles();
    }

    //分页查询
    public PageInfo<Role> findRoles(int page, int size) {

        PageHelper.startPage(page, size);

        List<Role> roles = roleMapper.findRoles();

        return new PageInfo<Role>(roles, 5);

    }

    //添加
    public Msg addRole(Role role) {

        //判断是否存在角色

        Role byRoleName = roleMapper.findByRoleName(role.getRoleName());
        if (byRoleName == null) {
            if (roleMapper.addRole(role)) {
                return new Msg().success("添加成功");
            } else {
                return new Msg().error("系统错误");
            }

        } else {

            return new Msg().error("已经存在相同名称的角色");
        }


    }

    //修改
    public Msg updRole(Role role) {
        return roleMapper.updRole(role) ? new Msg().success("修改成功") : new Msg().error("系统错误");
    }

    //删除角色
    public Msg delRole(int roleId) {

        //删除中间表数据
//        DELETE FROM roleright WHERE roleId=5
        boolean b = roleMapper.delRoleRightByRoleId(roleId);
        if (b) {
            return roleMapper.delRole(roleId) ? new Msg().success("删除成功") : new Msg().error("系统错误");
        } else {
            return new Msg().error("系统错误");
        }

    }

    //分配权限(输入 角色id 和权限id 添加到中间表)
    public Msg allocationRight(String rights, int roleId) {
        try {
            if (!"".equals(rights)) {
                String[] str = rights.split(",");

                List<Right> rightByRoleId = rightMapper.findRightByRoleId(roleId);

                int[] newarr = new int[str.length];
                for (int i = 0; i < str.length; i++) {
                    newarr[i] = Integer.parseInt(str[i]);
                }

                int[] lastarr = new int[rightByRoleId.size()];
                for (int i = 0; i < rightByRoleId.size(); i++) {
                    lastarr[i] = rightByRoleId.get(i).getId();
                }

                Set<Integer> add = RightUtil.add(newarr, lastarr);

                System.out.println(add);

                for (int i : add) {
                    System.out.println("添加>> 角色:" + roleId + "权限:" + i);
                    HashMap<String, Object> map = new HashMap<String, Object>();
                    map.put("roleId", roleId);
                    map.put("rightId", i);
                    roleMapper.allocationRight(map);
                }


                Set<Integer> delete = RightUtil.delete(newarr, lastarr);

                for (int i : delete) {
                    HashMap<String, Object> map = new HashMap<String, Object>();
                    map.put("roleId", roleId);
                    map.put("rightId", i);
                    System.out.println("删除>> 角色:" + roleId + "权限:" + i);
                    roleMapper.removeRoleRight(map);
                }

            } else {
                roleMapper.delRoleRightByRoleId(roleId);

            }
            return new Msg().success("数据已更新");
        } catch (Exception e) {

            return new Msg().error("系统错误").data("info", e.getMessage());
        }


    }


    public List<Right> getAllRight(List<Right> rights, int pid) {

        List<Right> list = new ArrayList<Right>();
        //全部的
        for (Right right : rights) {

            if (right.getPid() == pid) {
                List<Right> allRight = getAllRight(rights, right.getId());
                list.addAll(allRight);
            }

        }
        return list;
    }


}
