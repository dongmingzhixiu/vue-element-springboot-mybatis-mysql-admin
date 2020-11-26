<template>
	<div class="f-c" style="align-items: center;">
		<div class="c-i">{{query.msg}}<span class="c-p" style="cursor: pointer;" @click="reload">点击重试</span></div>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				query: {
					msg: '出现错误！',
					path: '/'
				}
			}
		},
		methods: {
			reload() {
				window.location.href = `#${this.query.path}`;
			}
		},
		created() {
			this.query = this.$router.currentRoute.query;
		}
	}
</script>

<style>
</style>
