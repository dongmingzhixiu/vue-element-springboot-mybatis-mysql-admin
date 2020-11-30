<template>
	<div class="f-s box-b over-h-y b-f" style="height: calc(100vh - 10px);">
		<div class="flex-no-chang-width box-b" style="min-width: 400px;width: 30%;height: 100%;">
			<el-alert v-if="alert" center title="注意,javascript语句必须使用 ; (英文分号)结尾,不然会出现未知错误!" type="error" @close="alert=!alert"></el-alert>
			<div class="over-h-x over-h-y" style="height:calc(100% - 40px) ;">
				<!-- {{content}} -->
				<codemerror-editor ref="codeEditor" type="javascript" :text="content" @code="setCodeToContent">
					<template slot="btn">
						<div style="flex-grow:2;">&nbsp;</div>
						<div class="f-e">
							<el-button type="primary" class="m-r10" style="border: 0;" plain @click="formatCode">格式化</el-button>
							<el-button type="primary" style="border: 0;" @click="runCode">运行</el-button>
						</div>
					</template>
				</codemerror-editor>
			</div>
		</div>
		<div style="height: 100%;" class="box-b w over-h-y box-shadow m-l2 b-i1">
			<el-tabs v-model="activeName" type="card" style="width: 100%;height: 100%;">
				<el-tab-pane label="预览布局" name="first" style="height: 100%;">
					<page-echarts ref="echarts" :layout="layoutData"></page-echarts>
				</el-tab-pane>
				<el-tab-pane label="帮助文档" name="second" class="m-l10" style="height: 100vh;overflow-y: auto;">
					<codemerror-editor :readonly="true" type="markdown" :text="helperContent"></codemerror-editor>
				</el-tab-pane>
			</el-tabs>
			<div style="position: absolute;right: 0;top: 0;">
				<el-button type="danger" @click="okButton">确定</el-button>
				<el-button @click="closeBtn">关闭</el-button>
			</div>
		</div>
	</div>
</template>

<script>
	export default {
		name: 'echarts-code-editor',
		props: {
			showOkButton: {
				type: Boolean,
				default: true,
			},
			layoutCode: {
				type: String,
				default: '',
			},
		},
		name: 'code-editors',
		watch: {
			layoutCode(news) {
				this.content = `let layout=${!news?[]:news}`;
			},
		},
		data() {
			return {
				testList: [],
				alert: true,
				editorCol: 1,
				codeError: false,
				activeName: 'first',
				layoutData: [],
				layoutForm: {},
				content: `let layout=${!this.layoutCode?[]:this.layoutCode}`,
				helperContent: '',
				form: {},
			}
		},
		methods: {
			formatCode() {
				this.$refs.codeEditor.formatCode();
			},
			runCode() {
				this.$refs.codeEditor.runCode();
				this.$refs.echarts.initCharts();
			},
			setCodeToContent(code) {
				try {
					this.layoutData = code;
					this.codeError = false;
				} catch (e) {
					//TODO handle the exception
					this.codeError = true;
				}

			},
			addTestData() {
				let notEmpty = Object.keys(this.layoutForm).filter(key => this.layoutForm[key]);
				if (notEmpty.length <= 0) {
					this.$message.error("模拟数据不能都为空！");
					return;
				}
				let row = JSON.parse(JSON.stringify(this.layoutForm));
				this.$set(this.testList, this.testList.length, row);
			},
			getTestLayouDataRow() {
				let data = {};

			},
			/**
			 * 获取帮助文档
			 */
			getHelperMd() {
				this.$api.getFileContext({
					fileName: 'LWE.HELPER.md'
				}).then(res => {
					if (res.code == 0) {
						this.helperContent = res.data;
						return;
					}
					this.helperContent = "### 暂未找到相关内容";
				});
			},
			okButton() {
				debugger
			  this.$emit("code", this.layoutData);
			},
			closeBtn() {
			  this.$emit("close", this.layoutData);
			}
		},
		created() {
			this.getHelperMd();
		}
	}
</script>

<style>
	.select-option,
	.select-option .el-scrollbar {
		z-index: 9999999 !important;
	}
</style>
