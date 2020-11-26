package com.orange.project;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.orange.project.controller.BaseCommon;
import com.orange.project.entity.SysUser;
import com.orange.project.response.BaseResponse;
import com.orange.project.response.StatusCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.HashMap;

@Component
class LoginInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    private ObjectMapper objectMapper;


    private static String[] staticFile = new String[]{
            ".js",
            ".css",
            ".svg",
            ".png",
            ".jpg",
            ".jpeg",
            ".ttf",
            ".wof"
    };

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        String uri = request.getRequestURI();

        if (uri.equals("/index.html")) {
            return true;
        }
        for (int i = 0; i < staticFile.length; i++) {
            String end =uri.indexOf(".")>0? uri.substring(uri.lastIndexOf(".")):uri;
            if (end.equalsIgnoreCase(staticFile[i].toLowerCase())) {
                return true;
            }
        }


        SysUser user = (SysUser) request.getSession().getAttribute("user");
        //如果session中没有user，表示没登陆
        if (user == null) {
            //这个方法返回false表示忽略当前请求，如果一个用户调用了需要登陆才能使用的接口，如果他没有登陆这里会直接忽略掉
            //当然你可以利用response给用户返回一些提示信息，告诉他没登陆
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
            HashMap map = new HashMap();
            map.put("path", "/login");
            map.put("msg", "没有权限访问或者登陆已经失效！");
            BaseResponse baseResponse = new BaseResponse(StatusCode.Fail, "noLogin", map);
            PrintWriter out = response.getWriter();
            String str = objectMapper.writeValueAsString(baseResponse);
            out.write(str);
            return false;
        } else {
            BaseCommon._request = request;
            return true;    //如果session里有user，表示该用户已经登陆，放行，用户即可继续调用自己需要的接口
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
}
