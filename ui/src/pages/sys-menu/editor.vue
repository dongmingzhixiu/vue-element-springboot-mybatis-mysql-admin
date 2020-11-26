<template>
	<div class="editor" :class="{'flex-c':cols==1}">
		<div style="height: calc(100vh - 160px);overflow-y: auto;" :style="{'width':cols==1?'880px':'auto'}">
			<page-editor :cols="cols" :layout="layout" :method="method" :add="add" :query="query" :query-id="queryId" :readonly='readonly'
			 @save="onSubmit" @closeTab="onCancel"></page-editor>
		</div>
	</div>
</template>

<script>
	export default {
		props: {
			query: {
				type: Object,
				default: () => {
					return {};
				}
			},
			tab: {
				type: Object,
				default: () => {
					return {};
				}
			},
			flush: {
				type: Boolean,
				default: false
			}
		},
		data() {
			return {
				add: false,
				readonly: true,
				targetId: '',
				prevId: '',
				form: {},
				loading: true,
				layout: [],
				queryId: '',
				method: null,
				cols: 1,
			}
		},
		methods: {
			/**
			 * 保存后 操作
			 * @param {Object} e
			 */
			onSubmit(e) {
				if (e.code == 0) {
					this.$emit("reflushTab", this.prevId)
					this.onCancel(e);
				}
			},
			/**
			 * 关闭按钮
			 * @param {Object} e
			 */
			onCancel() {
				this.$emit("reflushTab", this.prevId)
				this.$emit("removeTab", this.targetId)
			},
			/**
			 * 获取布局数据
			 */
			getLayout() {
				this.loading = true;
				this.$getLayout(this.prevId).then(res => {
					// this.loading = false;
					// this.layout = res.editor.layout;
					// this.method = res.editor.method;
					// this.cols = parseInt(res.editor.cols);
					
					this.loading = false;
					this.layout = res.editor[0].layoutJson;
					this.method = res.editor[0].apiName;
					this.cols = parseInt(res.editor[0].cols);
				});
			},
		},
		created() {
			/**
			 * 获取请求参数
			 */
			try {
				this.add = this.query.add;
				this.readonly = this.query.readonly;
				this.targetId = this.tab.id;
				this.prevId = this.tab.tagId;;
				this.getLayout();
				//获取数据
				try {
					this.queryId = this.query.id;
				} catch (e) {}

			} catch (e) {
				//TODO handle the exception
			}
			this.loading = false;
		}
	}
</script>

<style>
	.editor {
		padding: 20px;
		box-sizing: border-box;
	}

	.editor .el-select {
		width: 100% !important;
	}
</style>
