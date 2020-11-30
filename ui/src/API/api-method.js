import apiReq from '@/API/api-request.js';
import util from '@/API/api-util';

const request = apiReq.request;



const api = {
	
	//获取echart数据
	getChartData:function(methodName,methodType,data){
		return request(`/charts/${methodName}`,  data,methodType)
	},
	
  getFileContext: function(data) {
    return request('/file/getContext', data, 'GET')
  },

  /**
   * 登录
   */
  login: function(data) {
    return request('/login/login', data, 'POST')
  },

  /**
   * 登出
   * @param {Object} data
   */
  loginOut: function(data) {
    return request('/login/loginOut', data, 'POST')
  },



  /**
   * 查询
   */
  getSysUserAll: function(data) {
    return request('/sysUser/get', data, 'GET')
  },

  /**
   * 查询一条配置
   */
  getSysUserByData: function(data) {
    return request('/sysUser/getById', data, 'GET')
  },
  /**
   * 查询一条配置
   */
  getSysUserById: function(id) {
    return request('/sysUser/getById', {
      id: id
    }, 'GET')
  },

  /**
   * 新增
   */

  addSysUser: function(data) {
    return request('/sysUser/add', data, 'POST')
  },

  /**
   * 修改
   *
   * @return
   */
  updSysUser: function(data) {
    return request('/sysUser/upd', data, 'POST')
  },

  /**
   * 修改
   *
   * @return
   */
  delSysUser: function(data) {
    return request('/sysUser/del', data, 'DELETE')
  },

  /**
   * 查询
   */
  getSysMenuAll: function(data) {
    return request('/sysMenu/get', data, 'GET')
  },
  /**
   * 查询
   */
  getAllSysMenu: function(data) {
    return request('/sysMenu/getAll', data, 'GET')
  },

  /**
   * 查询一条配置
   */
  getSysMenuId: function(id) {
    return request('/sysMenu/getById', {
      id: id
    }, 'GET')
  },

  /**
   * 新增
   */

  addSysMenu: function(data) {
    return request('/sysMenu/add', data, 'POST')
  },

  /**
   * 修改
   *
   * @return
   */
  updSysMenu: function(data) {
    return request('/sysMenu/upd', data, 'POST')
  },

  /**
   * 修改
   *
   * @return
   */
  delSysMenu: function(data) {
    return request('/sysMenu/del', data, 'DELETE')
  },

  /**
   * 禁用或启用
   */
  enabledSysMenu: function(data) {
    return request('/sysMenu/enabled', data, 'DELETE')
  },



  /**
   * 查询
   */
  getSysButtonAll: function(data) {
    return request('/sysButton/get', data, 'GET')
  },
  /**
   * 查询
   */
  getAllSysButton: function(data) {
    return request('/sysButton/getAll', data, 'GET')
  },

  /**
   * 查询一条配置
   */
  getSysButtonById: function(id) {
    return request('/sysButton/getById', {
      id: id
    }, 'GET')
  },

  /**
   * 新增
   */

  addSysButton: function(data) {
    return request('/sysButton/add', data, 'POST')
  },

  /**
   * 修改
   *
   * @return
   */
  updSysButton: function(data) {
    return request('/sysButton/upd', data, 'POST')
  },

  /**
   * 删除
   *
   * @return
   */
  delSysButton: function(data) {
    return request('/sysButton/del', data, 'DELETE')
  },

  /**
   * 禁用或启用
   */
  enabledSysButton: function(data) {
    return request('/sysButton/enabled', data, 'DELETE')
  },

  ///=============================================================
  ///布局
  ///=============================================================

  getSysLayoutAll: function(data) {
    return request('/sysLayout/get', data, 'GET')
  },
  getAllSysLayout: function(data) {
    return request('/sysLayout/getAll', data, 'GET')
  },
  getSysLayoutById: function(id) {
    return request('/sysLayout/getById', {
      id: id
    }, 'GET')
  },
  addSysLayout: function(data) {
    return request('/sysLayout/add', data, 'POST')
  },
  updSysLayout: function(data) {
    return request('/sysLayout/upd', data, 'POST')
  },
  delSysLayout: function(data) {
    return request('/sysLayout/del', data, 'DELETE')
  },

  //权限+++++++++++++++++
  getSysRouleAll: function(data) {
    return request('/sysRoule/get', data, 'GET')
  },
  getAllSysRoule: function(data) {
    return request('/sysRoule/getAll', data, 'GET')
  },
  getSysRoule: function(data) {
    return request('/sysRoule/getSysRoule', data, 'POST')
  },
  getSysRouleById: function(id) {
    return request('/sysRoule/getById', {
      id: id
    }, 'GET')
  },
  addSysRoule: function(data) {
    return request('/sysRoule/add', data, 'POST')
  },
  updSysRoule: function(data) {
    return request('/sysRoule/upd', data, 'POST')
  },
  delSysRoule: function(data) {
    return request('/sysRoule/del', data, 'DELETE')
  },
  saveMenuOrButtonSysRoule: function(data) {
    return request('/sysRoule/saveRouleForMenuOrButton', data, 'POST')
  },
  getMenuByUser: function(data) {
    return request('/sysRoule/getMenuByUser', data, 'GET')
  },
  getButtonSysRoule: function(data) {
    return request('/sysRoule/getButtonSysRoule', data, 'GET')
  },
  getLayoutSysRoule: function(data) {
    return request('/sysRoule/getLayoutSysRoule', data, 'GET')
  },



  /**
   * 查询
   */
  getAlWebListl: function(data) {
    return request('/webList/getAll', data, 'GET')
  },
  /**
   * 查询 分页
   */
  getWebListAll: function(data) {
    return request('/webList/get', data, 'GET')
  },

  /**
   * 查询一条
   */
  getWebListById: function(id) {
    return request('/webList/getById', {
      id: id
    }, 'GET')
  },

  /**
   * 新增
   */

  addWebList: function(data) {
    return request('/webList/add', data, 'POST')
  },

  /**
   * 修改
   *
   * @return
   */
  updWebList: function(data) {
    return request('/webList/upd', data, 'POST')
  },
  /**
   * 删除
   * @param {Object} data
   */
  delWebList: function(data) {
    return request('/webList/del', data, 'DELETE')
  },



}










// 这里我们定义了一个叫"install"的变量，它的内容是一个方法(函数)
// 它的第一个参数是Vue对象(上面有提到传进来的第一个参数就是Vue)，我们把$u挂载到了Vue.prototype中
const install = (Vue) => {
  Vue.prototype.$api = api;
}

// 这里我们导出一个对象，内部有一个叫"install"的方法，给上面说的Vue.use调用
export default {
  install
}
