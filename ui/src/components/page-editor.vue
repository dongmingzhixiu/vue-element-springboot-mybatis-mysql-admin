<template>
	<div class="editor">
		<el-form ref="form" style="width: 100%;" :model="forms" label-width="120px">
			<div style="width: 100%" :class="`editor-cols${colss}`" :style="colss>1?`flex-wrap:wrap;display: flex;overflow-y: auto;`:``">
				<div class="editor-cols-item" v-for="(item,i) in layouts" :key="i">
					<div class="f-c editor-item" style="width: 100%;">
						<slot v-if="item.visabled==undefined||item.visabled" name="before" :data="{row:item,form:forms,index:i}"></slot>
						<div class="w">
							<el-form-item v-if="item.type=='text'&&(item.visabled==undefined||item.visabled)" :label="`${item['label']+(item['require']?'*':'')}`"
							 :key="`text_${i}`">
								<el-input :show-password="getShowPassword(item)" :readonly="item.readonly||readonly" :disabled="item.disabled||item.readonly||readonly"
								 v-model="forms[item['prop']]" :placeholder="(item.readonly||item.disabled?(item['placeholder']||item['label']):'请输入'+(item['placeholder']||item['label']))"
								 @input="checkVal(item)" @focus="checkVal(item)" @blur="checkVal(item)"></el-input>
							</el-form-item>
							<el-form-item v-if="(item.type=='iconinput'||item.type=='icon')&&(item.visabled==undefined||item.visabled)"
							 :label="`${item['label']+(item['require']?'*':'')}`" :key="`text_${i}`">
								<icon-input :readonly="item.readonly||readonly" :disabled="item.disabled||item.readonly||readonly" :value="forms[item['prop']]"
								 @icon="forms[item['prop']]=$event"></icon-input>
							</el-form-item>
							<el-form-item v-if="item.type=='textarea'&&(item.visabled==undefined||item.visabled)" :label="`${item['label']+(item['require']?'*':'')}`"
							 :key="`textarea_${i}`">
								<el-input class="w" type="textarea" :disabled="item.readonly||readonly" :rows="item.rows" v-model="forms[item['prop']]"
								 :placeholder="'请输入'+item['label']"></el-input>
								<slot name="textarea-append" :row="item" :form="forms"></slot>
							</el-form-item>
							<el-form-item v-if="item.type=='select'&&(item.visabled==undefined||item.visabled)" :label="`${item['label']+(item['require']?'*':'')}`"
							 :key="`select_${i}`">
								<el-select popper-class="select-option" clearable :value="forms[item['prop']]" :disabled="item.readonly||readonly" v-model="forms[item['prop']]"
								 :placeholder="'请选择'+item['label']" @clear="checkVal(item)" @change="selectChange(item,$event)" @focus="checkVal(item)"
								 @blur="checkVal(item)">
									<el-option v-if="typeof item['getHtml']=='function'" v-for="it in item['value']" :key="it.value" :label="it.label"
									 :value="it.value">
										<div v-html="item.getHtml(it)"></div>
									</el-option>
									<el-option v-if="typeof item['getHtml']=='undefined'" v-for="it in item['value']" :key="it.value" :label="it.label"
									 :value="it.value"></el-option>
								</el-select>
							</el-form-item>
							<el-form-item v-if="item.type=='date'&&(item.visabled==undefined||item.visabled)" :label="`${item['label']+(item['require']?'*':'')}`"
							 :key="`date_${i}`">
								<el-date-picker :disabled="item.readonly||readonly" :default-value="forms[item['prop']]" :picker-options="{disabledDate: item['disabledDate']||null,shortcuts:item['shortcuts']||null,}"
								 v-model="forms[item['prop']]" :type="item['dateType']" :format="item['format']||'yyyy-MM-dd HH:mm:ss'"
								 placeholder="选择日期" @change="checkVal(item)" @focus="checkVal(item)" @blur="checkVal(item)">
								</el-date-picker>
							</el-form-item>
							<!-- 验证 -->
							<el-form-item v-if="item.error" class="error" style="margin-top: -20px;margin-bottom: 4px;line-height: 20px;height: 20px;"
							 :key="`error_${i}`">
								<div class="c-d fs t-l">{{item.errorMsg}}</div>
							</el-form-item>
						</div>
						<slot v-if="item.visabled==undefined||item.visabled" name="after" :data="{row:item,form:forms,index:i}"></slot>
					</div>
				</div>
			</div>
			<slot name="btnBefore"></slot>
			<el-form-item>
				<template v-if="btn&&layouts.length>0">
					<el-button v-if="!readonly&&btn['save']!='hidden'" type="primary" @click="onSubmit">{{btn['save']}}</el-button>
					<el-button v-if="btn['close']!='hidden'" @click="onCancel">{{btn['close']}}</el-button>
				</template>
				<template>
					<slot name="tools-btn" :data="{form:forms,add:add,layout:layout}"></slot>
				</template>
			</el-form-item>
		</el-form>
	</div>

</template>

<script>
	export default {
		name: 'page-editor',
		props: {
			allVisabled: {
				tyep: Boolean,
				default: false
			},
			nullReplaceEmpty: {
				type: Boolean,
				default: true
			},
			cols: {
				type: Number,
				default: 1,
			},
			msg: '保存',
			useDefaultSubmit: {
				type: Boolean,
				default: true
			},
			changeForm: {
				type: Function,
				default: (form) => {
					return form;
				}
			},
			btn: {
				type: Object,
				default: () => {
					return {
						'save': '保存',
						'close': '关闭'
					};
				}
			},
			layout: {
				type: Array,
				default: () => {
					return [];
				}
			},
			add: {
				type: Boolean,
				default: false,
			},
			readonly: {
				type: Boolean,
				default: true,
			},
			query: {
				type: Object,
				default: () => {
					return {};
				}
			},
			queryId: {
				type: [String, Number],
				default: ""
			},
			method: {
				type: Object,
				default: () => {
					return {
						add: 'addTrustMerchant',
						upd: 'updTrustMerchant',
						byId: 'getTrustMerchantById'
					}
				}
			},
			form: {
				type: Object,
				default: () => {
					return {};
				}
			}
		},
		watch: {

			layout() {
				this.layouts = this.layout;
				this.setVisabledAll(true);
			},
			queryId() {
				// debugger
				this.adds = (this.queryId + "").trim().length <= 0;
				// debugger
				this.getData();
			},
			add(news) {
				this.adds = news;
			},
			method(news) {
				if (news) {
					this.getData();
				}
			},
			cols(news) {
				this.colss = news;
			},
			form(news) {
				Object.keys(news).map(r => {
					if (news[r] && news[r].length > 0) {
						this.$set(this.forms, r, news[r]);
					}
				});
			},
		},
		data() {
			return {
				adds: this.add,
				colss: this.cols,
				forms: {},
				layouts: this.layout
			}
		},
		methods: {
			/**
			 * 获取显示的值
			 * @param {Object} item
			 */
			getShowPassword(item) {
				if (!item['password'] || item['password'] == 'false' || item['password'] == false) {
					return false;
				}
				return true;
			},
			/**
			 * @param {Object} item
			 */
			selectChange(item, val) {
				if (typeof item['change'] == "function") {
					let obj = item.change(val);
					/**
					 * 联动 ,修改属性
					 */
					try {
						Object.keys(obj).map(r => {
							let lay = this.layouts.filter(l => l.prop == r);
							if (lay.length > 0) {
								let index = this.layouts.indexOf(lay[0]);
								Object.keys(obj[r]).map(k => {
									lay[0][k] = obj[r][k];
									debugger
									this.$set(this.layouts, index, lay[0]);
								});
							}
						});
					} catch (e) {
						//TODO handle the exception
					}
				}
				this.checkVal(item);
			},

			/**
			 * 数据校验
			 */
			checkVal(item) {
				let index = this.layout.indexOf(item);
				if (item.visabled != undefined && (item.visabled == false || item.visabled == 'false')) {
					item["error"] = false;
					item['errorMsg'] = "";
					this.$set(this.layout, index, item);
					return true;
				}
				if (item.readonly != undefined && item.readonly) {
					item["error"] = false;
					item['errorMsg'] = item['label'] + "可为空！";
					this.$set(this.layout, index, item);
					return true;
				}


				let val = this.forms[item['prop']];
				if (item.require) {
					if (!val || (typeof val == "string" && val.trim().length <= 0)) {
						item["error"] = true;
						item['errorMsg'] = item['label'] + "不能为空！";
						this.$set(this.layout, index, item);
						return false;
					}
				}
				if (!item.require && !val) {
					item["error"] = false;
					item['errorMsg'] = item['label'] + "可为空！";
					this.$set(this.layout, index, item);
					return true;
				}
				//校验正则
				if (item.regex != undefined) {
					//正则表达式验证
					if (typeof item.regex == 'string') {
						let _tempRegex = item.regex.replace(/^[/]|[/][i,g,m]{0,2}$/g, "");
						if (_tempRegex == item.regex) { //不是正则表达式，值比较
							if (_tempRegex != val) {
								item["error"] = true;
								item['errorMsg'] = item['msg'] || item['label'] + "格式错误！";
								this.$set(this.layout, index, item);
							}
							return false;
						} else {
							let attributes = item.regex.substring(1);
							attributes = attributes.substring(attributes.indexOf("/") + 1);
							let reg = attributes ? new RegExp(_tempRegex, attributes) : new RegExp(_tempRegex);
							if (!reg.test(val)) {
								item["error"] = true;
								item['errorMsg'] = item['msg'] || item['label'] + "格式错误！";
								this.$set(this.layout, index, item);
								return false;
							}
						}

					} else if (typeof item.regex == 'function') {
						let flg = item.regex(val);
						if (!flg) {
							item["error"] = true;
							item['errorMsg'] = item['msg'] || item['label'] + "格式错误！";
							this.$set(this.layout, index, item);
							return false;
						}
					}
				}
				item["error"] = false;
				item['errorMsg'] = "验证通过！";
				this.$set(this.layout, index, item);
				return true;
			},
			/**
			 * 数据提交
			 */
			onSubmit() {
				//校验数据
				for (let i = 0; i < this.layout.length; i++) {
					let flg = this.checkVal(this.layout[i]);
					if (!flg) {
						break;
					}
				}
				let errorLayou = this.layout.filter(lay => lay.error == true);
				if (errorLayou.length > 0) {
					this.$message.error(errorLayou[0]['errorMsg']);
					return;
				}
				if (!this.useDefaultSubmit) {
					this.$emit("save", this.forms);
					return;
				}
				var method = this.method[this.adds ? 'add' : 'upd'];
				if (typeof this.changeForm == "function") {
					this.forms = this.changeForm(this.forms);
				}
				this.$emit("saveBefore", {
					form: this.forms,
					method: method
				});
				this.$api[method](this.forms).then(res => {
					if (res.code == 0) {
						this.$message.success(`${this.msg||'保存'}成功！,如数据为改变，请手动刷新！`);
						this.$notify({
							title: '提示',
							type: 'warning',
							message: `${this.msg||'保存'}成功！,如数据未改变，请手动刷新！`,
							duration: 3000
						});
						//刷新数据
						this.$emit("save", res);
						return;
					}
					this.$notify({
						title: '提示',
						type: 'error',
						message: res.msg || `${this.msg||'保存'}失败，请稍后再试！`,
						duration: 3000
					});
					this.$emit("save", res);
				});
			},
			/**
			 * 关闭
			 */
			onCancel() {
				this.$emit("close", this.forms);
				this.$emit("closeTab", null);
			},
			/**
			 * 查询一条数据
			 */
			getData() {
				if (!this.queryId || !this.method) {
					this.setFormVal();
					return;
				}
				this.$api[this.method['byId']](this.queryId).then(res => {
					if (res.code == 0) {
						// this.form = res.data;
						Object.keys(res.data).map(r => {
							this.$set(this.forms, r, this.replaceNull(res.data[r]));
						});
						this.setFormVal();
					}
				});
			},
			/**
			 * 设置布局的默认值
			 */
			setFormVal() {
				if (this.query['setFormValue']) {
					try {
						let _val = this.query['setFormValue'];
						Object.keys(_val).map(r => {
							this.$set(this.forms, r, _val[r]);
						});
					} catch (e) {
						//TODO handle the exception
						throw `传入设置初始值失败！形如 \setFormValue:[{\n\tname:'张三',age:'18'\n}]`
					}
				}
				this.setLayoutProperty();
			},
			/**
			 * 设置布局默认属性
			 * @param {Object} val
			 */
			setLayoutProperty() {
				if (this.query['setLayoutProperty']) {
					try {
						let list = this.query['setLayoutProperty'];
						if (typeof list == "object") {
							list = [list];
						}
						list.map(_val => {
							let item = this.layouts.filter(l => l.prop == _val.prop);
							if (item.length > 0) {
								item = item[0];
								let index = this.layouts.indexOf(item);
								Object.keys(_val).map(r => {
									item[r] = _val[r];
								});
								this.$set(this.layouts, index, item);
							}
						});
					} catch (e) {
						//TODO handle the exception
						throw `传入设置初始值失败！形如 \nsetLayoutProperty:[{\n\tprop:'name',require:true\n}]`
					}
				}
				this.setEditorProterty();
			},
			/**
			 * 设置页面性质
			 */
			setEditorProterty() {
				let pro = ['add'];
				for (let i = 0; i < pro.length; i++) {
					if (this.query[pro[i]] != undefined) {
						this[pro[i]] = this.query[pro[i]];
					}
				}
			},
			setVisabledAll(e) {
				if (this.allVisabled) {
					let temp = this.layouts;
					this.layouts = [];
					for (let i = 0; i < temp.length; i++) {
						temp[i].visabled = true;
					}
					this.$nextTick(() => {
						this.layouts = temp;
					});
				}
			},
			replaceNull(val) {
				if (!val) {
					return "";
				}
				if (this.nullReplaceEmpty) {
					return (val + "").replace(/null/gi, "");
				}
				return val;
			}

		},
		created() {
			this.setVisabledAll(true);
			setTimeout(() => {
				this.setFormVal();
				//获取数据
				try {
					this.getData();
				} catch (e) {}

			}, 200);
		}
	}
</script>

<style>
	.editor {
		width: 100%;
		padding: 20px;
		box-sizing: border-box;
	}

	.el-date-editor.el-input,
	.el-date-editor.el-input__inner {
		width: 100% !important;
	}

	.editor .el-select {
		width: 100% !important;
	}

	.error .el-form-item__content {
		line-height: 20px;
		font-size: 12px;
	}

	.error .el-form-item {
		margin-bottom: 0;
	}

	.el-form .editor-cols1 {
		display: block;
	}

	.editor .el-form .editor-cols2,
	.editor .el-form .editor-cols3,
	.editor .el-form .editor-cols4,
		{
		box-sizing: border-box !important;
		display: flex !important;
		justify-content: start !important;
		flex-wrap: wrap !important;
		flex-direction: column !important;
	}

	.editor .editor-cols2 .editor-cols-item {
		width: calc(50% - 20px) !important;
		flex-grow: 1;
	}

	.editor .editor-cols3 .editor-cols-item {
		width: calc(33.3% - 20px) !important;
		flex-grow: 1;
	}

	.editor .editor-cols4 .editor-cols-item {
		width: calc(25% - 20px) !important;
		flex-grow: 1;
	}

	.editor .editor-cols1 .editor-cols-item .editor-item .el-form-item,
	.editor .editor-cols2 .editor-cols-item .editor-item .el-form-item,
	.editor .editor-cols3 .editor-cols-item .editor-item .el-form-item,
	.editor .editor-cols4 .editor-cols-item .editor-item .el-form-item {
		width: calc(100% - 40px) !important;
	}


	.editor div:not(.el-select)>el-input [readonly],
	.editor div:not(.el-select)>el-input [disabled] {
		background: #FAFAFA;
	}
</style>
