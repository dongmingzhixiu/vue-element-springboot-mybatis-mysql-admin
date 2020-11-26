package com.orange.project.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.orange.project.annotation.MyBatisPageHelper;
import com.orange.project.entity.SysUser;
import com.orange.project.mapper.SysUserMapper;
import com.orange.project.response.BaseResponse;
import com.orange.project.response.StatusCode;
import com.orange.project.util.CommonUtil;
import com.orange.project.util.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.util.Date;

/**
 * describe:
 * author:jpw
 * Date:2020/8/25
 * Time:16:38
 */
@RestController
@RequestMapping("sysUser")
public class SysUserController {


    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private Environment env;


    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private BaseCommon baseCommon;

    /**
     * 查询
     *
     * @return
     */
    @MyBatisPageHelper(pageSize = 10)
    @ResponseBody
    @RequestMapping(value = "/get", method = RequestMethod.GET)
    public BaseResponse getSysUserAll(@RequestParam("pageNumber") int currPage, String sex, String userType, String phone, String nickName, String merchantNo) throws UnsupportedEncodingException {
        SysUser sysUser = new SysUser();
        sysUser.setPhone(phone);
        sysUser.setNickName(nickName);
        String type = baseCommon.getSessionLogin("userType").toString();
        if (!type.equals("3")) {
            merchantNo = baseCommon.getSessionLogin("merchantNo").toString();
            if (!CommonUtil.isNotOrEmpty(userType)) {
                sysUser.setUserType(Integer.parseInt(CommonUtil.isNotOrEmpty(userType, "1")));
            }
        }
        sysUser.setMerchantNo(merchantNo);
        sysUser.setSex(sex);
        return new BaseResponse(sysUserMapper.selectAll(sysUser));
    }

    /**
     * 查询一条
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public BaseResponse getSysUserById(Integer id) {
        return new BaseResponse(sysUserMapper.selectByPrimaryKey(id));
    }


    /**
     * 新增
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public BaseResponse add(@RequestBody SysUser sysUser) {
        sysUser.setPassword(MD5.encrypt(sysUser.getPhone(), "123456"));
        sysUser.setCreatedBy(baseCommon.getSessionLoginId());
        sysUser.setCreatedTime(new Date());
        if (CommonUtil.isNotOrEmpty(sysUser.getMerchantNo()) && !baseCommon.isAdmin()) {
            String merchantNo = baseCommon.getSessionLogin("merchantNo").toString();
            if (CommonUtil.isNotOrEmpty(merchantNo)) {
                merchantNo = baseCommon.getMerchantNo();
            }
            sysUser.setMerchantNo(merchantNo);
        }

        return new BaseResponse(sysUserMapper.insertSelective(sysUser));
    }


    /**
     * 修改
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/upd", method = RequestMethod.POST)
    public BaseResponse upd(@RequestBody SysUser sysUser) {
        if (sysUser.getUserType() == 3) {
            return new BaseResponse(StatusCode.Fail, "管理员不能被修改！");
        }
        sysUser.setUpdatedTime(new Date());
        sysUser.setUpdatedBy(baseCommon.getSessionLoginId());
        if (CommonUtil.isNotOrEmpty(sysUser.getPassword()) || sysUser.getPassword().equals("null")) {
            sysUser.setPassword(MD5.encrypt(sysUser.getPhone(), "123456"));
        }
        if (CommonUtil.isNotOrEmpty(sysUser.getMerchantNo()) && !baseCommon.isAdmin()) {
            String merchantNo = baseCommon.getSessionLogin("merchantNo").toString();
            if (CommonUtil.isNotOrEmpty(merchantNo)) {
                merchantNo = baseCommon.getMerchantNo();
            }
            sysUser.setMerchantNo(merchantNo);
        }
        return new BaseResponse(sysUserMapper.updateByPrimaryKeySelective(sysUser));
    }


    /**
     * 修改
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/del", method = RequestMethod.DELETE)
    public BaseResponse del(@RequestBody String id) {

        if (CommonUtil.isNotOrEmpty(id)) {
            return new BaseResponse(StatusCode.Fail, "删除失败，删除数据不能没有主键");
        }
        int _id = Integer.parseInt(id);
        SysUser sysUser = sysUserMapper.selectByPrimaryKey(_id);
        if (sysUser.getUserType() == 3) {
            return new BaseResponse(StatusCode.Fail, "管理员不能被删除！");
        }

        sysUserMapper.deleteByPrimaryKey(_id);
        return new BaseResponse();
    }


}
