package com.kexun.hr.service.system;

import java.util.*;

import com.kexun.hr.dao.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kexun.hr.dao.RightMapper;
import com.kexun.hr.model.Right;

@Service
public class RightService {

    @Autowired
    private RightMapper rightMapper;

    @Autowired
    private RoleMapper roleMapper;

    //首页左边导航栏
    public List<Map<String, Object>> findRights(int roleId) {
        List<Right> rights = rightMapper.findRightByRoleId(roleId);
        return getAll(rights);
    }


    //查询拥有的权限 权限分配列表
    public List<Map<String, Object>> findHaveRights(int roleId) {
        List<Right> have = rightMapper.findRightByRoleId(roleId);
        List<Right> allRights = rightMapper.findAllRights();
        for (Right all : allRights) {
            for (Right has : have) {

                if (all.getId() == has.getId()) {
                    HashMap<String, Object> map = new HashMap<String, Object>();
                    map.put("roleId", roleId);
                    map.put("rightId", has.getId());
                    int count = roleMapper.sonCount(map);
                    if (count > 0) {
                        all.setChecked(false);
                    } else {
                        all.setChecked(true);
                    }


                }

            }
        }

        System.out.println(allRights);
        return getAllRight(allRights, 0);
    }


    public List<Map<String, Object>> getAllRight(List<Right> rights, int pid) {

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        //全部的
        for (Right right : rights) {

            //如果是按钮就不显示到muew
            if (right.getPid() == pid) {
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("checked", right.isChecked());
                map.put("text", right.getName());
                map.put("id", right.getId());
                map.put("checkbox", true);
                HashMap<String, Object> attributes = new HashMap<String, Object>();
                attributes.put("pId", right.getPid());
                attributes.put("count", right.getCount());
                map.put("attributes", attributes);
                if (right.getCount() > 0) {
                    map.put("children", getAllRight(rights, right.getId()));
                } else {
                    map.put("state", "open");
                }
                list.add(map);
            }

        }
        return list;


    }


    public List<Map<String, Object>> getAll(List<Right> rights) {

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        for (Right right : rights) {
            if (right.getButton() == 0) {
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("F_ModuleId", right.getId());
                map.put("F_ParentId", right.getPid());
                map.put("F_FullName", right.getName());
                if (right.getPid() == 0) {
                    map.put("F_Icon", right.getName());
                } else {
                    map.put("F_Icon", right.getName());
                }
                map.put("F_UrlAddress", right.getUrl());
                list.add(map);
            }

        }
        return list;


    }


}
