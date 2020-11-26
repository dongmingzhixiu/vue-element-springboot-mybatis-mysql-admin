package com.orange.project.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.orange.project.entity.SysUser;
import com.orange.project.util.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

@Component
public class BaseCommon {

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private HttpServletRequest request;

    public static HttpServletRequest _request;

    /**
     * 获取用户编号
     *
     * @return
     */
    public String getSessionLoginId() {
        return CommonUtil.isNotOrEmpty(getSessionLogin("id"), "").toString();
    }

    /**
     * 获取session 中的登录信息
     *
     * @param key
     * @return
     */
    public Object getSessionLogin(String key) {
        return getSessionVal("user", key);
    }

    /**
     * 获取session 中的值
     *
     * @param name
     * @param key
     * @return
     */
    public Object getSessionVal(String name, String key) {
        return getSessionVal(name, key, "");
    }

    /**
     * 获取session 中的值
     *
     * @param name
     * @param key
     * @param val
     * @return
     */
    public Object getSessionVal(String name, String key, String val) {
        HttpServletRequest _req = request == null ? _request : request;
        Object obj = _req.getSession().getAttribute(name);
        if (obj instanceof String) {
            return obj.toString();
        }
        if (obj instanceof HashMap || obj instanceof LinkedHashMap || obj instanceof SysUser) {
            Map map = null;
            if (obj instanceof HashMap || obj instanceof SysUser) {
                map = objectMapper.convertValue(obj, HashMap.class);

            }
            if (obj instanceof LinkedHashMap) {
                map = objectMapper.convertValue(obj, LinkedHashMap.class);
            }
            if (CommonUtil.isNotOrEmpty(map)) {
                return map;
            }
            Object _val = map.get(key);
            return CommonUtil.isNotOrEmpty(_val) ? val : _val;
        }
        return obj;
    }


    /**
     * 设置管理员账号
     *
     * @return
     */
    public boolean isAdmin() {
        String userType = this.getSessionLogin("userType").toString();
        return userType.equals("3");
    }


    /**
     * 获取商家编号
     * @return
     */
    public String getMerchantNo(){
        String  merchantNo = "NO" + CommonUtil.random(100000, 999999);
        //通过查询判断商家好是否已经存在
//        TrustMerchant trustMerchant=new TrustMerchant();
//        trustMerchant.setMerchantNo(merchantNo);
//        List list=trustMerchantMapper.selectAll(trustMerchant);
//        if(list.size()>0){
//            return getMerchantNo();
//        }
        return merchantNo;
    }
}
