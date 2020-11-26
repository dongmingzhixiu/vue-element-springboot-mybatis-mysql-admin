
import util from '@/API/api-util.js';


const system = ['userInfo','unitInfo', 'isFirstUse'];

const postfix = 'simpleCache'; // 缓存前缀

const simpleCache = {
	postfix: postfix,
}


/**
 * 写入缓存
 * @param {String} key 本地缓存中的指定的key
 * @param {Any} data 需要存储的内容，只支持原生类型、及能够通过 JSON.stringify 序列化的对象
 * @param {Number} time 保存的时间, 数字类型,单位秒 为空则永久有效.
 */
simpleCache.put = function(key, data, time) {
	/**
	 * 必须对系统变量进行加密操作
	 */
	if (JSON.stringify(system).indexOf('"' + key + '"') > 0) {
		data = data && typeof data != "string" ? JSON.stringify(data) : data;
		data = util.encryption.set(data);
		key = util.hashCode(key) + "";
	}


	localStorage.setItem(key, data)
	var seconds = parseInt(time);
	if (seconds > 0) {
		var timestamp = Date.parse(new Date());
		timestamp = timestamp / 1000 + seconds;
		localStorage.setItem(key + postfix, timestamp + "")
	} else {
		localStorage.removeItem(key + postfix)
	}
}

/**
 * 从本地缓存中同步获取指定 key 对应的内容。
 * @param {String} key 本地缓存中的指定的 key
 * @param def 获取失败时的默认内容,可以为空.
 */
simpleCache.get = function(key, def) {
	/**
	 * 必须对系统变量进行加密操作
	 */
	var en = false;
	if (JSON.stringify(system).indexOf('"' + key + '"') > 0) {
		en = true;
		key = util.hashCode(key) + "";
	}
	var deadtime = parseInt(localStorage.getItem(key + postfix))
	if (deadtime) {
		if (parseInt(deadtime) < Date.parse(new Date()) / 1000) {
			if (def) {
				return def;
			} else {
				localStorage.removeItem(key + postfix)
				return false;
			}
		}
	}
	var res = localStorage.getItem(key);
	if (res) {
		if (en) {
			return util.encryption.get(res);
		}
		return res;
	} else {
		if (def == undefined || def == "") {
			def = false;
			localStorage.removeItem(key)
		}
		return def;
	}
}

/**
 * 从本地缓存中同步移除指定 key。
 * @param {String} key 本地缓存中的指定的 key
 */
simpleCache.remove = function(key) {
	if (JSON.stringify(system).indexOf('"' + key + '"') > 0) {
		key = util.hashCode(key) + "";
	}
	localStorage.removeItem(key);
	localStorage.removeItem(key + postfix);
}

/**
 * 同步清理本地数据缓存。
 */
simpleCache.clear = function() {
	// 这里面其实可以扩展你不想清理的缓存,比如你保存的用户登录状态. 在清理之前先获取一次.
	var map = {};
	for (let i = 0; i < system.length; i++) {
		map[system[i]] = simpleCache.get(system[i]);
	}
	// var user = simpleCache.get("user_info"); 
	localStorage.clear();

	for (let i = 0; i < system.length; i++) {
		simpleCache.put(system[i], map[system[i]]);
	}
	// simpleCache.put("user_info",user); // 等 其它的自行扩展.
}
/**
 * 同步清理本地数据缓存。
 */
simpleCache.clearAll = function() {
	localStorage.clear();
}

/**
 * 同步清理本地缓存的图片文件
 */
simpleCache.clearImageAll = function(filePath) {
	filePath = filePath || '_doc/';
	// uni.getSavedFileList({
	// 	success(res) {
	// 		for (re in res.fileList) {
	// 			uni.removeSavedFile({
	// 				filePath: re.filePath
	// 			})
	// 		}
	// 	}
	// })
}

//临时缓存，应用关闭时，缓存失效
var _temporary = {};
simpleCache.temporary = {
	get: function(key) {
		return _temporary[key];
	},
	put: function(key, val) {
		_temporary[key] = val;
	},
	remove: function(key) {
		delete _temporary[key];
		// _temporary[key]=val;
	},
	clear: function() {
		_temporary = {};
	}
}

const getUserInfo = function() {
	var userInfo = simpleCache.get("userInfo");
	userInfo = typeof userInfo == "string" ? JSON.parse(userInfo) : userInfo;
	userInfo = typeof userInfo == "string" ? JSON.parse(userInfo) : userInfo;
	return userInfo;
}


// export default simpleCache

export default {
	put: simpleCache.put,
	get: simpleCache.get,
	remove: simpleCache.remove,
	clear: simpleCache.clear,
	clearAll: simpleCache.clearAll,
	clearImageAll: simpleCache.clearImageAll,
	temporary: simpleCache.temporary,
	getUserInfo: getUserInfo
}
