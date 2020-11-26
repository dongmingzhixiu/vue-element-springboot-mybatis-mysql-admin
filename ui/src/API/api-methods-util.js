import api from '@/API/api-method.js';
import util from '@/API/api-util.js';
import simCache from '@/API/simple-cache.js'

export default {
	/**
	 * @param {Object} fuName 接口调用名称
	 * @param {Object} data 参数
	 * @param {Object} time 秒
	 */
	getHashCache: function(fuName, data, handleFn, time) {
		return new Promise((r, s) => {
			//TODO1 获取缓存key
			var _data = !data ? "" : typeof data == "string" ? data : JSON.stringify(data);
			var _hashCode = util.hashCode(_data);
			var _key = fuName + "_" + _hashCode;
			//TODO2 从缓存中获取数据{"code": 0, "msg": null, "data": object,"hashCode": "-931650162","same": false,}
			var chch_data = simCache.get(_key);
			chch_data = chch_data && typeof chch_data == "string" ? JSON.parse(chch_data) : null;
			if (chch_data) {
				handleFn(chch_data);
			}
			// var hCode = chch_data && chch_data.dataHashCode ? chch_data.hashCode : chch_data && chch_data.hashCode ?
			// 	chch_data.hashCode : '';
			var hCode =  chch_data && chch_data.hashCode ?chch_data.hashCode : _hashCode;
			data['hashCode'] = hCode;
			//从数据库获取数据
			api[fuName](data).then(res => {
				var _d = res;
				if (_d.code == -1) {
					//console.log(_d.msg);
					// uni.showToast({
					// 	icon: 'none',
					// 	title: _d.msg
					// })
					return;
				}
				if (!_d.isSame) {
					//缓存数据
					simCache.put(_key, JSON.stringify(_d), time);
					r(_d);
				}
			});

		});
	},

}
