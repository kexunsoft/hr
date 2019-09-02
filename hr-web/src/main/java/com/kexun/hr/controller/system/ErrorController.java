package com.kexun.hr.controller.system;

import com.kexun.hr.model.Msg;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class ErrorController {

    @ResponseBody
    @RequestMapping("/error")
    public Msg error(HttpServletRequest request, HttpServletResponse response) {
        response.setStatus(200);
        Exception error = (Exception) request.getAttribute("error");
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>系统错误>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        error.printStackTrace();
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>END>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
        return new Msg().error(error.getMessage());
    }


    //参数错误

    @ResponseBody
    @RequestMapping("/parm")
    public Msg parm(int i) {
        System.out.println(i);
        return new Msg().success("成功");
    }


    //500错误(适应客户端ajax请求返回错误的ajax数据)
    @RequestMapping("/danger")
    public String danger() {
        System.out.println(1 / 0);
        return "";
    }

}
