<template>
	<div>
		<el-menu background-color="#545c64" text-color="#fff" active-text-color="#ffd04b" class="el-menu-vertical-demo" @open="handleOpen"
		 @close="handleClose" @select="handleSelect" :collapse="isCollapse">
			<template v-for="(item,i) in menu">
				<el-submenu v-if="item.children&&item.children.length>0" :index="item.name" :key='i'>
					<template slot="title">
						<i :class="item.icon"></i>
						<span slot="title">{{item.title}}</span>
					</template>
					<template v-if="item.children" v-for="(it,j) in item.children">
						<el-submenu v-if="it.children&&it.children.length>0" :index="it.name" :key='j'>
							<template slot="title">
								<i style="padding-top: -4px;" :class="it.icon"></i>
								<span>{{it.title}}</span>
							</template>
							<el-menu-item v-if="it.children" v-for="(t,k) in it.children" :index="t.name" :key='k'>
								<span><i style="padding-top: -4px;" :class="t.icon"></i>{{t.title}}</span>
							</el-menu-item>
						</el-submenu>
						<el-menu-item v-else :index="it.name" :key='j'>
							<i style="padding-top: -4px;" :class="it.icon"></i>
							<span>{{it.title}}</span>
						</el-menu-item>
					</template>
				</el-submenu>
				<el-menu-item v-else :index="item.name" :key='i'>
					<i :class="item.icon"></i>
					<span slot="title">{{item.title}}</span>
				</el-menu-item>
			</template>
		</el-menu>
	</div>
</template>

<script>
	const pzgl = 'setting20201013095503'
	// 菜单左侧
	export default {
		props: {
			isCollapse: {
				type: Boolean,
				default: false
			}
		},
		data() {
			return {
				menu: [
					// {
					// 	icon: 'el-icon-s-platform',
					// 	id: 'cashier20201016',
					// 	title: '收银台',
					// 	name: 'cashier',
					// 	src: '#/cashier',
					// 	type: 1,
					// 	close: false
					// }
				]
			}
		},
		methods: {
			getMenuItem(_item, id) {
				let item = _item.filter(r => r.name == id)
				return item.length > 0 ? item[0].children && item[0].children.length > 0 ? item[0].children : item[0] : null
			},
			handleSelect(key, keyPath) {
				let item = this.menu
				for (let i = 0; i < keyPath.length; i++) {
					item = this.getMenuItem(item, keyPath[i])
				}
				if (!item.src) {
					return
				}
				this.$emit('menuTabClick', item)
			},
			handleOpen(key, keyPath) {
				this.handleSelect(key, keyPath)
			},
			handleClose(key, keyPath) {
				console.log(key, keyPath)
			},
			getMenuData() {
				this.$api.getAllSysMenu().then(res => {
					if (!res) {
						return
					}
					if (res.code == 0) {
						let val = res.data
						val.map(r => {
							r.id = r.id + ''
							return r
						})
						let array = val.filter(r => !r.parentId || r.parentId == '0' || r.parentId == 'null')
						array.map(r => {
							r.children = val.filter(f => f.parentId == r.id)
						})
						this.menu = array;
						let parentId = this.menu[0]['parentId'];
						debugger
						if (!parentId || parentId == '0' || parentId == 'null') {
							let _pid = this.menu[0]['id'];
							let m = val.filter(v => v.parentId == _pid);
							let _oid = m[0]['name']
							this.handleSelect(_oid, [this.menu[0]['name'],_oid])
							return;
						}
						// 设置默认打开页面
						let _oid = this.menu[0]['name']
						this.handleSelect(_oid, [_oid])
					}
				})
			}
		},
		created() {
			this.getMenuData()
		}
	}
</script>

<style>
	.el-menu-vertical-demo:not(.el-menu--collapse) {
		width: 240px;
		min-height: 400px;
		text-align: left;
	}
</style>
