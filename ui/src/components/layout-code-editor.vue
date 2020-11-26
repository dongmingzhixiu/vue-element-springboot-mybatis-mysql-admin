<template>
  <div class="f-s box-b over-h-y b-f" style="height: calc(100vh - 10px);">
    <div class="flex-no-chang-width box-b" style="min-width: 400px;width: 30%;height: 100%;">
      <el-alert v-if="alert" center title="注意,javascript语句必须使用 ; (英文分号)结尾,不然会出现未知错误!" type="error" @close="alert=!alert"></el-alert>
      <div class="over-h-x over-h-y" style="height:calc(100% - 40px) ;">
        <!-- {{content}} -->
        <codemerror-editor ref="codeEditor" type="javascript" :text="content" @code="setCodeToContent">
          <template slot="btn">
            <list-where :layout="layout" :form="listWherForm">
              <template slot="toolsBtn" slot-scope="row">
                <!-- {{setLayoutType(row.data)}} -->
              </template>
            </list-where>
            <div class="f-e">
              <el-button type="primary" class="m-r10" style="border: 0;" plain @click="formatCode">格式化</el-button>
              <el-button v-if="layoutType" type="primary" style="border: 0;" @click="runCode">运行</el-button>
            </div>
          </template>
        </codemerror-editor>
      </div>
    </div>
    <div style="height: 100%;" class="box-b w over-h-y box-shadow m-l2 b-i1">
      <el-tabs v-model="activeName" type="card" style="width: 100%;height: 100%;">
        <el-tab-pane label="预览布局" name="first" style="height: 100%;">
          <template v-if="!codeError" v-for="(item,i) in tabs">
            <div v-if="item.layoutType==layoutType" class="tip-p b-p1" style="margin-top: -2px;" :key="item.label">{{item.label}}</div>
            <div v-if="item.layoutType==layoutType&&item.layout=='page-helper'" class="h over-a-y" :key="i">
              <div v-if="layoutData&&layoutData.length>0" class="m2 ">
                <el-button class="f-s" @click="addTestData">添加一行模拟数据</el-button>
                <div class="f-s-w" style="max-height: 100px;overflow-y: auto;">
                  <template v-for="(layout,l) in layoutData">
                    <el-input clearable v-model="layoutForm[layout.prop]" :label="layout.label" :placeholder="layout.prop"
                      :style="{'width':layout.width?layout.width:'150px'}" :key="l"></el-input>
                  </template>
                </div>
              </div>
              <page-helper :add-height="-280" :columns="layoutData" :list="testList"></page-helper>
            </div>
            <div v-if="item.layoutType==layoutType&&item.layout=='list-where'" class="h over-a-y" :key="i">
              <list-where row-class="f-s-w" :add-height="-160" :layout="layoutData">
              </list-where>
            </div>
            <div v-if="item.layoutType==layoutType&&item.layout=='page-editor'" :key="i" class="h over-a-y" style="height: calc(100vh - 140px);">
              <div class="f-s p-l10">
                <el-button class="m-t10" :plain="editorCol!=j" size="mini" :type="editorCol==j?'danger':''" @click="editorCol=j"
                  v-for="j in 4" :key="j">{{j}}列</el-button>
              </div>
              <page-editor :cols="editorCol" :layout="layoutData" :add="true" :readonly="false"></page-editor>
            </div>
          </template>
          <template v-else>
            <div class="w f-c align-items-center" style="height: 400px;">json有误，请检查后再试！</div>
          </template>
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
    name: 'layout-code-editor',
    props: {
      showOkButton: {
        type: Boolean,
        default: true,
      },
      layoutCode: {
        type: String,
        default: '',
      },
      type: {
        type: Number,
        default: 1,
      }
    },
    name: 'code-editors',
    watch: {
      layoutCode(news) {
        this.content = `let layout=${news?news:[]}`;
      },
      type(news) {
        this.layoutType = news + "";
      },
      // listWherForm(news) {
      //   this.testList = [];
      // },
      listWherForm: { //深度监听，可监听到对象、数组的变化
        handler(val, oldVal) {
          this.layoutType = this.listWherForm.layoutType;
        },
        deep: true
      }
    },
    data() {
      return {
        listWherForm: {
          'layoutType': this.type + ""
        },
        testList: [],
        alert: true,
        editorCol: 1,
        layoutType: this.type + "",
        codeError: false,
        activeName: 'first',
        layoutData: [],
        layoutForm: {},
        content: `let layout=${this.layoutCode?this.layoutCode:[]}`,
        helperContent: '',
        form: {},
        layout: [{
          prop: "layoutType",
          label: "布局类型",
          type: 'select',
          value: [{
              label: '查询布局',
              value: '2'
            },
            {
              label: '显示布局',
              value: '1'
            },
            {
              label: '编辑布局',
              value: '3'
            }
          ]
        }],
        tabs: [{
            layoutType: '1',
            layout: 'page-helper',
            label: '显示布局',
          },
          {
            layoutType: '2',
            layout: 'list-where',
            label: '条件布局'
          },
          {
            layoutType: '3',
            layout: 'page-editor',
            label: '编辑布局'
          }
        ]
      }
    },
    methods: {
      formatCode() {
        this.$refs.codeEditor.formatCode();
      },
      runCode() {
        this.$refs.codeEditor.runCode();
      },
      // setLayoutType(data) {
      // 	this.layoutType = data.layoutType;
      // 	this.testList = [];
      // 	return "";
      // },
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
