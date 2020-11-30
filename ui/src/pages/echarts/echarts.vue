<template>
	<div class="box-b p10 over-a-y" style="height: calc(100vh - 100px);">
		<el-row v-loading="loading">
			<page-echarts :layout="charts" style="height: auto;"></page-echarts>
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
		},
		data() {
			return {
				charts: [],
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
			/**
			 * 获取布局数据
			 */
			getLayout() {
				this.loading = true;
				this.$getLayout(this.query.id).then(res => {
					//单页面布局，只取第一个布局
					this.loading = false;
					this.charts = res.charts[0].layoutJson;
				});
			},
		},
		created() {
			this.getLayout();
		}
	}
</script>

<style>
</style>
