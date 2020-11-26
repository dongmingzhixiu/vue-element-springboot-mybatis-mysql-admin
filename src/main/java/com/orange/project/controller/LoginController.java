package com.orange.project.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.orange.project.entity.SysUser;
import com.orange.project.mapper.SysUserMapper;
import com.orange.project.response.BaseResponse;
import com.orange.project.response.StatusCode;
import com.orange.project.util.CommonUtil;
import com.orange.project.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.regex.Pattern;

/**
 * describe:
 * author:jpw
 * Date:2020/8/25
 * Time:16:38
 */
@RestController
@RequestMapping("login")
public class LoginController {


    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private Environment env;


    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    public static HttpSession session;

    /**
     * 查询
     *
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public BaseResponse getSysUserInfo(@RequestBody SysUser sysUser, HttpServletRequest request) throws UnsupportedEncodingException, JsonProcessingException {

        if (CommonUtil.isNotOrEmpty(sysUser.getPhone()) || CommonUtil.isNotOrEmpty(sysUser.getPassword())) {
            return new BaseResponse(StatusCode.Fail, "手机号码或密码不能为空!");
        }
        if (!Pattern.matches("^[A-Z]*$", sysUser.getPassword())) {
            String password = MD5.encrypt(sysUser.getPhone(), sysUser.getPassword());
            sysUser.setPassword(password);
        }
        SysUser sysUser1 = sysUserMapper.selectByLogin(sysUser);
        if (CommonUtil.isNotOrEmpty(sysUser1)) {
            return new BaseResponse(StatusCode.Fail, "手机号码或密码错误!");
        }
        //保存登陆session
        String code = objectMapper.writeValueAsString(sysUser1);
        code = code.hashCode() + "";
        request.getSession().setAttribute("user", sysUser1);  // 保存userName到session看这里
        return new BaseResponse(StatusCode.Success, sysUser1, code);
    }


    /**
     * 查询
     *
     * @return
     */
    @RequestMapping(value = "/loginOut", method = RequestMethod.POST)
    public BaseResponse loginOut(HttpServletRequest request) throws UnsupportedEncodingException, JsonProcessingException {

        request.getSession().setAttribute("user", "");
        request.getSession().removeAttribute("user");
        return new BaseResponse(StatusCode.Success);
    }

}
