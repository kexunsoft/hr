package com.kexun.hr.exception;

import com.kexun.hr.model.Msg;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@ControllerAdvice
public class WebExceptionHandle {

    @ResponseBody
    @ExceptionHandler(IllegalStateException.class)
    public Msg illegalStateException(IllegalStateException e) {
        return new Msg().error("缺少参数").data("errorinfo", e.getMessage());
    }

    @ResponseBody
    @ExceptionHandler(MethodArgumentTypeMismatchException.class)
    public Msg methodArgumentTypeMismatchException(MethodArgumentTypeMismatchException e) {
        return new Msg().error("参数类型不匹配").data("errorinfo", e.getMessage());
    }

    /**
     * 处理500异常
     */
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(Exception.class)
    public String handleException(Exception e, HttpServletRequest request, Model model) {

        //设置错误信息
        model.addAttribute("error", e);

        if (request.getHeader("x-requested-with") != null
                && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
            //ajax
            return "forward:/error";
        } else {
            //返回界面
            return "error";
        }

    }


}
