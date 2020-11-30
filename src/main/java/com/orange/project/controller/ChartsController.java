package com.orange.project.controller;

import com.orange.project.mapper.ChartMapper;
import com.orange.project.response.BaseResponse;
import com.orange.project.response.StatusCode;
import com.orange.project.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

@RestController
@RequestMapping("charts")
public class ChartsController {


    @Autowired
    private Environment env;
    @Autowired
    private ChartMapper chartMapper;
    @Autowired
    private BaseCommon baseCommon;


    /**
     * 获取文件内容
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getDayPayCount", method = RequestMethod.GET)
    public BaseResponse getDayPayCount(String day) {
        Date sd = DateUtil.formatDate(day, "yyyy-MM-dd");
        if (sd == null) {
            return new BaseResponse(StatusCode.Fail, "日期错误！");
        }
        String merchantNo = "";
        if (!baseCommon.isAdmin()) {
            merchantNo = baseCommon.getSessionLogin("merchantNo").toString();
        }
        day= DateUtil.formatDate(sd, "yyyy-MM-dd");
        List<LinkedHashMap> list=chartMapper.selectPayToDay(day, merchantNo);
        return new BaseResponse(list);
    }
}
