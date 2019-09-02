package com.kexun.hr.controller.system;

import java.util.List;
import java.util.Map;

import com.kexun.hr.model.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kexun.hr.service.system.RightService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("right")
public class RightController {

    @Autowired
    private RightService rightService;

    @ResponseBody
    @RequestMapping("rights")
    public List<Map<String, Object>> findRights(HttpSession session) {
       Users users= (Users)session.getAttribute("user");
        return rightService.findRights(users.getRoleId());
    }

    @ResponseBody
    @RequestMapping("findHaveRights")
    public List<Map<String, Object>> findHaveRights(int roleId) {

        return rightService.findHaveRights(roleId);

    }


}
