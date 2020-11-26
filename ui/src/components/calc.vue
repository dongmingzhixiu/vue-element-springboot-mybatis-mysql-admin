<template>
	<!-- 计算器 -->
	<div class="f-c p10 calc">
		<div class="p10 box-b fs24 b-i2" style="height: 250px;border: 1px solid #e6e6e6;width: 200px;text-align: right;">
			<div class="f-e-w fs18 color6" style=" word-wrap:break-word;height: 150px;">{{vals}}</div>
			<div style="height: 100px; word-wrap:break-word;height: 150px;">={{result}}</div>
		</div>
		<div style="width:200px">
			<div class="f-s w">
				<div class="btn" style="flex: 1 1 auto;" @click="vals=''">c</div>
				<div class="btn" style="flex: 1 1 auto;" @click="backVal">←</div>
				<div class="btn btn2 flex-no-chang-width" @click="input(' / ')">÷</div>
			</div>
			<div class="f-s">
				<div class="btn" @click="input('7')">7</div>
				<div class="btn" @click="input('8')">8</div>
				<div class="btn" @click="input('9')">9</div>
				<div class="btn btn2" @click="input(' * ')">×</div>
			</div>
			<div class="f-s">
				<div class="btn" @click="input('4')">4</div>
				<div class="btn" @click="input('5')">5</div>
				<div class="btn" @click="input('6')">6</div>
				<div class="btn btn2" @click="input(' + ')">＋</div>
			</div>
			<div class="f-s">
				<div class="btn" @click="input('1')">1</div>
				<div class="btn" @click="input('2')">2</div>
				<div class="btn" @click="input('3')">3</div>
				<div class="btn btn2" @click="input(' - ')">－</div>
			</div>
			<div class="f-s">
				<div class="btn" @click="input('0')">0</div>
				<div class="btn" @click="input('.')">.</div>
				<div class="btn btn2" style="flex:1 1 auto" @click="input(' = ')">=</div>
			</div>
		</div>
	</div>
</template>

<script>
	export default {
		props: {
			calcVal: {
				type: String,
				default: ''
			}
		},
		data() {
			return {
				vals: '',
				//上一个字符
				prevChar: '',
				//上一个单词
				prevTemp: '',
				//结果
				result: 0
			}
		},
		watch: {
			vals(news, old) {
				this.getData();
			},
			calcVal(news, old) {
				this.vals = this.calcVal;
			}
		},
		methods: {
			getData() {
				let _val = this.vals.replace(/\s/g, "");
				this.result = _val.length > 0 ? eval("(" + _val + ")") : '0';
				this.$emit("getCalc", this.result);
			},
			input(e) {
				var reg = /^[0-9]{0,}[.]?[0-9]*$/;
				if (this.vals.trim().length <= 0) {
					if (!reg.test(e)) {
						return;
					}
				}

				if (!this.vals && e.trim() == '=') {
					return;
				}
				if (e.trim() == '=') {
					this.getData();
					return;
				}
				if (this.prevChar.trim() == '-'&&(e.trim() == "+" ||e.trim() == "*" ||e.trim() == "/" ||e.trim() == "-" )) {
					return;
				}
				if ((e == this.prevChar && e.trim() == '=') || (e == this.prevChar && (e.trim() == "/" || e.trim() == "*" || e.trim() ==
						"="))) {
					if (e.trim() == "=") {
						this.getData();
					}
					return;
				}
				this.prevChar = e;
				this.vals += e;
				if (e == '.') {
					let t = this.vals.split(" ");
					//校验上一个单词，不能有多个.
					if (!reg.test(t[t.length - 1])) {
						this.vals = this.vals.substring(0, this.vals.length - 1);
					}
				}

			},
			backVal() {
				if (this.vals.length < 0) {
					return;
				}
				this.vals = this.vals.substring(0, this.vals.length - 1);
			}
		},
		created() {
			this.vals = this.calcVal;
		}
	}
</script>

<style>
	.calc .btn {
		display: flex;
		box-sizing: border-box;
		font-size: 24px;
		width: 50px;
		height: 50px;
		justify-content: center;
		align-items: center;
		border: 1px solid #e6e6e6;
		background: #F2F2F2;
	}

	.calc .btn2 {
		background: #d7e7ff;
	}

	.calc .btn:hover {
		background: #FFFFFF;
	}
</style>
