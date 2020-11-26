<template>
	<div>
		<div class="flex-s" style="line-height: 40px;" :class="rowClass">
			<slot v-if="$slots.after" name="before"></slot>
			<div v-if="item.visabled==undefined||item.visabled==true" v-for="(item,i) in wlayout" :key="i" class="flex-s" :class="columnClass" :style="rowCss">
				<slot name="before" :data="{row:item,form:form,index:i}"></slot>
				<div class="padding-left10 padding-right6 flex-no-chang-width">{{item.label}}:</div>
				<div v-if="item.type=='text'">
					<el-input type="text" v-model="wdata[item['prop']]" clearable :placeholder="item.placeholder||item.label"></el-input>
				</div>
				<div v-if="item.type=='select'">
					<el-select popper-class="select-option" clearable v-model="wdata[item['prop']]" placeholder="请选择">
						<el-option v-for="it in item['value']" :key="it.value" :label="it.label" :value="it.value">
						</el-option>
					</el-select>
				</div>
				<slot name="after" :data="{row:item,form:form,index:i}"></slot>
			</div>
			<div v-if="$slots.toolsBtn" class="btn p-l10">
				<el-button type="primary">搜索</el-button>
			</div>
			<div class="flex-s p-l5" v-else>
				<slot name="toolsBtn" :data="form"></slot>
			</div>
			<slot v-if="$slots.after" name="after"> </slot>
		</div>
	</div>
</template>

<script>
	export default {
		props: {
      columnClass:{
        type: String,
        default: ''
      },
			allVisabled: {
				tyep: Boolean,
				default: false
			},
			rowClass: {
				type: String,
				default: ''
			},
			rowCss: {
				type: Object,
				default: () => {
					return {}
				}
			},
			layout: {
				type: Array,
				default: () => {
					return [];
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
			form(news) {
				this.wdata = news;
			},
			layout(news) {
				this.wlayout=news;
			}
		},
		data() {
			return {
				wdata: {},
				wlayout: this.layout,
			}
		},
		methods: {
			getWhere() {
				this.$emit("where", this.form)
			},
			setVisabledAll(e) {
				if (this.allVisabled) {
					let temp = this.wlayout;
					this.wlayout = [];
					for (let i = 0; i < temp.length; i++) {
						temp[i].visabled = true;
					}
					this.$nextTick(() => {
						this.wlayout = temp;
					});
				}
			}
		},
		created() {
			this.wdata = this.form;
			this.setVisabledAll(true);
		}
	}
</script>

<style>
</style>
