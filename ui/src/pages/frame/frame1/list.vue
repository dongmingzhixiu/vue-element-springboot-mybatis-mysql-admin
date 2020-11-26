<template>
	<div class="box-b p10 over-h">
		<el-row v-loading="loading">
			<list-where :layout="where" :form="wdata">
				<template slot="toolsBtn" slot-scope="form">
					<el-button v-if="item.menuType==2" v-for="(item,i) in buttons" :key="i" :type="item.type" :style="item.css" :icon="item.icon"
					 @click="btnClick(form,item.methodParam)">{{item.title}}
					</el-button>
				</template>
			</list-where>
			<el-card class="box-b m-t10" shadow="hover">
				<page-helper ref="pageHelper" :add-height="-220" :api-name="apiName" :api-data="apiData" :is-init-data="true"
				 :columns="columns" :tools="tools">
					<template slot="tools-btn" slot-scope="row">
						<el-button v-if="item.menuType==1" v-for="(item,i) in buttons" :key="i" :type="item.type" :style="item.css" :icon="item.icon"
						 @click="btnClick(row.data,item.methodParam)">{{item.title}}
						</el-button>
					</template>
				</page-helper>
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
			},
			wRouleJson(news) {
				this.setLayoutInfo(1)
			},
			cRouleJson(news) {
				this.setLayoutInfo(2)
			},
		},
		data() {
			return {
				method: null,
				apiName: '',
				wdata: {
					merchantId: '',
					merchantNo: ''
				},
				apiData: {},
				columns: [],
				buttons: [],
				tools: [{
					fixed: "right",
					label: '操作',
					width: "150",
				}],
				where: [],
				addUid: this.$util.uuid(),
				loading: false,
				editorPath: 'trust-merchant-editor',
				cRouleJson: '',
				wRouleJson: '',
			}
		},
		methods: {
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
			/**
			 * 添加
			 * @param {Object} e
			 * @param {Object} type
			 */
			addInfo(e, type) {
				let _query = {
					add: true,
					readonly: false
				};
				this.addTab(_query, type, "添加");
			},
			/**
			 * 删除
			 */
			deleteInfo(e) {
				this.$deleteForm(e, this.method["del"], () => {
					this.getWhere();
				})
			},
			/**
			 * 编辑
			 */
			editorInfo(e, type) {
				let query = {
					add: false,
					readonly: false,
					id: e.id
				};
				this.addTab(query, type, "编辑");
			},
			/**
			 * 查看
			 */
			readInfo(e, type) {
				let _query2 = {
					add: false,
					readonly: true,
					id: e.id
				};
				this.addTab(_query2, type, "查看");
			},

			/**
			 * 按钮点击事件
			 * @param {Object} e 参数
			 * @param {Object} type 类型，根据不同类型，去实现不同的功能
			 */
			btnClick(e, type) {
				switch (type) {
					case 'add':
						this.addInfo(e.type);
						break;
					case 'delete':
						this.deleteInfo(e);
						break;
					case 'editor':
						this.editorInfo(e, type);
						break;
					case 'search':
						this.getWhere();
						break;
					case 'read':
						this.readInfo(e, type);
						break;
					default:
						throw `未实现方法：${type}`
						break;
				}
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
					this.wRouleJson = res.where[0].rouleJson;
					this.cRouleJson = res.columns[0].rouleJson;
					this.setLayoutInfo(1)
					this.setLayoutInfo(2)
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
			setLayoutInfo(type) {

				let layout = type == 1 ? this.where : this.columns;
				let rouleJson = type == 1 ? this.wRouleJson : this.cRouleJson;

				if (typeof rouleJson == 'string') {
					rouleJson = this.$getLayoutByStr(rouleJson)
				}
				if (!layout || layout.length <= 0) {
					return;
				}
				layout.filter(item => {
					let temp = rouleJson[item.prop];
					item.visabled = !temp;
				});
				if (type == 1) {
					this.where = null;
					this.$nextTick(() => {
						this.where = layout;
					});
				} else if (type == 2) {
					this.columns = null;
					this.$nextTick(() => {
						this.columns = layout;
					});
				}
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
