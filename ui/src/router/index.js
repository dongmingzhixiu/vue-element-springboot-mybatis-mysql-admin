import Vue from 'vue'
import Router from 'vue-router'
import home from '../pages/home.vue'
import login from '../pages/login.vue'
import error from '../pages/error.vue'
import codemerrorEditor from '../components/layout-code-editor.vue'

Vue.use(Router)

export default new Router({
	routes: [
		{
			path: '/',
			name: 'home',
			component: home
		},
		{
			path: '/login',
			name: 'login',
			component: login
		},
		{
			path: '/error',
			name: 'error',
			component: error
		},{
			path: '/codeEditor',
			name: 'codemerrorEditor',
			component: codemerrorEditor
		},
	]
})
