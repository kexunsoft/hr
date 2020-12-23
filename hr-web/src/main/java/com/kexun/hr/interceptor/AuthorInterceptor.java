package com.kexun.hr.interceptor;

import com.kexun.hr.model.Right;
import com.kexun.hr.model.Users;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;

public class AuthorInterceptor extends HandlerInterceptorAdapter {


    //授权拦截器
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        System.out.println(">>>>>>授权拦截器");

        //获取当前访问的地址
        String path = request.getServletPath();

        //加上项目的名字 数据库了存放的地址都有项目 的地址
        path = path;

        System.out.println("您正在访问的地址为" + path);

        //获取session
        HttpSession session = request.getSession();

        //获取登录的时候存入用户对象
        Users user = (Users) session.getAttribute("user");


        //首先判断是否登录
        if (user != null) {
            List<Right> rights = user.getuRole().getRoleRights();

            //排除的链接
            if ("/right/rights".equals(path)) {
                return true;
            }


            //存放权限链接
            HashSet<String> set = new HashSet<String>();

            //将所有的地址存入se他集合
            for (Right right : rights) {
                set.add(right.getUrl());
            }

            boolean contains = set.contains(path);

            System.out.println("是否拥有该界面的访问权限>>>>>>>" + contains);

            //判断该用户是否拥有该权限

            if (contains) {
                //有 放行
                return true;
            } else {
                //没有 判断是ajax请求还是普通的请求
                if (request.getHeader("x-requested-with") != null
                        && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
                    //ajax请求放回 json数据

                    response.setContentType("application/json;charset=utf-8");
                    PrintWriter out = response.getWriter();
                    out.write("{\"code\":\"500\",\"message\":\"您暂未权限访问此地址\"}");
                    return false;
                } else {
                    //普通请求返回 登录界面
                    response.sendRedirect("/hr/login");
                    return false;
                }

            }

        } else {
            //未登录

            System.out.println("未登录");
            if (request.getHeader("x-requested-with") != null
                    && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
                response.setContentType("application/json;charset=utf-8");
                PrintWriter out = response.getWriter();
                out.write("{\"code\":\"500\",\"message\":\"未登录\"}");
                return false;
            } else {
                response.sendRedirect("/hr/login");
                return false;
            }
        }


    }


}
