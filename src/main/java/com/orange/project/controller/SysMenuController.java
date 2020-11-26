package com.orange.project.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.orange.project.annotation.MyBatisPageHelper;
import com.orange.project.entity.SysMenu;
import com.orange.project.mapper.SysMenuMapper;
import com.orange.project.response.BaseResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

/**
 * describe:
 * author:jpw
 * Date:2020-10-22
 * Time:10:40
 */
@RestController
@RequestMapping("sysMenu")
public class SysMenuController {


    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private Environment env;


    @Autowired
    private SysMenuMapper sysMenuMapper;

    @Autowired
    private BaseCommon baseCommon;


    /**
     * 查询
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public BaseResponse getAllSysMenu(String name, String title) throws UnsupportedEncodingException {

        return getSysMenuAll(0, name, title);

    }

    /**
     * 查询
     *
     * @return
     */
    @MyBatisPageHelper(pageSize = 10)
    @ResponseBody
    @RequestMapping(value = "/get", method = RequestMethod.GET)
    public BaseResponse getSysMenuAll(@RequestParam("pageNumber") int currPage, String name, String title) throws UnsupportedEncodingException {
        SysMenu sysMenu = new SysMenu();
        if (baseCommon.isAdmin()) {
            sysMenu.setName(name);
            sysMenu.setTitle(title);
            sysMenu.setEnabled(true);
            return new BaseResponse(sysMenuMapper.selectAll(sysMenu));
        }
        String userId=baseCommon.getSessionLoginId();
        return new BaseResponse(sysMenuMapper.selectAllByRouleUser(userId));

    }

    /**
     * 查询一条
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public BaseResponse getSysMenuById(Integer id) {
        return new BaseResponse(sysMenuMapper.selectByPrimaryKey(id));
    }


    /**
     * 新增
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public BaseResponse add(@RequestBody SysMenu sysMenu) {
        sysMenu.setCreatedBy(baseCommon.getSessionLoginId());
        sysMenu.setCreatedTime(new Date());
        return new BaseResponse(sysMenuMapper.insertSelective(sysMenu));
    }


    /**
     * 修改
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/upd", method = RequestMethod.POST)
    public BaseResponse upd(@RequestBody SysMenu sysMenu) {
        sysMenu.setUpdatedTime(new Date());
        sysMenu.setUpdatedBy(baseCommon.getSessionLoginId());
        return new BaseResponse(sysMenuMapper.updateByPrimaryKeySelective(sysMenu));
    }

    /**
     * 启用和警用按钮
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/enabled", method = RequestMethod.DELETE)
    public BaseResponse enabled(@RequestBody SysMenu sysMenu) {
        //查询所有子菜单，并启用或禁用子菜单
        SysMenu childrenMenu = new SysMenu();
        childrenMenu.setParentId(sysMenu.getId() + "");
        List<SysMenu> list = sysMenuMapper.selectAll(childrenMenu);
        for (int i = 0; i < list.size(); i++) {
            SysMenu children = list.get(i);
            children.setEnabled(sysMenu.getEnabled());
            sysMenuMapper.updateByPrimaryKeySelective(children);
        }
        return new BaseResponse(sysMenuMapper.updateByPrimaryKeySelective(sysMenu));
    }


}
