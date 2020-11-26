package com.orange.project.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.orange.project.annotation.MyBatisPageHelper;
import com.orange.project.entity.SysButton;
import com.orange.project.entity.SysLayout;
import com.orange.project.entity.SysRoule;
import com.orange.project.entity.SysUser;
import com.orange.project.mapper.SysButtonMapper;
import com.orange.project.mapper.SysLayoutMapper;
import com.orange.project.mapper.SysRouleMapper;
import com.orange.project.mapper.SysUserMapper;
import com.orange.project.response.BaseResponse;
import com.orange.project.response.StatusCode;
import com.orange.project.util.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.*;

import java.beans.Transient;
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
@RequestMapping("sysRoule")
public class SysRouleController {


	@Autowired
	private ObjectMapper objectMapper;

	@Autowired
	private Environment env;

	@Autowired
	private SysUserMapper sysUserMapper;


	@Autowired
	private SysRouleMapper sysRouleMapper;

	@Autowired
	private BaseCommon baseCommon;

	@Autowired
	private SysButtonMapper sysButtonMapper;

	@Autowired
	private SysLayoutMapper sysLayoutMapper;


	/**
	 * 查询
	 *
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	public BaseResponse getAllSysRoule(String type) throws UnsupportedEncodingException {
		return getSysRouleAll(0, type);
	}


	/**
	 * 查询
	 *
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getSysRoule", method = RequestMethod.POST)
	public BaseResponse getSysRoule(@RequestBody SysRoule roule) throws UnsupportedEncodingException {
		if (!baseCommon.isAdmin()) {
			String merchantNo = baseCommon.getSessionLogin("merchantNo").toString();
			roule.setRouleId(merchantNo);
		}
		return new BaseResponse(sysRouleMapper.selectAll(roule));
	}

	/**
	 * 查询
	 *
	 * @return
	 */
	@MyBatisPageHelper(pageSize = 10)
	@ResponseBody
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public BaseResponse getSysRouleAll(@RequestParam("pageNumber") int currPage, String type) throws UnsupportedEncodingException {
		SysRoule sysRoule = new SysRoule();
		if (!baseCommon.isAdmin()) {
			String merchantNo = baseCommon.getSessionLogin("merchantNo").toString();
			sysRoule.setRouleId(merchantNo);
		}
		sysRoule.setType(type);
		return new BaseResponse(sysRouleMapper.selectAll(sysRoule));
	}

	/**
	 * 查询一条
	 *
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getById", method = RequestMethod.GET)
	public BaseResponse getSysRouleById(Integer id) {
		return new BaseResponse(sysRouleMapper.selectByPrimaryKey(id));
	}


	/**
	 * 新增
	 *
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public BaseResponse add(@RequestBody SysRoule sysRoule) {
		sysRoule.setCreatedBy(baseCommon.getSessionLoginId());
		sysRoule.setCreatedTime(new Date());
		return new BaseResponse(sysRouleMapper.insertSelective(sysRoule));
	}


	/**
	 * 修改
	 *
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/upd", method = RequestMethod.POST)
	public BaseResponse upd(@RequestBody SysRoule sysRoule) {
		sysRoule.setUpdatedTime(new Date());
		sysRoule.setUpdatedBy(baseCommon.getSessionLoginId());
		return new BaseResponse(sysRouleMapper.updateByPrimaryKeySelective(sysRoule));
	}


	/**
	 * 保存菜单
	 *
	 * @return
	 */
	@Transient
	@ResponseBody
	@RequestMapping(value = "/getMenuByUser", method = RequestMethod.GET)
	public BaseResponse saveMenu(String userId) {
		System.out.println(userId);
		SysRoule sysRoule = new SysRoule();
		if (CommonUtil.isNotOrEmpty(userId)) {
			return new BaseResponse(StatusCode.Fail, "用户编号不能为空");
		}
		sysRoule.setUserId(userId);
		return new BaseResponse(sysRouleMapper.selectAll(sysRoule));
	}


	/*
	 * 获取所属权限的按钮
	 * @return
	 */
	@Transient
	@ResponseBody
	@RequestMapping(value = "/getButtonSysRoule", method = RequestMethod.GET)
	public BaseResponse getButtonSysRoule(String userId) {
		String merchantNo = "";
		if (baseCommon.isAdmin()) {
			SysButton sysButton = new SysButton();
			return new BaseResponse(sysButtonMapper.selectAll(sysButton));
		}
		merchantNo = baseCommon.getSessionLogin("merchantNo").toString();
		if (!CommonUtil.isNotOrEmpty(userId)) {
			int _userId = Integer.parseInt(userId);
			SysUser sysUser = new SysUser();
			sysUser.setId(_userId);
			List<SysUser> _su = sysUserMapper.selectAll(sysUser);
			if (_su.size() > 0) {
				merchantNo = _su.get(0).getMerchantNo();
			}
		}

		return new BaseResponse(sysButtonMapper.selectAllByMerchantNo(merchantNo));
	}

	/*
	 * 获取所属权限的按钮
	 * @return
	 */
	@Transient
	@ResponseBody
	@RequestMapping(value = "/getLayoutSysRoule", method = RequestMethod.GET)
	public BaseResponse getLayoutSysRoule(String userId) {
		SysLayout sysLayout = new SysLayout();
		SysRoule sysRoule = new SysRoule();
		List<SysLayout> sysLayouts = sysLayoutMapper.selectAll(sysLayout);

		String merchantNo = baseCommon.getSessionLogin("merchantNo").toString();
		if (!CommonUtil.isNotOrEmpty(userId)) {

			int _userId = Integer.parseInt(userId);
			SysUser sysUser = new SysUser();
			sysUser.setId(_userId);

			List<SysUser> _su = sysUserMapper.selectAll(sysUser);
			if (_su.size() > 0) {
				merchantNo = _su.get(0).getMerchantNo();
			}
		}

		sysRoule.setRouleId(merchantNo);
		sysRoule.setType("3");
		for (int i = 0; i < sysLayouts.size(); i++) {
			sysRoule.setControlId(sysLayouts.get(i).getId() + "");
			List<SysRoule> _sr = sysRouleMapper.selectAll(sysRoule);
			if (_sr.size() > 0) {
				sysLayouts.get(i).setRouleJson(_sr.get(0).getLayoutJson());
			}
		}

		return new BaseResponse(sysLayouts);
	}


	/**
	 * 保存菜单
	 *
	 * @return
	 */
	@Transient
	@ResponseBody
	@RequestMapping(value = "/saveRouleForMenuOrButton", method = RequestMethod.POST)
	public BaseResponse saveRouleForMenuOrButton(@RequestBody List<SysRoule> sysRoules) {
		SysRoule sysRoule = new SysRoule();
		//删除相关的菜单权限和按钮权限
		String loginId = baseCommon.getSessionLoginId();


		for (int i = 0; i < sysRoules.size(); i++) {
			SysRoule _sysRoule = sysRoules.get(i);
			String userId = _sysRoule.getUserId();
			String merchantNo = "";
			if (baseCommon.isAdmin()) {
				//查询当前的人的商家
				int _userId = Integer.parseInt(userId);
				SysUser sysUser = sysUserMapper.selectByPrimaryKey(_userId);
				merchantNo = sysUser.getMerchantNo();
				if (sysUser.getUserType().equals("3")) {
					return new BaseResponse(StatusCode.Fail, "不能对管理员进行权限操作！");
				}
			} else {
				merchantNo = baseCommon.getSessionLogin("merchantNo").toString();
			}

			if (i == 0) {
				sysRoule.setUserId(userId);
				if (CommonUtil.isNotOrEmpty(userId)) {
					return new BaseResponse(StatusCode.Fail, "分配权限的用户不能为空！");
				}
				sysRoule.setType(_sysRoule.getType());
				int count = sysRouleMapper.deleteBySysRoule(sysRoule);
				System.out.println(count);
			}
			_sysRoule.setRouleId(merchantNo);
			_sysRoule.setCreatedBy(loginId);
			_sysRoule.setCreatedTime(new Date());
			_sysRoule.setUpdatedTime(new Date());
			_sysRoule.setUpdatedBy(loginId);
			sysRouleMapper.insertSelective(_sysRoule);
		}
		return new BaseResponse(StatusCode.Success);
	}


}
