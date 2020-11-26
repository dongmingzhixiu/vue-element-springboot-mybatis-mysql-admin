// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';


import { quillEditor } from "vue-quill-editor"; //调用编辑器
import 'quill/dist/quill.core.css';
import 'quill/dist/quill.snow.css';
import 'quill/dist/quill.bubble.css';
import hljs from 'highlight.js/styles/xcode.css'
import componentsImport from './componentsimport.js'
import util from '@/API/api-util.js';
import api from '@/API/api-method.js';

Vue.use(util);
Vue.use(api);
Vue.use(componentsImport);
router.afterEach((to,from,next) => {window.scrollTo(0,0);});

import pageUtil from '@/API/page-util.js';
Vue.use(pageUtil);
import pageCache from '@/API/page-cache.js';
Vue.use(pageCache);

Vue.use(pageUtil);

Vue.use(quillEditor, {
	syntax: {
		toolbar: [],
		highlight: text => {
			return hljs.highlightAuto(text).value; // 这里就是代码高亮需要配置的地方
		},
	}
});


Vue.component("quill-editor", quillEditor);

Vue.use(ElementUI);


import { codemirror } from 'vue-codemirror'
import 'codemirror/lib/codemirror.css'
Vue.use(codemirror)



Vue.config.productionTip = false

window.addEventListener('popstate', function (e) {
    router.isBack = true
},false)

/* eslint-disable no-new */
new Vue({
	el: '#app',
	router,
	components: {
		App
	},
	template: '<App/>'
})
