import apiutil from '@/API/api-util.js';
import conf from '@/API/config.js';
import simCache from '@/API/simple-cache.js';

const install = (Vue) => {
	Vue.prototype.$apiutil = apiutil;
	Vue.prototype.$conf = conf;
	Vue.prototype.$simCache = simCache;

}

// 这里我们导出一个对象，内部有一个叫"install"的方法，给上面说的Vue.use调用
export default {
	install
}
