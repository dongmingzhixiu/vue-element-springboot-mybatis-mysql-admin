<template>
	<div class="home w-vw over-h" style="position: relative;display: flex;flex-flow:row nowrap">
		<div id="left" ref="left" class="flex-no-chang-width box-b" style="background-color: #545c64 ">
			<tree-menu :isCollapse="isCollapse" @menuTabClick="menuAddTab"></tree-menu>
		</div>
		<div id="right" ref="right" class="w" style="width: 100%;flex-grow:1;flex-shrink:1">
			<div class="box-b w" style="height: 60px;">
				<page-head>
					<template slot="before">
						<div class="w-200 f-s box-b">
							<img class="m-l10 w-20 w-20" :src="require('../assets/img/menu.svg')" @click="collapseLeft()" />
							<!-- <div class="p10 color7 p-l6">
								{{title}}
							</div> -->
						</div>
					</template>
					<template slot="append">
						<div class="w-200 f-e box-b align-items-center">
							<div class="p10 color8 fs20 font-weigth-bold flex-no-chang-width" v-if="userInfo">{{userInfo.nickName}}</div>
							<el-button type="infor" title="退出" @click="loginOut">
								<img class="w-40 h-50" :src="require('../assets/img/exit.svg')" />
							</el-button>
						</div>
					</template>
					<template></template>
				</page-head>
			</div>
			<div id="pageBox" class="f-s box-b over-h page-box" style="width: 100%; height: calc(100vh - 60px);">
				<el-tabs style="height: 100%;" type='border-card' v-model="editableTabsValue" @tab-click="tabClick" @tab-remove="removeTabs">
					<el-tab-pane style="user-select: none;" :closable="item.close==1" :key="item.id+''" v-for="(item, index) in editableTabs" :label="item.title"
					 :name="item.id+''">
						<component class="h" v-if="item.reload==undefined||item.reload" :is="item.src.replace(/#\/|[?].*$/g,'')" :close="item.close"
						 :query="item.query" :tab="item" :re-layout="layout" @addTab="addTabs" @removeTab="removeTabs" @reflushTab="reflushTabs"
						 :flush="item.flush">
						</component>
					</el-tab-pane>
				</el-tabs>
			</div>
		</div>
	</div>
</template>

<script>
	const types = {
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
		}
	}
	// import simCache from '../../API/simple-cache.js';
	export default {
		data() {
			return {
				isCollapse: false,
				editableTabsValue: 'home-page20201012143257',
				title: '配置管理',
				editableTabs: [],
				reflushUuid: this.$util.uuid(),
				layout: this.$util.uuid(),
				userInfo:{}
			}
		},
		watch: {
			editableTabsValue(news, old) {
				this.layout = this.$util.uuid()
			}
		},
		methods: {
			//点击折叠左侧菜单
			collapseLeft() {
				try {
					this.isCollapse = !this.isCollapse;
					let oldOver = this.$refs.right.style.overflow;
					oldOver = "hidden";
					setTimeout(() => {
						try {
							let left = this.$refs.left.clientWidth;
							let wVw = document.documentElement.clientWidth;
							this.$refs.right.style.width = (wVw - left - 10) + "px";
							document.getElementById("right").style.width = (wVw - left - 10) + "px"
							this.$refs.right.style.overflow = oldOver;
						} catch (e) {
							//TODO handle the exception
						}
					}, 300);
				} catch (e) {}
				return this.isCollapse;
			},
			//点击切换tab
			tabClick(e) {
				let tagId = e.paneName || e.id;
				this.editableTabsValue = tagId;
				this.reflushTabs(tagId);

			},
			//添加tab
			addTabs(event) {
				if (this.editableTabs.length > 8) {
					this.$message.warning("最多只能打开8个窗口！");
					return;
				}
				let e = event.tab;
				let query = event.query;
				let id = e.id;
				//判断有没有相同的tab,如果有则选中
				let _t = this.editableTabs.filter(tab => tab.id == id);
				if (_t.length > 0) {
					this.editableTabsValue = id;
					return;
				}
				try {
					Object.keys(e.query).map(r => {
						e[r == 'id' ? 'queryId' : r] = e.query[r];
					});
				} catch (e) {
					//TODO handle the exception
				}
				let _tab = {
					src: e.src,
					title: e.title,
					id: id,
					close: e.close == undefined || e.close == true ? true : false,
					tagId: e['noChangTagId'] ? e.tagId : this.editableTabsValue,
					query: query,
				}
				this.$set(this.editableTabs, this.editableTabs.length, _tab);
				this.editableTabsValue = id;
			},

			//移除 tab
			removeTabs(targetId) {
				let tabs = this.editableTabs;
				let activeName = this.editableTabsValue;
				tabs.forEach((tab, index) => {
					if (tab.id == targetId) {
						let nextTab = tabs[index + 1] || tabs[index - 1];
						if (nextTab) {
							activeName = nextTab.id;
						}
					}
				});
				this.editableTabsValue = activeName;
				this.editableTabs = tabs.filter(tab => tab.id !== targetId);
			},
			//刷新
			reflushTabs(targetId) {
				let _t = this.editableTabs.filter(tab => tab.id == targetId);
				if (_t.length > 0) {
					let index = this.editableTabs.indexOf(_t[0]);
					this.$set(this.editableTabs[index], 'reload', false);
					this.$nextTick(() => {
						this.$set(this.editableTabs[index], 'reload', true);
						this.editableTabsValue = targetId;
					});
					return;
				}
			},
			/**
			 * 左侧菜单点击添加
			 * @param {Object} _tab
			 */
			menuAddTab(_tab) {
				let query = {
					id: _tab.id
				};
				this.addTabs({
					tab: _tab,
					query: query
				});
			},
			/**
			 * 退出
			 */
			loginOut() {
				this.$confirm('确定退出吗?', '提示', {
					confirmButtonText: '确定',
					cancelButtonText: '取消',
					type: 'warning'
				}).then(() => {
					this.$userInfo.clear();
					this.$cookie.clear();
					this.$api.loginOut().then(res => {

					});
					window.location.href = "#/login";
				}).catch(() => {

				});
			}
		},
		beforeCreate() {
			this.$login();
		},
		created() {
			window.collapseLeft = this.collapseLeft;
			this.userInfo=this.$userInfo.get();
		}
	}
</script>

<style>
	.home {
		height: 100vh;
		overflow: auto;
		min-height: 660px;
	}

	.el-tabs,
	.el-tabs--card,
	.el-tabs--top {
		width: 100%;
	}

	.home .cashier {
		width: 100vw !important;
		height: calc(100vh + 40px) !important;
		overflow: hidden !important;
		z-index: 999 !important;
		top: -40px !important;
		left: 0 !important;
		position: absolute !important;
	}

	.home .cashier .el-tabs__content {
		height: 100%;
	}

	.home .cashier .el-tabs__content [role] {
		height: 100%;

	}

	/* 设置滚动条的样式 */
	::-webkit-scrollbar {
		width: 8px;
		/*高宽分别对应横竖滚动条的尺寸*/
		height: 8px;
	}

	/* 滚动槽 */
	::-webkit-scrollbar-track {
		-webkit-box-shadow: inset006pxrgba(0, 0, 0, 0.3);
		border-radius: 10px;
	}

	/* 滚动条滑块 */
	::-webkit-scrollbar-thumb {
		border-radius: 10px;
		background: rgba(0, 0, 0, 0.1);
		-webkit-box-shadow: inset006pxrgba(0, 0, 0, 0.5);
	}

	::-webkit-scrollbar-thumb:window-inactive {
		background: rgba(255, 0, 0, 0.4);
	}


	.el-button--max {
		padding: 14px 40px;
	}

	.el-button--mini {
		padding: 2px 5px !important;
		height: 25px;
	}

	.editor .el-select-dropdown__item {
		height: auto;
	}
	
	.el-tabs__item.is-top.is-closable{
		user-select: none;
	}
</style>
