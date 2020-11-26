import Vue from 'vue';
import conf from '@/API/api-config.js';
import util from '@/API/api-util.js';
import axios from 'axios';
import simCache from '@/API/simple-cache.js';

export default {
	request: function(router, params = {}, method) {
		//为没个请求添加token拦截
		try {
			let userInfo = simCache.get("userInfo", null);
			userInfo = typeof userInfo == 'string' ? JSON.parse(userInfo) : userInfo;
			userInfo = typeof userInfo == 'string' ? JSON.parse(userInfo) : userInfo;

			let token = userInfo.token;
			axios.defaults.headers.common["token"] = token;
			axios.defaults.withCredentials = true
		} catch (e) {
			//TODO handle the exception
		}


		var url = `${conf.httpPath}${router}`;
		var option = {
			method,
			url,
		};
		if (method.toLocaleLowerCase() === 'get') {
			option['params'] = params;
		} else {
			option['data'] = params;
		}
		return axios(option).then((res) => {
			//根据返回结果操作
			if (res.data.code == -1 && res.data.msg == "noLogin") {
				let param=util.objToParam(res.data.data,true);
				window.location.href="#/error"+param;
				return;
			}
			return Promise.resolve(res.data);
		}).catch((err) => {
			return Promise.reject(err);
		})
	}
}
