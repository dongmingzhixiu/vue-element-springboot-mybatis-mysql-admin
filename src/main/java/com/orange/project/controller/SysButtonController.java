package com.orange.project.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.orange.project.annotation.MyBatisPageHelper;
import com.orange.project.entity.SysButton;
import com.orange.project.mapper.SysButtonMapper;
import com.orange.project.response.BaseResponse;
import com.orange.project.response.StatusCode;
import com.orange.project.util.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.util.Date;

/**
 * describe:
 * author:jpw
 * Date:2020-10-22
 * Time:10:38
 */
@RestController
@RequestMapping("sysButton")
public class SysButtonController {


    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private Environment env;


    @Autowired
    private SysButtonMapper sysButtonMapper;

    @Autowired
    private BaseCommon baseCommon;


    /**
     * 查询
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public BaseResponse getAllSysButton(String menuId) throws UnsupportedEncodingException {
        if (baseCommon.isAdmin()) {
            SysButton sysButton = new SysButton();
            sysButton.setMenuId(menuId);
            return new BaseResponse(sysButtonMapper.selectAll(sysButton));
        }
        //TODO 查询关联人权限
        String userId = baseCommon.getSessionLoginId();
        return new BaseResponse(sysButtonMapper.selectAllByRouleUser(userId,menuId));
    }

    /**
     * 查询
     *
     * @return
     */
    @MyBatisPageHelper(pageSize = 10)
    @ResponseBody
    @RequestMapping(value = "/get", method = RequestMethod.GET)
    public BaseResponse getSysButtonAll(@RequestParam("pageNumber") int currPage, String name, String title) throws UnsupportedEncodingException {
        if (baseCommon.isAdmin()) {
            SysButton sysButton = new SysButton();
            sysButton.setName(name);
            sysButton.setTitle(title);
            return new BaseResponse(sysButtonMapper.selectAll(sysButton));
        }
        //TODO 查询关联人权限
        SysButton sysButton = new SysButton();
        sysButton.setName(name);
        sysButton.setTitle(title);
        return new BaseResponse(sysButtonMapper.selectAll(sysButton));
    }

    /**
     * 查询一条
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public BaseResponse getSysButtonById(Integer id) {
        return new BaseResponse(sysButtonMapper.selectByPrimaryKey(id));
    }


    /**
     * 新增
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public BaseResponse add(@RequestBody SysButton sysButton) {
        sysButton.setCreatedBy(baseCommon.getSessionLoginId());
        sysButton.setCreatedTime(new Date());
        return new BaseResponse(sysButtonMapper.insertSelective(sysButton));
    }


    /**
     * 修改
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/upd", method = RequestMethod.POST)
    public BaseResponse upd(@RequestBody SysButton sysButton) {
        sysButton.setUpdatedTime(new Date());
        sysButton.setUpdatedBy(baseCommon.getSessionLoginId());
        return new BaseResponse(sysButtonMapper.updateByPrimaryKeySelective(sysButton));
    }


    /**
     * 删除
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/del", method = RequestMethod.DELETE)
    public BaseResponse del(@RequestBody String id) {
        if (CommonUtil.isNotOrEmpty(id)) {
            return new BaseResponse(StatusCode.Fail, "删除错误，主键不能为空！");
        }
        return new BaseResponse(sysButtonMapper.deleteByPrimaryKey(Integer.parseInt(id)));
    }


    /**
     * 启用和警用按钮
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/enabled", method = RequestMethod.DELETE)
    public BaseResponse enabled(@RequestBody SysButton sysButton) {

        return new BaseResponse(sysButtonMapper.updateByPrimaryKeySelective(sysButton));
    }


}
