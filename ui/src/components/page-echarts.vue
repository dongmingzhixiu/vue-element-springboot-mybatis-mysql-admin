<template>
	<div style="width: 100%;height: 100%;" :style="style" :class="clzss">
		<div class="box-b f-s-w" style="width: 100%;height: 100%;">
			<div v-for="(item,i) in list" :key='i' style="flex-grow:2;height: 100%;padding-bottom: 30px;">
				<list-where v-if="item.layoutWhere" :layout="item.layoutWhere" :form="item.methodParam" @where="getEchartsDataSet(item,$event)">
				</list-where>
				<div class="m-t10" :id="item.id" style="width: 100%;height: 100%;flex-grow:2;" :style="item.style" :clzss="item.clzss"></div>
			</div>
		</div>
	</div>
</template>

<script>
	let echarts = require('echarts');
	export default {
		name: 'page-echarts',
		props: {
			layout: {
				type: Array,
				default: () => {
					return []
					/** [{
						clzss: {},
						style: {
							width: '400px',
							height: '400px'
						},
						layoutWhere: [{
							prop: 'day',
							type: 'date',
							label: '查询日期',
							format: 'yyyy-MM-dd'
						}],
						methodParam: {
							day: '2020-10-17'
						},
						methodName: 'getDayPayCount',
						methodType: 'GET',
						id: 'main',
						option: {
							legend: {},
							tooltip: {},
							dataset: {},
							// 声明一个 X 轴，类目轴（category）。默认情况下，类目轴对应到 dataset 第一列。
							xAxis: {
								type: 'category'
							},
							// 声明一个 Y 轴，数值轴。
							yAxis: {},
							// 声明多个 bar 系列，默认情况下，每个系列会自动对应到 dataset 的每一列。
							series: [{
								type: 'bar',
								itemStyle: {
									normal: {
										color: function(params) {
											//注意，如果颜色太少的话，后面颜色不会自动循环，最好多定义几个颜色
											var colorList = ['#61a0a8', '#c23531', '#2f4554', '#d48265', '#91c7ae', '#749f83', '#ca8622'];
											return colorList[params.dataIndex]
										}
									}
								}
							}]
							
						}
					}]*/
				}
			}
		},
		watch: {
			layout(news) {
				this.list = news;
				this.initCharts();
			}
		},
		data() {
			return {
				clzss: {},
				style: {},
				list: this.layout,
				isFirst: true,
			}
		},
		methods: {
			setEchart(item, myChart) {
				myChart.showLoading();
				//计算函数值
				item.option.series.forEach(opt => {
					if (opt.data && typeof opt.data == 'function') {
						opt.data = opt.data(that);
					}
					return opt;
				});
				//计算函数值
				if (item.option.dataset && typeof item.option.dataset == 'function') {
					item.option.dataset = item.option.dataset(that);
				}
				myChart.hideLoading();
				myChart.setOption(item.option);
			},
			getEchartsDataSet(item, form) {
				let myChart = echarts.init(document.getElementById(item.id));
				let i = this.list.indexOf(item);
				//设置参数
				item.methodParam = !form || Object.keys(form).length <= 0 ? item.methodParam : form;
				//转换参数
				Object.keys(item.methodParam).forEach(key => {
					item.methodParam[key] = this.dataToString(item.methodParam[key])
				});
				myChart.showLoading();
				//查询数据
				this.$api.getChartData(item.methodName, item.methodType, item.methodParam).then(res => {
					if (res.code == 0) {
						let dimensions = [];
						if (res.data.length > 0) {
							Object.keys(res.data[0]).forEach(item => {
								dimensions[dimensions.length] = item;
							});
						}
						let dataSet = {
							dimensions: dimensions,
							source: res.data
						};
						this.$set(this.list[i]['option'], 'dataset', dataSet);
						this.setEchart(this.list[i], myChart);
						myChart.hideLoading();
					}
				});
			},
			getDataSet() {
				for (let i = 0; i < this.list.length; i++) {
					let item = this.list[i];
					this.getEchartsDataSet(item, item.methodParam);
				}
			},
			dataToString(val) {
				if (val instanceof Date) {
					return this.$util.getNowD(0, val);
				}
				return val;
			},
			initCharts() {
				if (this.isFirst) {
					setTimeout(() => {
						this.getDataSet();
						this.isFirst = false;
					}, 500);
				} else {
					this.getDataSet();
				}
			}
		},
		created() {
			this.initCharts();
		}
	}
</script>

<style>
</style>
