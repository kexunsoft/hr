package com.kexun.hr.interceptor;

import com.kexun.hr.model.Users;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        System.out.println(">>>>>>登录拦截器");

        //获取session
        HttpSession session = request.getSession();

        //获取登录的时候存入用户对象
        Users user = (Users) session.getAttribute("user");

        //首先判断是否登录
        if (user != null) {
            return true;
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
//                response.sendRedirect("/hr/login");
                PrintWriter out = response.getWriter();
                out.println("<script>top.location.href ='" + request.getContextPath() + "/login'" + "</script>");
                out.close();
                return false;
            }
        }

    }
}
