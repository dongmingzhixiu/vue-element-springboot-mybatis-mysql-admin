<template>
  <div class="box-b p10 over-h">
    <el-row v-loading="loading">
      <div class="f-b w">
        <div class="w">
          <list-where :layout="where" :form="wdata">
            <template slot="toolsBtn" slot-scope="form">
              <el-button v-if="item.menuType==2" v-for="(item,i) in buttons" :key="i" :type="item.type" :style="item.css"
                :icon="item.icon" @click="btnClick(form,item.methodParam)">{{item.title}}
              </el-button>
            </template>
          </list-where>
          <el-card class="box-b m-t10" shadow="hover">
            <page-helper :change-list="menuChangeList" ref="pageHelper" :add-height="-220" :api-name="apiName"
              :api-data="apiData" :is-init-data="true" :columns="columns" :tools="tools">
              <template slot="tools-btn" slot-scope="row">
                <el-button v-if="item.menuType==1&&((item.name!='menu-enabled'&&item.name!='menu-disabled')||(row.data.enabled==false&&item.name=='menu-enabled')||(row.data.enabled==true&&item.name=='menu-disabled'))"
                  v-for="(item,i) in buttons" :key="i" :type="item.type" :style="item.css" :icon="item.icon" @click="btnClick(row.data,item.methodParam)">{{item.title}}
                </el-button>
              </template>
            </page-helper>
          </el-card>
        </div>
        <div class="flex-no-chang-width" style="flex-shrink: 0;min-width:400px;width: 400px;height: calc(100vh - 121px);margin-top: -21px;">
          <div type="card" class="w" style="height: 100%;">
            <div v-if="selectRow&&Object.keys(selectRow).length>0" class="w box-b p-t2" style="height: 100%;">
              <div class="font-size20 tip-d b-d1">(<span class="c-d">{{`${selectRow['title']}`}}</span>)设置</div>
              <el-tabs v-if="buttons&&buttons.filter(btn=>btn.menuType==7||btn.menuType==8).length>0" type="border-card"
                v-model="rightActive" class="w box-b" style="padding: 0; height: calc(100% - 44px);">
                <el-tab-pane v-if="buttons&&buttons.filter(btn=>btn.menuType==8).length>0" label="按钮设置" name="tab-first"
                  class="box-b" style="padding: 0;height: calc(100% - 44px);">
                  <el-tabs v-model="active" style="padding: 0;margin-top: -10px;padding-left: 10px;box-sizing: border-box;height: calc(100vh - 220px);">
                    <el-tab-pane label="已设置按钮" name="first" style="padding: 0;overflow-y: auto;height: calc(100vh - 280px);">
                      <div class="f-s" style="flex-wrap: wrap;">
                        <template v-for="(item,i) in  buttonList">
                          <el-button class="m4 f-c" :type="item.type" :style="item.css" :size="item.size" :key="i"
                            :icon="item.icon">
                            <div class="f-b" style="align-items: center;">
                              {{item.title}}
                              <i class="el-icon-edit p-l5 fs16 r" @click="btnClick(item,'buttonEditor')"></i>
                              <i class="el-icon-close p-l2 fs16 r" @click="btnClick(item,'buttonDelete')"></i>
                            </div>
                          </el-button>
                        </template>
                      </div>
                    </el-tab-pane>
                    <el-tab-pane :label="buttonQueryId?'编辑按钮':'新增按钮'" name="second" style="padding: 0;overflow-y: auto;height: calc(100vh - 280px);">
                      <page-editor style="margin-left: -10px;" :change-form="buttonChangeForm" :btn="{'save':'保存按钮',close:'取消'}"
                        :layout="buttonLayout" :method="buttonMethod" :add="buttonAdd" :query-id="buttonQueryId"
                        :readonly='buttonReadonly' @save="buttonSubmit" @save-before="buttonSaveBefore" @close-tab="buttonCancel"></page-editor>
                    </el-tab-pane>
                  </el-tabs>
                </el-tab-pane>
                <el-tab-pane v-if="buttons&&buttons.filter(btn=>btn.menuType==7).length>0" label="布局设置" name="tab-second"
                  class="box-b" style="padding: 0;height: calc(100% - 44px);">
                  <el-tabs v-model="active" style="padding: 0;margin-top: -10px;padding-left: 10px;box-sizing: border-box;height: calc(100vh - 220px);">
                    <el-tab-pane v-for="(tab,t) in documentTabs" :key="t" :label="tab.label" :name="tab.name" style="padding: 0;overflow-y: auto;height: calc(100vh - 280px);">
                      <template v-if="!layoutList">
                        <div class="f-c color8" style="align-items: center;height: 400px;">
                          没有找到相关数据
                        </div>
                      </template>
                      <template v-if="item.layoutType==tab.type" v-for="(item,i) in  layoutList">
                        <div class="f-c" v-if="getLayoutJson(item.layoutJson) ==null" :key="i" style="align-items: center;height: 400px;">
                          布局内容转换出错（布局内容为空或者布局内容不是json格式数据）
                        </div>
                        <template v-if="getLayoutJson(item.layoutJson) ==null">
                          <el-button plain type="primary" :key="i" @click="btnClick(item,'layoutEditor')">修改</el-button>
                        </template>
                        <div :key="i" v-else style="zoom: 0.75;">
                          <template v-if="tab.template=='page-helper'">
                            <div v-if="item.remake" class="f-c tip-w b-w1 m-b5">{{item.remake}}</div>
                            <page-helper height="220px" :columns="getLayoutJson(item.layoutJson)"> </page-helper>
                            <el-button plain type="primary" @click="btnClick(item,'layoutEditor')">修改</el-button>
                          </template>
                          <template v-if="tab.template=='list-where'">
                            <div v-if="item.remake" class="f-c tip-w b-w1 m-b5">{{item.remake}}</div>
                            <list-where :key="i" :layout="getLayoutJson(item.layoutJson)"></list-where>
                            <el-button class="m-t5" plain type="primary" @click="btnClick(item,'layoutEditor')">修改</el-button>
                          </template>
                          <template v-if="tab.template=='page-editor'">
                            <div v-if="item.remake" class="f-c tip-w b-w1">{{item.remake}}</div>
                            <page-editor :readonly="false" :add="true" :key="i" style="width: 100%;margin-left: -40px;"
                              :btn="null" :layout="getLayoutJson(item.layoutJson)">
                              <template slot="tools-btn">
                                <el-button plain type="primary" @click="btnClick(item,'layoutEditor')">修改</el-button>
                              </template>
                            </page-editor>
                          </template>

                        </div>
                      </template>
                    </el-tab-pane>

                    <el-tab-pane v-if="documentLayout&&documentLayout.length>0" :label="documentAdd?'添加布局':'修改布局'" name="settingLayout"
                      style="overflow-y: auto;height: calc(100vh - 280px);">
                      <page-editor :form="{layoutJson:codeEditorJson}" style="width: 100%;margin-left: -40px;"
                        :change-form="documentChangeForm" :btn="{'save':'保存布局',close:'取消'}" :layout="documentLayout"
                        :method="documentMethod" :add="documentAdd" :query-id="documentQueryId" :readonly='documentReadonly'
                        @save="documentSubmit" @save-before="documentSaveBefore" @close-tab="documentCancel">
                        <template slot="textarea-append" slot-scope="row">
                          <el-button v-if="row.row.prop=='layoutJson'" @click="openCodeEidtor(row.form)" type="danger"
                            size="mini" plain>调试布局</el-button>
                        </template>
                      </page-editor>
                      <layout-code-editor v-if="showCodeEditor" :show-ok-button="true" :layout-code='codeEditorJson'
                        class="w" :type="1" style="position: fixed;left :0;right: 0;top: 0;z-index: 9999;" @code="getCodeEditor"
                        @close="showCodeEditor=!showCodeEditor"></layout-code-editor>
                    </el-tab-pane>

                  </el-tabs>
                </el-tab-pane>
              </el-tabs>
              <div v-else>
                <div class="f-c color8" style="align-items: center;height: 400px;">
                  没有操作权限！
                </div>
              </div>
            </div>
            <el-card v-else class="f-c w" style="height: 100%;align-items: center;">
              <div class="color8 font-size18">
                点击左侧 <span class="c-d">设置</span> 按钮进行菜单设置!
              </div>
            </el-card>
          </div>

        </div>
      </div>
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
      rightActive(news) {
        if (news == 'tab-second') {
          this.active = "document";
          this.getLayoutList();
        } else {
          this.active = "first";
          this.getButtonList();
        }
      },
      rouleJson(news) {
        this.setLayoutInfo();
      }

    },
    data() {
      return {
        method: null,
        apiName: '',
        wdata: {
          merchantId: '',
          merchantNo: ''
        },
        apiData: {},
        columns: [],
        buttons: [],
        tools: [{
          fixed: "right",
          label: '操作',
          width: "240",
        }],
        where: [],
        addUid: this.$util.uuid(),
        loading: false,
        editorPath: 'trust-merchant-editor',

        selectRow: null,

        //-------------------------------------------
        //右侧功能菜单
        //-------------------------------------------
        buttonList: [],
        layoutList: [],
        rightActive: 'tab-first',
        active: 'first',

        //+++++++++++
        // button属性
        //+++++++++++
        buttonReadonly: false,
        buttonQueryId: '',
        buttonAdd: true,
        buttonMethod: {},
        //{
        // add: 'addSysButton',
        // upd: 'updSysButton',
        // byId: 'getSysButtonById'
        // },
        buttonLayout: [],

        //+++++++++++
        // 布局属性
        // ++++++++++
        documentTabs: [{
            label: '页面布局',
            name: 'document',
            type: 1,
            template: 'page-helper',

          },
          {
            label: '条件布局',
            name: 'where',
            type: 2,
            template: 'list-where',
          },
          {
            label: '编辑布局',
            name: 'editor',
            type: 3,
            template: 'page-editor',
          },
        ],
        documentMethod: {
          add: 'addSysLayout',
          upd: 'updSysLayout',
          byId: 'getSysLayoutById'
        },
        documentReadonly: false,
        documentQueryId: null,
        documentAdd: true,
        documentLayout: [],

        codeEditorJson: null,
        showCodeEditor: false,
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
        debugger
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
      //----------------------------------
      //点击菜单操作
      //----------------------------------
      /**
       * 修改菜单展示的数据格式
       */
      menuChangeList(list) {
        let array = list.filter(r => !r.parentId || r.parentId == '0' || r.parentId == 'null');
        array.map(r => {
          r.children = list.filter(f => f.parentId == r.id);
        });
        return array;
      },

      /**
       * 添加菜单
       * @param {Object} e
       * @param {Object} type
       */
      menuAdd(e, type) {
        let _query = {
          add: true,
          readonly: false,
          setFormValue: {
            parentId: ''
          },
          setLayoutProperty: [{
            prop: 'src',
            require: false
          }],
        };
        this.addTab(_query, type, "添加");
      },

      /**
       * 添加菜单
       * @param {Object} e
       * @param {Object} type
       */
      menuEditor(e, type) {
        let _query = {
          add: false,
          readonly: false,
          id: e.id,
          setLayoutProperty: [{
            prop: 'src',
            require: false
          }],
        };
        this.addTab(_query, type, "编辑");
      },
      /**
       * 添加子菜单
       * @param {Object} e
       * @param {Object} type
       */
      menuChildAdd(e, type) {
        let _query = {
          add: true,
          readonly: false,
          setFormValue: {
            parentId: e.id
          },
          setLayoutProperty: [{
            prop: 'src',
            require: true
          }]
        };
        this.addTab(_query, type, "添加");
      },
      /**
       * 禁用启用菜单
       * @param {Object} id
       * @param {Object} isEnabled
       */
      menuEnabled(id, isEnabled) {
        let msg = `确定${isEnabled?'启用':'禁用'}该菜单，这将会${isEnabled?'启用':'禁用'}和它关联的子菜单!`;
        this.$confirmDialog(msg, () => {
          this.$api.enabledSysMenu({
            id: id,
            enabled: isEnabled ? 1 : 0
          }).then(res => {
            if (res.code == 0) {
              this.getWhere(this.wdata);
              return;
            }
            this.$mesage.error(res.msg);
          });
        }, 'danger');
      },
      /**
       * 菜单设置事件
       */
      menuSetting(row) {
        this.selectRow = row;
        this.buttonQueryId = null;
        this.buttonAdd = true;
        //查询关联的按钮
        this.getButtonList();
        this.getLayoutList();
      },

      //---------------------------------------------------------
      // 按钮事件
      //---------------------------------------------------------
      /**
       * 获取所属按钮
       */
      getButtonList() {
        this.$api['getAllSysButton']({
          menuId: this.selectRow.id
        }).then(res => {
          this.buttonList = null;
          if (res.code == 0) {
            this.buttonList = res.data;
          }
        });
      },
      /**
       * 修改编辑属性值
       */
      buttonChangeForm(form) {
        form["menuId"] = this.selectRow.id;
        if (this.buttonAdd) {
          form["id"] = '';
        }
        return form;
      },
      //取消事件
      buttonCancel() {},
      //保存之前事件
      buttonSaveBefore() {},
      //保存之后事件
      buttonSubmit() {
        //刷新页面数据
        this.getButtonList();
        this.buttonAdd = true;
        this.buttonQueryId = null;
      },
      //按钮编辑
      buttonEditor(row) {
        this.buttonQueryId = null;
        this.buttonAdd = false;
        this.$nextTick(() => {
          this.buttonQueryId = row.id;
          this.active = 'second';
        })
      },
      //按钮删除
      buttonDelete(row) {
        this.$confirmDialog('确定删除该按钮吗?', () => {
          this.$api.delSysButton(row.id).then(res => {
            if (res.code == 0) {
              this.$message({
                type: 'success',
                message: '删除成功!'
              });
              this.getButtonList();
            }
          });
        });
      },

      //---------------------------------------------------------
      // 布局事件
      //---------------------------------------------------------
      /**
       * 获取所属布局
       */
      getLayoutList() {
        this.$api['getAllSysLayout']({
          menuId: this.selectRow.id,
          layoutType: '',
        }).then(res => {
          this.layoutList = null;
          if (res.code == 0) {
            this.layoutList = res.data;
          }
        });
      },
      /**
       * 根据布局获取json
       * @param {Object} json
       */
      getLayoutJson(json) {
        try {
          return eval("(" + json + ")");
        } catch (e) {
          return null;
        }
      },
      /**
       * 编辑布局
       */
      layoutEditor(row) {
        this.active = "settingLayout";
        this.documentAdd = false;
        this.documentQueryId = row.id;
      },

      //修改布局表单数据
      documentChangeForm(form) {
        form["menuId"] = this.selectRow.id;
        try {
          form['layoutJson'] = this.codeEditorJson || form['layoutJson'];
          form['layoutJson'] = form['layoutJson'].replace(/that[.]/g, 'this.');
        } catch (e) {
          //TODO handle the exception
        }
        if (this.documentAdd) {
          form["id"] = '';
        }
        return form;
      },
      //保存之后事件
      documentSubmit() {
        this.getLayoutList();
        this.documentAdd = true;
        this.documentQueryId = null;
      },
      //保存之前事件
      documentSaveBefore() {},
      //保存取消
      documentCancel() {},

      /**
       * 按钮点击事件
       * @param {Object} e 参数
       * @param {Object} type 类型，根据不同类型，趋势线不同的写法
       */
      btnClick(e, type) {
        switch (type) {
          case "menuSearch":
            this.getWhere();
            break;
          case "menuAdd":
            this.menuAdd(e, type);
            break;
          case "menuEditor":
            debugger
            this.menuEditor(e, type);
            break;
          case "menuChildAdd":
            this.menuChildAdd(e, type);
            break;
          case "menuDisabled":
            this.menuEnabled(e.id, false);
            break;
          case "menuEnabled":
            this.menuEnabled(e.id, true);
            break;
          case "menuSetting":
            this.menuSetting(e);
            break;

            //按钮
          case "buttonEditor":
            this.buttonEditor(e);
            break;
          case "buttonDelete":
            this.buttonDelete(e);
            break;

            //编辑布局
          case "layoutEditor":
            this.layoutEditor(e);
            break;

          default:
            break;
        }
      },
      /**
       * 条件查询语句
       */
      getWhere() {
        this.loading = true;
        Object.keys(this.wdata).map(k => {
          let v = this.wdata[k];
          this.$set(this.apiData, k, v ? v : '');
        });
        this.$refs.pageHelper.getPageData();
        setTimeout(() => {
          this.loading = false;
        }, 200);
      },
      /**
       * 调整table布局
       */
      changeTable() {
        this.$refs.pageHelper.doLayout();
      },
      /**
       * 获取布局数据
       */
      getLayout() {
        // let apiMap={
        // 	'menuLayout':'apiName',
        // 	'buttonLayout':'buttonMethod',
        // 	'documentLayout':'documentMethod'
        // };
        // let columnsMap={
        // 	'menuLayout':'columns',
        // 	'buttonLayout':'buttonLayout',
        // 	'documentLayout':'documentLayout',
        // };
        // let whereMap={
        // 	'menuLayout':'where'
        // };
        this.loading = true;
        this.$getLayout(this.query.id).then(res => {
          this.loading = false;


          // this.loading = false;
          // this.method = res.columns.method;
          // this.apiName = typeof this.method == 'string' ? this.method : this.method['list'];
          // this.where = res.where.layout;
          // this.columns = res.columns.layout;

          //单页面布局，只取第一个布局
          this.loading = false;
          this.method = res.columns[0].apiName;
          this.apiName = typeof this.method == 'string' ? this.method : this.method['list'];
          this.where = res.where[0].layoutJson;
          this.columns = res.columns[0].layoutJson;


          let button = res.editor.filter(f => f.code == 'buttonLayout');
          if (button.length > 0) {
            this.buttonLayout = button[0].layoutJson;
            this.buttonMethod = button[0].apiName;
          }
          let documents = res.editor.filter(f => f.code == 'documentLayout');
          if (documents.length > 0) {
            this.documentLayout = documents[0].layoutJson;
            this.documentMethod = documents[0].apiName;
          }

        });
      },

      /**
       * 获取按钮数据
       */
      getButtons() {
        this.$getLayoutButton(this.query.id).then(res => {
          this.loading = false;
          this.buttons = res;
        });

      },
      /**
       * 使用代码编辑器，编辑布局json
       */
      openCodeEidtor(form) {
        this.showCodeEditor = true;
        this.codeEditorJson = '';
        this.codeEditorJson = form.layoutJson.replace(/\n/g, ' ');
      },
      getCodeEditor(e) {
        this.showCodeEditor = false;
        let str = '[';
        let index = 0;
        e.forEach(item => {
          index++;
          str += "{"
          let len = 0;
          Object.keys(item).map(key => {
            if (typeof item[key] == 'function'||typeof item[key] == "number"||typeof item[key] == "boolean") {
              str += `${key}:${item[key]},`;
            } else if (typeof item[key] == 'string') {
              str += `${key}:'${item[key]}',`;
            } else if (typeof item[key] == 'object') {
              str += `${key}:${JSON.stringify(item[key])},`;
            }
          });
          str += `}${index==e.length?'':','}`;
        });
        str += ']';
        console.log(str);
        let json = str;
        // let json = JSON.stringify(e);
        json = json.replace(/:""/g, ':"').replace(/""[}]/g, '"}').replace(/"",/g, '",').replace(/""/g, '"')
        json = json.replace(/that[.]/g, 'this.');
        this.codeEditorJson = json.length > 2 ? json : '';
      }
    },
    created() {
      this.getLayout();
      this.getButtons();
    }
  }
</script>

<style>
</style>
