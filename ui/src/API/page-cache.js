// 这里我们导出一个对象，内部有一个叫"install"的方法，给上面说的Vue.use调用
let _Vue = null;
const getFilterDataJSON = function(data, type) {
	try {
		let w = data.filter(d => d.layoutType == type);
		if (w.length >= 1) {
			w.map(_w => {
				_w['cols'] = _w['cols'] || 1;
				try {
					let method = _w['apiName'];
					if (method.indexOf("{") >= 0 && method.indexOf("}") > 0 && method.indexOf(":") > 0) {
						_w['apiName'] = eval("(" + method + ")");
					} else {
						_w['apiName'] = method.replace(/\t/g, "");
					}
				} catch (e) {

				}
				try {
					_w["layoutJson"] = eval("(" + _w["layoutJson"].replace(/this./g, '_Vue.prototype.') + ")");
				} catch (e) {
					//TODO handle the exception
				}
			});
		}
		console.log(w);
		return w;
	} catch (e) {
		//TODO handle the exception
		return [];
	}
}
const jsonStrToJson = function(jsonString) {
	if (typeof jsonString != 'string') {
		return jsonString;
	}
	if (!jsonString) {
		return {};
	}
	return eval("(" + jsonString.replace(/this./g, '_Vue.prototype.') + ")");
}

//缓存布局信息
const layoutCache = {
	get: (key) => {
		if (key == undefined) {
			return _cache;
		}
		_cache = _cache || {};
		return _cache[key];
	},
	set: (key, val) => {
		if (val == undefined) {
			_cache = key;
			return;
		}
		_cache = _cache || {};
		_cache[key] = val;
	},
	clear: (key) => {
		if (key == undefined) {
			_cache = null;
			return;
		}
		_cache = _cache || {}
		_cache[key] = null;
	}
};
//得到布局信息
const getLayoutBtn = function(menuId, Vue) {
	return new Promise((resolve, s) => {
		let layout = layoutCache.get(`btn_${menuId}`);
		if (layout) {
			resolve(layout);
		} else {
			Vue.prototype.$api.getAllSysButton({
				menuId: menuId
			}).then(res => {
				if (res.code == 0) {
					try {
						let data = res.data;
						layoutCache.set(`btn_${menuId}`, data);
						resolve(data);
					} catch (e) {}
				}
			});
		}
	});
}
//得到布局信息
const getLayout = function(menuId, Vue) {
	return new Promise((resolve, s) => {
		let layout = layoutCache.get(menuId);
		if (layout) {
			resolve(layout);
		} else {
			Vue.prototype.$api.getAllSysLayout({
				menuId: menuId
			}).then(res => {
				if (res.code == 0) {
					try {
						let columns = getFilterDataJSON(res.data, 1);
						let where = getFilterDataJSON(res.data, 2);
						let editor = getFilterDataJSON(res.data, 3);
						let data = {
							where: where,
							columns: columns,
							editor: editor
						};
						layoutCache.set(menuId, data);
						resolve(data);
					} catch (e) {}
				}
			});
		}
	});
}
let _cache = null;
const install = (Vue) => {
	_Vue = Vue;
	//通过查询语句获取数据
	Vue.prototype.$getLayout = function(menuId) {
		return getLayout(menuId, Vue);
	};
	//通过查询语句获取数据
	Vue.prototype.$getLayoutButton = function(menuId) {
		return getLayoutBtn(menuId, Vue);
	};
	//获取布局json
	Vue.prototype.$getLayoutByStr = function(jsonString) {
		return jsonStrToJson(jsonString);
	};
	/**
	 * 保存用户信息
	 */
	Vue.prototype.$layoutCache = layoutCache;

}
// 这里我们导出一个对象，内部有一个叫"install"的方法，给上面说的Vue.use调用
export default {
	install
}
