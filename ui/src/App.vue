<template>
	<div id="app">
		<transition :name="transitionName">
			<router-view class="router-view"></router-view>
		</transition>
	</div>
</template>

<script>
	export default {
		name: 'App',
		data() {
			return {
				transitionName: 'vux-pop-in', //初始过渡动画方向
			}
		},
		watch: {
			$route(to, from) {
				var isBack=this.$router.isBack;
				//console.log(isBack);
				if(isBack){
					this.transitionName = 'vux-pop-in';
				} else {
					this.transitionName = 'vux-pop-out';
				}
				this.$router.isBack=false;
			}
		},
	}
</script>

<style>
	@import url("../static/theme.css");
	@import url("../static/base.css");
	@import url("../static/syscss.css");

	#app {
		font-family: 'Avenir', Helvetica, Arial, sans-serif;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
		text-align: center;
		color: #2c3e50;
	}

	.router-view {
		width: 100%;
		position: absolute;
		-webkit-transition: all .3s cubic-bezier(.55, 0, .1, 1);
		-moz-transition: all .3s cubic-bezier(.55, 0, .1, 1);
		-ms-transition: all .3s cubic-bezier(.55, 0, .1, 1);
		-o-transition: all .3s cubic-bezier(.55, 0, .1, 1);
		transition: all .3s cubic-bezier(.55, 0, .1, 1);
		height: 100%;
	}

	.o-footer {
		position: fixed;
		bottom: 0;
	}
	
	.el-message-box {
	    width: auto!important;
	}
	
	.soujin{
		padding-left: 20px;
	}
	body .el-table th.gutter {
		display: table-cell !important;
	}

	body .el-table colgroup.gutter {
		display: table-cell !important;
	}
</style>
