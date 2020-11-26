package com.orange.project.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.orange.project.annotation.MyBatisPageHelper;
import com.orange.project.entity.SysLayout;
import com.orange.project.entity.SysRoule;
import com.orange.project.mapper.SysLayoutMapper;
import com.orange.project.mapper.SysRouleMapper;
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
@RequestMapping("sysLayout")
public class SysLayoutController {


	@Autowired
	private ObjectMapper objectMapper;

	@Autowired
	private Environment env;


	@Autowired
	private SysLayoutMapper sysLayoutMapper;

	@Autowired
	private SysRouleMapper sysRouleMapper;

	@Autowired
	private BaseCommon baseCommon;

	/**
	 * 查询
	 *
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	public BaseResponse getAllSysLayout(String menuId) throws UnsupportedEncodingException {
		return getSysLayoutAll(0, menuId, -1);
	}

//    /**
//     * 查询
//     *
//     * @return
//     */
//    @ResponseBody
//    @RequestMapping(value = "/getAll", method = RequestMethod.GET)
//    public BaseResponse getAllSysLayout(String menuId, int layoutType) throws UnsupportedEncodingException {
//        return getSysLayoutAll(0, menuId, layoutType);
//    }

	/**
	 * 查询
	 *
	 * @return
	 */
	@MyBatisPageHelper(pageSize = 10)
	@ResponseBody
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public BaseResponse getSysLayoutAll(@RequestParam("pageNumber") int currPage, String menuId, int layoutType) throws UnsupportedEncodingException {

		SysLayout sysLayout = new SysLayout();
		sysLayout.setMenuId(menuId);
		if (layoutType > 0) {
			sysLayout.setLayoutType(layoutType);
		}
		List<SysLayout> sysLayouts = sysLayoutMapper.selectAll(sysLayout);
		SysRoule sysRoule = new SysRoule();
		if (!baseCommon.isAdmin()) {
			String merchantNo = baseCommon.getSessionLogin("merchantNo").toString();
			sysLayout.setMerchantNo(merchantNo);
			sysRoule.setRouleId(merchantNo);
			sysRoule.setType("3");
			for (int i = 0; i < sysLayouts.size(); i++) {
				sysRoule.setControlId(sysLayouts.get(i).getId() + "");
				List<SysRoule> _sr = sysRouleMapper.selectAll(sysRoule);
				if (_sr.size() > 0) {
					sysLayouts.get(i).setRouleJson(_sr.get(0).getLayoutJson());
				}
			}
		}
		return new BaseResponse(sysLayouts);
	}

	/**
	 * 查询一条
	 *
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getById", method = RequestMethod.GET)
	public BaseResponse getSysLayoutById(Integer id) {
		return new BaseResponse(sysLayoutMapper.selectByPrimaryKey(id));
	}


	/**
	 * 新增
	 *
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public BaseResponse add(@RequestBody SysLayout sysLayout) {
		sysLayout.setCreatedBy(baseCommon.getSessionLoginId());
		sysLayout.setCreatedTime(new Date());
		return new BaseResponse(sysLayoutMapper.insertSelective(sysLayout));
	}


	/**
	 * 修改
	 *
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/upd", method = RequestMethod.POST)
	public BaseResponse upd(@RequestBody SysLayout sysLayout) {
		sysLayout.setUpdatedTime(new Date());
		sysLayout.setUpdatedBy(baseCommon.getSessionLoginId());
		return new BaseResponse(sysLayoutMapper.updateByPrimaryKeySelective(sysLayout));
	}

	/**
	 * 启用和警用按钮
	 *
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/enabled", method = RequestMethod.DELETE)
	public BaseResponse enabled(@RequestBody SysLayout sysLayout) {
		return new BaseResponse(sysLayoutMapper.updateByPrimaryKeySelective(sysLayout));
	}


}
