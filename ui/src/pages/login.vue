<template>
	<!-- 首页登录 -->
	<div class="f-c b-i1" style="align-items: center;">
		<el-card class="b-f p-t10" style="width: 500px;">
			<div class="fs24 color8 m-t10">收费管理系统</div>
			<div class="m-t10 m-r10">
				<el-row v-loading="loading">
					<page-editor :col="1" v-if="reload" :use-default-submit="false" :layout="layout" :readonly="false"
					 :btn="{save:'登录',close:'重置'}" @save="login" @close="onClose">
						<template slot="btnBefore">
							<div class="f-e fs m-b10" style="margin-right: 40px;">
								<el-checkbox v-model="checked">记住密码</el-checkbox>
							</div>
						</template>
					</page-editor>
				</el-row>
			</div>
		</el-card>
	</div>
</template>

<script>
	export default {
		name: 'login',
		data() {
			return {
				loading: false,
				reload: true,
				checked: true,
				layout: [{
						prop: 'phone',
						label: '电话号码',
						msg: '电话必须以1开头的11位数字',
						type: 'text',
						require: true,
						regex: '/^1[0-9]{10}$/'
					},
					{
						prop: 'password',
						label: '用户密码',
						msg: '密码为6-12字符(不包含特殊符号\',.\"[])',
						regex: '/^.{6,12}$/',
						require: true,
						type: 'text',
						password: true,
					},

				]
			}
		},
		methods: {
			login(e) {
				this.$cookie.clear();
				this.$userInfo.clear();
				this.$api.login(e).then(res => {
					debugger
					if (res.code == 0) {
						//跳转到首页
						//保存身份信息到userInfo
						this.$userInfo.set(res.data);
						this.$userInfo.set("token", res.token);
						if (this.checked) {
							this.$cookie.set(this.$userInfo.get(), 7);
						} else {
							this.$cookie.clear();
							this.$userInfo.clear();
						}
						window.location.href = "#/";
						return;
					}
					this.$message.error(res.msg);
				})
			},
			onClose(e) {
				this.reload = false;
				this.$nextTick(() => {
					this.reload = true;
				})
			},

			getCookieLogin() {
				let u = this.$cookie.get();
				if (!u) {
					return;
				}
				this.loading = true;
				this.login(u);
			}
		},
		created() {
			this.getCookieLogin();
		}
	}
</script>

<style>
</style>
