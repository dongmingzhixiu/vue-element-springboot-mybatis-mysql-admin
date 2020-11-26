<template>
	<div class="box-b p10 over-h">
		<el-row v-loading="loading">
			<list-where :layout="where" :form="wdata">
				<template slot="toolsBtn" slot-scope="form">
					<el-button v-if="item.menuType==4" v-for="(item,i) in buttons" :key="i" :type="item.type" :style="item.css" :icon="item.icon"
					 @click="btnClick(form,item.methodParam)">{{item.title}}
					</el-button>
				</template>
			</list-where>
			<el-card class="box-b m-t10" shadow="hover">
				<div class="w f-s">
					<div class="" style="width: 550px;">
						<page-helper ref="pageHelper" :add-height="-220" :api-name="apiName" :api-data="apiData" :is-init-data="true"
						 :columns="columns" :tools="tools">
							<template slot="tools-btn" slot-scope="row">
								<el-button v-if="item.menuType==1" v-for="(item,i) in buttons" :key="i" :type="item.type" :style="item.css"
								 :icon="item.icon" @click="btnClick(row.data,item.methodParam)">{{item.title}}
								</el-button>
							</template>
						</page-helper>
					</div>
					<div class="bor-ef box-shork" style="width: 500px">
						<div class="f-c color8" style="align-items: center;height: 400px;" v-if="!selectUser">
							请点击人员，进行菜单设置！
						</div>
						<div v-else>
							<div class="tools f-b p-l4 p-r4">
								<div class="tip-p">用户<span class="c-d font-weigth-bold">{{selectUser.nickName}}</span>菜单</div>
								<el-button v-if="item.menuType==5" v-for="(item,i) in buttons" :key="i" :type="item.type" :style="item.css"
								 :icon="item.icon" @click="btnClick(null,item.methodParam)">{{item.title}}
								</el-button>
							</div>
							<page-helper :check-list="checkList" table-type="checkbox" :change-list="menuChangeList" ref="pageHelper"
							 :add-height="-220" :api-name="apiName2" :api-data="apiData" :is-init-data="true" :columns="columns2" @checkbox="checkbox">
								<template slot="col-before" slot-scope="row">
									<el-checkbox @click="row.data.row.checked=!row.data.row.checked" v-if="row.data.props=='icon'" v-model="row.data.row.checked"></el-checkbox>
								</template>
								<template slot="tools-btn" slot-scope="row">
									<el-button v-if="item.menuType==2" v-for="(item,i) in buttons" :key="i" :type="item.type" :style="item.css"
									 :icon="item.icon" @click="btnClick(row.data,item.methodParam)">{{item.title}}
									</el-button>
								</template>
								<template slot="expand-info" slot-scope="row">
									<!-- {{row}} -->
								</template>
							</page-helper>
						</div>
					</div>
					<div style="width: 550px">
						<div class="f-c color8" style="align-items: center;height: 400px;" v-if="!checkMenuList||checkMenuList.length<=0">
							请点击菜单，进行菜单功能设置！
						</div>
						<div v-else class="box-b" style="height: calc(100vh - 220px);">
							<div class="tools f-b p-l4 p-r4">
								<div class="tip-p"><span class="c-d font-weigth-bold">菜单</span>功能设置</div>
								<div class="f-e">
									<el-button v-if="item.menuType==6" v-for="(item,i) in buttons" :key="i" :type="item.type" :style="item.css"
									 :icon="item.icon" @click="btnClick(null,item.methodParam)">{{item.title}}
									</el-button>
								</div>
							</div>
							<el-tabs v-if="buttons&&buttons.filter(btn=>btn.menuType==9||btn.menuType==10).length>0" type="card" v-model="tabActive"
							 style="height:calc(100% - 45px);">
								<el-tab-pane v-if="buttons&&buttons.filter(btn=>btn.menuType==10).length>0" name="button" label="按钮" style="height:calc(100% - 45px);">
									<el-collapse v-model="tabActiveNames" style="height:calc(100vh - 330px);overflow: auto">
										<el-collapse-item class="m-l4" v-for="(menu ,m) in getCheckMenuListToTree()" :title="menu.title" :name="menu.id"
										 :key="m">
											<div style="height: auto;">
												<div class="f-s-w" style="align-items: center;">
													<div class="m-r10">
														<el-checkbox v-if="buttonsCheckMap&&buttonsCheckMap['menu_'+menu.id]!=undefined" v-model="buttonsCheckMap['menu_'+menu.id]"
														 @change="btnClick({id:menu.id,check:$event,isChild:false},'checkboxAll')">全选</el-checkbox>
														<el-checkbox v-else @change="btnClick({id:menu.id,check:$event,isChild:false},'checkboxAll')">全选</el-checkbox>
													</div>
													<div class="f-s m-r10" style="align-items: center;" v-if="menu.id==item.menuId" v-for="(item,i) in  merchantButtonList"
													 :key="i">
														<el-checkbox v-model="buttonsCheckMap[item.id]" @change="buttonsCheckMap[item.id]=!buttonsCheckMap[item.id]"></el-checkbox>
														<el-button class="m4 f-c" :type="item.type" :style="item.css" :size="item.size" :icon="item.icon">
															<div class="f-b" style="align-items: center;">
																{{item.title}}
															</div>
														</el-button>
													</div>
												</div>
												<div>
													<el-collapse class="w" v-model="tabActiveNames">
														<el-collapse-item class="m-l4" v-for="(child ,c) in menu.children" :title="child.title" :name="child.id"
														 :key="c">
															<div class="f-s-w" style="align-items: center;">
																<div class="m-r10">
																	<el-checkbox v-if="buttonsCheckMap&&buttonsCheckMap['child_'+child.id]!=undefined" v-model="buttonsCheckMap['child_'+child.id]"
																	 @change="btnClick({id:child.id,check:$event,isChild:true},'checkboxAll')">全选</el-checkbox>
																	<el-checkbox v-else @change="btnClick({id:child.id,check:$event,isChild:true},'checkboxAll')">全选</el-checkbox>
																</div>
																<div class="f-s m-r10" style="align-items: center;" v-if="child.id==item.menuId" v-for="(item,c) in  merchantButtonList"
																 :key="c">
																	<el-checkbox v-model="buttonsCheckMap[item.id]" @change="buttonsCheckMap[item.id]=!buttonsCheckMap[item.id]"></el-checkbox>
																	<el-button class="m4 f-c" :type="item.type" :style="item.css" :size="item.size" :icon="item.icon">
																		<div class="f-b" style="align-items: center;">
																			{{item.title}}
																		</div>
																	</el-button>
																</div>
															</div>
														</el-collapse-item>
													</el-collapse>
												</div>
											</div>

										</el-collapse-item>
									</el-collapse>
								</el-tab-pane>

								<!-- 布局 -->

								<el-tab-pane v-if="buttons&&buttons.filter(btn=>btn.menuType==9).length>0" name="layout" label="布局">
									<div class="box-b" style="height:calc(100vh - 330px);overflow: hidden;margin-top: -10px;">
										<el-tabs class="m-l4 w" v-model="layoutActiveNames" style="height:calc(100vh - 390px);">
											<!-- 显示布局 -->
											<el-tab-pane name="showLayout" label="显示布局" style="height:calc(100% - 390px);height: auto;">
												<el-collapse v-model="tabActiveNames" style="height:calc(100vh - 390px);overflow: auto">
													<el-collapse-item class="m-l4" v-for="(menu ,m) in getCheckMenuListToTree()" :title="menu.title" :name="menu.id"
													 :key="m">
														<div style="height: auto;">
															<template v-for="(item,i) in merchantLayoutList">
																<layout-editor v-if="item.menuId==menu.id&&item.layoutType==1" :columns="getJson(item.layoutJson)" :key="i"
																 :title="item.remake||menu.title" :layout-type="1" @column="getSettingLayout(menu.id,item.id,$event)"></layout-editor>
															</template>
														</div>
														<div v-if="menu.children&&menu.children.length>0">
															<el-collapse class="w" v-model="tabActiveNames">
																<el-collapse-item class="m-l4" v-for="(child ,c) in menu.children" :title="child.title" :name="child.id"
																 :key="c">
																	<template v-for="(item,i) in merchantLayoutList">
																		<layout-editor v-if="item.menuId==child.id&&item.layoutType==1" :columns="getJson(item.layoutJson)"
																		 :key="i" :title="item.remake||child.title" :layout-type="1" @column="getSettingLayout(child.id,item.id,$event)"></layout-editor>
																	</template>
																</el-collapse-item>
															</el-collapse>
														</div>
													</el-collapse-item>
												</el-collapse>
											</el-tab-pane>
											<!-- 条件布局 -->
											<el-tab-pane name="whereLayout" label="条件布局" style="height:calc(100% - 390px);height: auto;">
												<el-collapse v-model="tabActiveNames" style="height:calc(100vh - 390px);overflow: auto">
													<el-collapse-item class="m-l4" v-for="(menu ,m) in getCheckMenuListToTree()" :title="menu.title" :name="menu.id"
													 :key="m">
														<div style="height: auto;">
															<template v-for="(item,i) in merchantLayoutList">
																<layout-editor v-if="item.menuId==menu.id&&item.layoutType==2" :columns="getJson(item.layoutJson)" :key="i"
																 :title="item.remake||menu.title" :layout-type="2" @where="getSettingLayout(menu.id,item.id,$event)"></layout-editor>
															</template>
														</div>
														<div v-if="menu.children&&menu.children.length>0">
															<el-collapse class="w" v-model="tabActiveNames">
																<el-collapse-item class="m-l4" v-for="(child ,c) in menu.children" :title="child.title" :name="child.id"
																 :key="c">
																	<template v-for="(item,i) in merchantLayoutList">
																		<layout-editor v-if="item.menuId==child.id&&item.layoutType==2" :columns="getJson(item.layoutJson)"
																		 :key="i" :title="item.remake||child.title" :layout-type="2" @where="getSettingLayout(child.id,item.id,$event)"></layout-editor>
																	</template>
																</el-collapse-item>
															</el-collapse>
														</div>
													</el-collapse-item>
												</el-collapse>
											</el-tab-pane>
											<!-- 编辑布局 -->
											<el-tab-pane name="editorLayout" label="编辑布局" style="height:calc(100% - 390px);height: auto;">
												<el-collapse v-model="tabActiveNames" style="height:calc(100vh - 390px);overflow: auto">
													<el-collapse-item class="m-l4" v-for="(menu ,m) in getCheckMenuListToTree()" :title="menu.title" :name="menu.id"
													 :key="m">
														<div style="height: auto;">
															<template v-for="(item,i) in merchantLayoutList">
																<layout-editor v-if="item.menuId==menu.id&&item.layoutType==3" :columns="getJson(item.layoutJson)" :key="i"
																 :title="item.remake||menu.title" :layout-type="3" @editor="getSettingLayout(menu.id,item.id,$event)"></layout-editor>
															</template>
														</div>
														<div v-if="menu.children&&menu.children.length>0">
															<el-collapse class="w" v-model="tabActiveNames">
																<el-collapse-item class="m-l4" v-for="(child ,c) in menu.children" :title="child.title" :name="child.id"
																 :key="c">
																	<template v-for="(item,i) in merchantLayoutList">
																		<layout-editor v-if="item.menuId==child.id&&item.layoutType==3" :columns="getJson(item.layoutJson)"
																		 :key="i" :title="item.remake||child.title" :layout-type="3" @editor="getSettingLayout(child.id,item.id,$event)"></layout-editor>
																	</template>
																</el-collapse-item>
															</el-collapse>
														</div>
													</el-collapse-item>
												</el-collapse>
											</el-tab-pane>
										</el-tabs>
									</div>
								</el-tab-pane>
							</el-tabs>
						</div>
					</div>
				</div>
			</el-card>
		</el-row>
	</div>
</template>

<script>
	export default {
		props: {
			query: {
				type: Object,
				default: () => {
					return {}
				}
			},
			tab: {
				type: Object,
				default: () => {
					return {}
				}
			},
			flush: {
				type: Boolean,
				default: false
			},
			reLayout: {
				type: String,
				default: ''
			},
		},
		watch: {
			flush(news, old) {
				if (news) {
					this.$refs.pageHelper.doLayout();
				}
			},
			reLayout(news) {
				this.$refs.pageHelper.doLayout();
			}
		},
		data() {
			return {
				method: null,
				apiName: '',
				apiName2: '',
				wdata: {
					merchantId: '',
					merchantNo: ''
				},
				apiData: {},
				columns: [],
				columns2: [],
				buttons: [],
				tools: [{
					fixed: "right",
					label: '操作',
					width: "150",
				}],
				where: [],
				// where2: [],
				addUid: this.$util.uuid(),
				loading: false,
				editorPath: 'trust-merchant-editor',
				checkMenuList: [],
				checkLayoutList: {},

				//选中的人
				selectUser: null,
				//选中的菜单
				selectMenu: null,
				checkList: null,
				checkButtonList: null,
				tabActive: 'button',
				merchantButtonList: [],
				merchantLayoutList: [],


				tabActiveNames: '',
				buttonsCheckMap: {},

				//布局操作
				layoutActiveNames: 'showLayout',
			}
		},
		methods: {

			checkbox(e) {
				this.checkMenuList = null;
				let {
					data,
					selection
				} = e;
				//设置所有值为false
				data.map(r => {
					r.isChecked = false;
					if (r.children && r.children.length > 0) {
						r.children.map(c => {
							c.isChecked = false;
						});
					}
				});

				//计算选中的数据，如果二级菜单选中，则选中一级菜单

				data.map(item => {
					if (item.children && item.children.length > 0) {
						item.children.map(child => {
							let se = selection.filter(s => s.id == child.id);
							if (se.length > 0) {
								child.isChecked = true;
								item.isChecked = true;
							}
							return child;
						})
						return item;
					} else {
						let se = selection.filter(s => s.id == item.id);
						if (se.length > 0) {
							item.isChecked = true;
						}
						return item;
					}
				});
				this.checkMenuList = data;
			},
			/**
			 * 添加tab
			 * @param {Object} query
			 * @param {Object} type
			 * @param {Object} title
			 */
			addTab(query, type, title) {
				let _tab = JSON.parse(JSON.stringify(this.tab));
				_tab['tagId'] = `${_tab.id}`;
				_tab['id'] = `${this.tab.id}${type}`;
				_tab['src'] = `${this.tab.src}-editor`;
				_tab['title'] = `${this.tab.title}-${title}`;
				this.$emit("addTab", {
					tab: _tab,
					query: query
				});
			},
			//-----------------------------------------------------------
			//实现功能
			//-----------------------------------------------------------

			getCheckMenuListToTree() {
				let checkMenuList = JSON.parse(JSON.stringify(this.checkMenuList));
				let list = [];
				checkMenuList.forEach(item => {
					if (item.isChecked) {
						list[list.length] = item;
					}
					try {
						item.children.forEach(child => {
							if (child.isChecked) {
								list[list.length] = child;
							}
						});
					} catch (e) {}
				});

				let array = list.filter(r => !r.parentId || r.parentId == '0' || r.parentId == 'null');
				array.map(r => {
					r.children = list.filter(f => f.parentId == r.id);
				});
				return array;
			},

			/**
			 * 保存用户所选的菜单
			 */
			rouleSaveMenuForUser() {
				let data = this.checkMenuList;
				let _data = [];
				let getData = function(item, user) {
					_data[_data.length] = {
						type: 1,
						userId: user.id,
						controlId: item.id
					};
				}
				data.map(r => {
					if (r.children && r.children.length > 0) {
						r.children.map(ch => {
							if (ch.isChecked) {
								getData(ch, this.selectUser);
							}
						});
					}
					if (r.isChecked) {
						getData(r, this.selectUser);
					}
				})
				this.$api.saveMenuOrButtonSysRoule(_data).then(res => {
					if (res.code == 0) {
						this.$message.success('保存成功！');
						return;
					}
					this.$message.error(res.msg || '出现错误，请稍后再试！');
				})
			},


			/**
			 * 保存用户所选的按钮
			 */
			rouleSaveButtonForUser() {
				let data = this.checkMenuList;
				let _data = [];
				Object.keys(this.buttonsCheckMap).map(key => {
					if ((key + "").indexOf("menu_") == 0 || (key + "").indexOf("child_") == 0 || !this.buttonsCheckMap[key]) {
						return;
					}
					let _index = _data.length;
					_data[_index] = {
						type: 2,
						userId: this.selectUser.id,
						controlId: key,
					};
					try {
						_data[_index]['remake'] = this.merchantButtonList.filter(b => b.id == key)[0].menuId;
					} catch (e) {
						//TODO handle the exception
					}
				});
				this.$api.saveMenuOrButtonSysRoule(_data).then(res => {
					if (res.code == 0) {
						this.$message.success('保存成功！');
						return;
					}
					this.$message.error(res.msg || '出现错误，请稍后再试！');
				})
			},
			//获取选择的布局信息
			getSettingLayout(menuId, controlId, layoutJson) {
				let checkLayoutList = this.checkLayoutList || {};
				this.checkLayoutList = null;
				checkLayoutList[controlId] = checkLayoutList[controlId] || {};
				checkLayoutList[controlId][menuId] = checkLayoutList[controlId][menuId] || {};
				checkLayoutList[controlId][menuId] = layoutJson;
				this.$nextTick(() => {
					this.checkLayoutList = checkLayoutList;
				})
			},
			/**
			 * 保存用户所选择的布局
			 */
			rouleSaveWhereForUser() {
				let data = this.checkLayoutList;
				let _data = [];
				Object.keys(data).map(r => {
					let d = data[r];
					Object.keys(d).map(key => {
						if (!d[key] || d[key] == "{}") {
							return;
						}
						_data[_data.length] = {
							type: 3,
							userId: this.selectUser.id,
							controlId: r,
							layoutJson: !d[key] || Object.keys(d[key]).length <= 0 ? '' : JSON.stringify(d[key]),
							remake: key
						};
					});
				});
				this.$api.saveMenuOrButtonSysRoule(_data).then(res => {
					if (res.code == 0) {
						this.$message.success('保存成功！');
						return;
					}
					this.$message.error(res.msg || '出现错误，请稍后再试！');
				})
			},

			//查询已经设置的菜单信息
			getUserMenuList(e) {
				this.selectUser = e;
				setTimeout(() => {
					this.checkList = null;
					this.$api.getMenuByUser({
						userId: e.id
					}).then(res => {
						if (res.code == 0) {
							let _button = res.data.filter(f => f.type == 2);
							this.buttonsCheckMap = {};
							_button.forEach(button => {
								this.$set(this.buttonsCheckMap, button.controlId, true);
								this.$set(this.buttonsCheckMap, 'child_' + button.controlId, true);
								console.log('menu_' + button.remake)
								this.$set(this.buttonsCheckMap, 'menu_' + button.remake, true);
							});

							let _menu = res.data.filter(f => f.type == 1);

							this.checkList = _menu.map(r => {
								let s = {
									id: r.controlId
								};
								return s;
							});


							if (!this.checkList || this.checkList.length <= 0) {
								this.merchantButtonList = null;
								this.merchantLayoutList = null;
								return;
							}


							this.getUserButtonList();
							this.getUserLayoutList();
							return;
						}
						this.$message.error(res.msg || '系统繁忙，稍后再试！');
					});
				}, 200);
				this.checkLayoutList = {};
			},
			//查询用户可分配权限的按钮
			getUserButtonList(e) {
				let temp = this.buttonsCheckMap;
				this.buttonsCheckMap = null;
				this.merchantButtonList = null;
				this.$api.getButtonSysRoule({
					userId: this.selectUser.id
				}).then(res => {
					if (res.code == 0) {
						this.merchantButtonList = res.data;
						this.buttonsCheckMap = temp;

						return;
					}
					this.$message.error(res.msg || '系统繁忙，稍后再试！');
				});
			},
			//查询用户可使用的布局
			getUserLayoutList(e) {
				this.merchantLayoutList = null;
				this.$api.getLayoutSysRoule({
					userId: this.selectUser.id
				}).then(res => {
					if (res.code == 0) {
						res.data = res.data.map(r => {
							r.layoutJson = this.$getLayoutByStr(r.layoutJson);
							r.rouleJson = !r.rouleJson || r.rouleJson == '{}' ? {} : eval("(" + r.rouleJson + ")");
							if(Object.keys(r.rouleJson).length>0){
								console.log(r.remake,r.menuId,r.layoutType,r.rouleJson);
							}
							r.layoutJson.forEach(item => {
								let temp = r.rouleJson[item.prop];
								item.use = !temp;
							});
							return r;
						})
						this.merchantLayoutList = res.data;
						return;
					}
					this.$message.error(res.msg || '系统繁忙，稍后再试！');
				});
			},

			//选中或取消
			checkButtonToMap(e) {
				try {
					if (!e.isChild) {
						// 循环设置状态
						// 得到子菜单的menuId
						let menu = this.checkMenuList.filter(menu => menu.id == e.id);
						let buttons = this.merchantButtonList.filter(m => m.menuId == e.id);
						buttons.forEach(button => {
							this.$set(this.buttonsCheckMap, button.id, e.check);
						});
						if (menu.length > 0) {
							if (menu[0].children && menu[0].children.length > 0) {
								menu[0].children.forEach(child => {
									let buttons = this.merchantButtonList.filter(m => m.menuId == child.id);
									buttons.forEach(button => {
										this.$set(this.buttonsCheckMap, button.id, e.check);
									});
									this.$set(this.buttonsCheckMap, 'child_' + child.id, e.check);
								});
							}
						}
					} else {
						let buttons = this.merchantButtonList.filter(m => m.menuId == e.id);
						buttons.forEach(button => {
							this.$set(this.buttonsCheckMap, button.id, e.check);
						});
					}
					this.$set(this.buttonsCheckMap, 'menu_' + e.id, e.check);
				} catch (e) {
					//TODO handle the exception
				}
			},
			/**
			 * 查询人员
			 */
			rouleSearch() {
				this.loading = true;
				Object.keys(this.wdata).map(k => {
					let v = this.wdata[k];
					this.$set(this.apiData, k, v ? v : '');
				});
				this.$refs.pageHelper.getPageData();
				setTimeout(() => {
					this.loading = false;
				}, 200);
			},


			/**
			 * 按钮点击事件
			 * @param {Object} e 参数
			 * @param {Object} type 类型，根据不同类型，去实现不同的功能
			 */
			btnClick(e, type) {
				switch (type) {
					case 'rouleSetting':
						//查询已设置的菜单	
						this.checkMenuList = [];
						this.buttonsCheckMap = {};
						this.getUserMenuList(e);
						break;
					case 'rouleButton':
						this.getUserButtonList();
						this.getUserLayoutList();
						this.tabActive = "button";
						break;
					case 'rouleLayout':
						this.getUserButtonList();
						this.getUserLayoutList();
						this.tabActive = "layout";
						break;
					case 'rouleSaveMenu':
						this.rouleSaveMenuForUser();
						break;
					case 'checkboxAll':
						this.checkButtonToMap(e);
						break;
					case 'rouleSaveButton':
						this.rouleSaveButtonForUser();
						break;
					case 'rouleSaveLayout':
						this.rouleSaveWhereForUser();
						break;
					case 'rouleSearch':
						this.rouleSearch();
						break;
					default:
						throw `未实现方法：${type}`
						break;
				}
			},
			/**
			 * 修改菜单展示的数据格式
			 */
			menuChangeList(list) {
				let array = list.filter(r => !r.parentId || r.parentId == '0' || r.parentId == 'null');
				array.map(r => {
					r.children = list.filter(f => f.parentId == r.id);
				});
				return array;
			},
			/**
			 * 条件查询语句
			 */
			getWhere() {
				this.loading = true;
				Object.keys(this.wdata).map(k => {
					let v = this.wdata[k];
					this.$set(this.apiData, k, v ? v : '');
				});
				this.$refs.pageHelper.getPageData();
				setTimeout(() => {
					this.loading = false;
				}, 200);
			},

			changeTable() {
				this.$refs.pageHelper.doLayout();
			},
			/**
			 * 获取布局数据
			 */
			getLayout() {
				this.loading = true;
				this.$getLayout(this.query.id).then(res => {
					//单页面布局，只取第一个布局
					this.loading = false;
					this.method = res.columns[0].apiName;
					this.apiName = typeof this.method == 'string' ? this.method : this.method['list'];
					this.where = res.where[0].layoutJson;
					this.columns = res.columns[0].layoutJson;
					try {
						this.apiName2 = typeof res.columns[1].apiName == 'string' ? res.columns[1].apiName : res.columns[1].apiName[
							'list'];
						this.columns2 = res.columns[1].layoutJson;
						// this.where2 = res.where[1].layoutJson;
					} catch (e) {

					}
				});
			},
			/**
			 * 获取按钮数据
			 */
			getButtons() {
				this.$getLayoutButton(this.query.id).then(res => {
					this.loading = false;
					this.buttons = res;
				});

			},


			//获取布局json
			getJson(str) {
				if (!str) {
					return {}
				}
				return this.$getLayoutByStr(str);
			},
			getJsonToInit(menuId, controlId, str) {
				let json = this.getJson(str);
				// if (Object.keys(json).length <= 0) {
				// 	return json;
				// }
				// let list = this.checkLayoutList;
				// if (list == null) {
				// 	list = {};
				// 	this.checkLayoutList = {};
				// }
				// list[menuId] = list[menuId] || {};
				// list[menuId][controlId] = list[menuId][controlId] || {};
				// list[menuId][controlId] = json;
				// this.$set(this.checkLayoutList, menuId, list[menuId]);

				return json;
			}

		},
		created() {
			this.getLayout();
			this.getButtons();
		}
	}
</script>

<style>
</style>
