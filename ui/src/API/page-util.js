import conf from '@/API/api-config.js';
import simCache from '@/API/simple-cache.js';
import util from '@/API/api-util.js';
import jsFormatter from '@/API/js-formatter.js';

// 这里我们导出一个对象，内部有一个叫"install"的方法，给上面说的Vue.use调用
const install = (Vue) => {
	Vue.prototype.$conf = conf;
	Vue.prototype.$simCache = simCache;
	Vue.prototype.$util = util;
	Vue.prototype.$util.jsFormat = jsFormatter.format;

	Vue.prototype.$editorType = {
		1: {
			title: '查看',
			readonly: true,
			add: false,
		},
		2: {
			title: '编辑',
			readonly: false,
			add: false,
		},
		3: {
			title: '新增',
			readonly: false,
			add: true,
		},
		4: {
			title: '删除',
			readonly: false,
			add: true,
		}
	}
	Vue.prototype.$confirmDialog = function(msg, confirmFn, cancelFn, type) {
		if (typeof cancelFn == 'string') {
			type = cancelFn;
		}
		if (typeof confirmFn == 'string') {
			type = confirmFn;
		}
		Vue.prototype.$confirm(msg, '提示', {
			confirmButtonText: '确定',
			cancelButtonText: '取消',
			type: type || 'warning'
		}).then(() => {
			if (typeof confirmFn == "function") {
				confirmFn();
			}
		}).catch(() => {
			if (typeof cancelFn == "function") {
				cancelFn();
			}
		});
	}


	Vue.prototype.$deleteForm = function(e, apiName, successFn, errorFn) {
		Vue.prototype.$confirm('此操作将永久删除该数据, 是否继续?', '提示', {
			confirmButtonText: '确定',
			cancelButtonText: '取消',
			type: 'warning'
		}).then(() => {
			let query = e.id;
			Vue.prototype.$api[apiName](query).then(r => {
				if (r.code == 0) {
					Vue.prototype.$message({
						type: 'success',
						message: '删除成功!'
					});
					//刷新数据
					if (typeof successFn == "function") {
						successFn();
					}
					return;
				}
				Vue.prototype.$message({
					type: r.msg ? 'danger' : 'info',
					message: r.msg || '删除失败，稍后再试!'
				});
				if (typeof errorFn == "function") {
					errorFn();
				}
			});

		}).catch(() => {

		});
	}

	/**
	 * 保存用户信息
	 */
	Vue.prototype.$userInfo = {
		get: () => {
			return _userInfo;
		},
		set: (key, val) => {
			if (val == undefined) {
				_userInfo = key;
				return;
			}
			_userInfo = _userInfo || {};
			_userInfo[key] = val;
			simCache.put('userInfo', _userInfo);
		},
		clear: (key) => {
			_userInfo = _userInfo || {}
			_userInfo[key] = null;
			simCache.remove('userInfo');
		}
	};


	Vue.prototype.$login = () => {
		if (Vue.prototype.$userInfo.get() == null) {
			window.location.href = "#/login";
		}
	}


	Vue.prototype.$cookie = {
		set: (e, exdays) => {
			var exdate = new Date() // 获取时间
			exdate.setTime(exdate.getTime() + 24 * 60 * 60 * 1000 * exdays) // 保存的天数
			// 字符串拼接cookie
			let str = escape(JSON.stringify(e));
			window.document.cookie = `${str};path=/;expires=${exdate.toGMTString()}`
		},
		get: () => {
			try {
				let e = window.document.cookie.split(";");
				if (!e) {
					return null;
				}
				let u = null;
				// "oracle.uix=0^^GMT+8:00^p"
				e = e.filter(u => u.indexOf("GMT") < 0 && u.indexOf("uix") < 0);
				if (e.length <= 0) {
					return null;
				}
				u = JSON.parse(unescape(e));
				return u;
			} catch (e) {
				return null;
			}
		},
		clear: () => {
			var date = new Date() // 获取时间
			date.setTime(date.getTime() - 10000);
			// 字符串拼接cookie
			window.document.cookie = `{};path=/;expires=${date.toGMTString()}`
		}
	}
}
let _userInfo = null;

// 这里我们导出一个对象，内部有一个叫"install"的方法，给上面说的Vue.use调用
export default {
	install
}
