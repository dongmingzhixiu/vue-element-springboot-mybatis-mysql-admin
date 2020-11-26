<template>
	<div class="table" :style="{'height':`calc(100% - ${addHeight})`}">
		<div v-if="layoutType==1||layoutType=='show'" class="w">
			<div class="tip-p b-p1">可使用的显示布局<span class="c-d">{{title}}</span></div>
			<div style="overflow-x: auto;padding-bottom: 10px;padding-right: 40px;">
				<div class="f-s" style="padding: 10px;">
					<el-checkbox class="bor-ef p10 p-t2 p-b2 font-weigth-bold c-p" :indeterminate="indeterminate" v-model="checkAll" @change="checkBoxAll">全选</el-checkbox>
					<div class="f-s">
						<el-checkbox class="bor-ef p10 p-t2 p-b2 color8 font-weigth-bold" style="margin-right: 0;border-right: 0px;" v-for="(item,i) in layout"
						 v-model="item.use" :key="i" @change="check">{{item.label}}</el-checkbox>
					</div>
				</div>
			</div>
		</div>
		<div v-if="layoutType==2||layoutType=='where'" class="w" style="overflow-x: auto;padding-bottom: 10px;">
			<div class="tip-s b-s1">可使用的查询条件布局<span class="c-d">{{title}}</span></div>
			<el-checkbox class="p-r10 font-weigth-bold f-s p10" :indeterminate="indeterminate" v-model="checkAll" @change="checkBoxAll">全选</el-checkbox>
			<list-where :all-visabled="true" :layout="layout" :row-css="{'width':'100%'}" :row-class="`f-s-w`">
				<template slot="before" slot-scope="row">
					<el-checkbox v-model="layout[row.data.index].use" @change="check" class="p-r4 p-l10"></el-checkbox>
				</template>
			</list-where>
		</div>
		<div v-if="layoutType==3||layoutType=='editor'" class="w" style="overflow-x: auto;padding-bottom: 10px;">
			<div class="tip-d b-d1">可使用的编辑布局<span class="c-d">{{title}}</span></div>
			<el-checkbox class="p-r10 font-weigth-bold f-s p10" :indeterminate="indeterminate" v-model="checkAll" @change="checkBoxAll">全选</el-checkbox>
			<page-editor :all-visabled="true" :cols="1" :layout="layout" :btn="null" :add="true" :readonly='false'>
				<template slot="before" slot-scope="row">
					<el-checkbox v-model="layout[row.data.index].use" @change="check" class="p4"></el-checkbox>
				</template>
			</page-editor>
		</div>
	</div>
</template>

<script>
	export default {
		props: {
			addHeight: {
				type: Number,
				default: -200
			},
			title: {
				type: String,
				default: ''
			},
			columns: {
				type: Array,
				default: () => {
					return [];
				}
			},
			layoutType: {
				type: [String, Number], //布局类型 1 show展示布局 2 where 条件布局 3 editor编辑布局
				default: '1',
			},

		},
		watch: {
			columns(news) {
				this.layout = news;
			},
		},
		data() {
			return {
				checkAll: true,
				layout: this.columns,
				indeterminate: false,
			}
		},
		methods: {
			//显示布局
			checkBoxAll(val) {
				let temp = this.layout;
				this.layout = null;
				if (!temp || temp.length <= 0) {
					return;
				}
				temp.forEach(item => {
					item.use = val;
				});
				this.$nextTick(() => {
					this.layout = temp;
				})

				this.indeterminate = false;
				this.emits();
			},


			//单选
			check() {
				let layout = this.layout;
				if (!layout || layout.length <= 0) {
					return;
				}
				let length = layout.filter(layout => layout.use).length;
				this.checkAll = layout.length == length;
				this.indeterminate = length > 0 && length < layout.length;

				this.emits();

			},

			emits() {
				let layout = this.layout;
				if (!layout || layout.length <= 0) {
					return;
				}
				let data = layout.filter(item => !item.use);
				let _data = {};
				data.map(r => {
					_data[r.prop] = {
						visabled: false
					}
				});
				this.$emit(
					this.layoutType == 1 ? "column" :
					this.layoutType == 2 ? "where" :
					this.layoutType == 3 ? 'editor' :
					'other', _data);
			},


		},
		created() {
			//初始化
			// this.tableCheckBoxAll(true);
			// this.editorCheckBoxAll(true);
			// this.whereCheckBoxAll(true);
		}
	}
</script>

<style>
	.table .layout {
		padding: 10px;
		border: 1px solid #EBEEF5;
		box-sizing: border-box;
	}

	.table .layout th {
		color: rgb(144, 147, 153);
		border-right: 1px solid #EBEEF5;
	}
</style>
