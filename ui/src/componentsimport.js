// import Vue from 'vue'

//公共组件
import pageHelper from '@/components/page-helper.vue'
import treeMenu from '@/components/tree-menu.vue'
import pageHead from '@/components/page-head.vue'
import pageEditor from '@/components/page-editor.vue'
import calc from '@/components/calc.vue'
import listWhere from '@/components/list-where.vue'
import layoutEditor from '@/components/layout-editor.vue'
import iconInput from '@/components/icon-input.vue'
import codemerrorEditor from '@/components/codemirror-editor.vue'
import layoutCodeEditor from '@/components/layout-code-editor.vue'


/**
 * 基础模板
 */
import frame1 from '@/pages/frame/frame1/list.vue'
import frameEditor1 from '@/pages/frame/frame1/editor.vue'

/**
 * 添加模板
 */
import sysMenu from '@/pages/sys-menu/list.vue'
import sysMenuEditor from '@/pages/sys-menu/editor.vue'

/**
 * 添加模板
 */
import sysRoule from '@/pages/sys-roule/list.vue'
import sysRouleEditor from '@/pages/sys-roule/editor.vue'


export default {
	install(Vue) {

		Vue.component('page-helper', pageHelper)
		Vue.component('tree-menu', treeMenu)
		Vue.component('page-head', pageHead)
		Vue.component('page-editor', pageEditor)
		Vue.component("list-where", listWhere);
		Vue.component('calc', calc)
		Vue.component('layout-editor', layoutEditor)
		Vue.component('icon-input', iconInput)
		Vue.component('codemerror-editor', codemerrorEditor)
		Vue.component('layout-code-editor', layoutCodeEditor)
		
		

		/**
		 * 模板界面 简单的展示页面和修改页面
		 */
		Vue.component('frame1', frame1)
		Vue.component("frame1-editor", frameEditor1);

		/**
		 * 添加模板
		 */
		Vue.component('sys-menu', sysMenu)
		Vue.component("sys-menu-editor", sysMenuEditor);

		/**
		 * 添加模板
		 */
		Vue.component('sys-roule', sysRoule)
		Vue.component("sys-roule-editor", sysRouleEditor);




	}
}
