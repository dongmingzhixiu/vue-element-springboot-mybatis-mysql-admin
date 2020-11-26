package com.orange.project.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.orange.project.annotation.MyBatisPageHelper;
import com.orange.project.entity.ProductType;
import com.orange.project.mapper.ProductTypeMapper;
import com.orange.project.response.BaseResponse;
import com.orange.project.util.CommonUtil;
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
@RequestMapping("productType")
public class ProductTypeController {


    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private Environment env;


    @Autowired
    private ProductTypeMapper productTypeMapper;


    @Autowired
    private BaseCommon baseCommon;

    /**
     * 查询
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
    public BaseResponse getProductTypeAll(String names) throws UnsupportedEncodingException {
        return getProductTypeAll(0,names);
    }



    /**
     * 查询
     *
     * @return
     */
    @MyBatisPageHelper(pageSize = 10)
    @ResponseBody
    @RequestMapping(value = "/get", method = RequestMethod.GET)
    public BaseResponse getProductTypeAll(@RequestParam("pageNumber") int currPage, String names) throws UnsupportedEncodingException {
        ProductType productType = new ProductType();
        String merchantNo=baseCommon.getSessionLogin("merchantNo").toString();
        productType.setMerchantNo(merchantNo);
        productType.setNames(names);
        return new BaseResponse(productTypeMapper.selectAll(productType));
    }

    /**
     * 查询一条
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/getById", method = RequestMethod.GET)
    public BaseResponse getProductTypeById(Integer id) {
        return new BaseResponse(productTypeMapper.selectByPrimaryKey(id));
    }


    /**
     * 新增
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public BaseResponse add(@RequestBody ProductType productType) {
        productType.setMerchantNo(baseCommon.getSessionLogin("merchantNo").toString());
        productType.setCreatedBy(baseCommon.getSessionLoginId());
        productType.setCreatedTime(new Date());
        return new BaseResponse(productTypeMapper.insertSelective(productType));
    }


    /**
     * 修改
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/upd", method = RequestMethod.POST)
    public BaseResponse upd(@RequestBody ProductType productType) {
        productType.setUpdatedBy(baseCommon.getSessionLoginId());
        productType.setUpdatedTime(new Date());
        return new BaseResponse(productTypeMapper.updateByPrimaryKeySelective(productType));
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
            return new BaseResponse("删除失败，删除数据不能没有主键");
        }
        int _id = Integer.parseInt(id);
        productTypeMapper.deleteByPrimaryKey(_id);
        return new BaseResponse();
    }
}
