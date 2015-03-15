<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
      <title></title>
      <link rel="stylesheet" type="text/css" href="../../script/extjs/resources/css/ext-all.css"/>
      <link rel="stylesheet" type="text/css" href="../../script/extjs/resources/css/example.css"/>
      <script type="text/javascript" src="script/extjs/bootstrap.js"></script>
      <script type="text/javascript" src="script/extjs/locale/ext-lang-zh_CN.js"></script>
      <script type="text/javascript" src="script/extjs/examples.js"></script>
      <script type="text/javascript">


        Ext.define("User", {
            extend : "Ext.data.Model",
            idProperty: 'id',
            fields : [
                {name : "id", type : "int", sortable : true},
                {name : "name", type : "string", sortable : true},
                {name : "email", type : "string", sortable : true},
                {name : "phone", type : "string", sortable : true}
            ]
        });

        Ext.define("Users", {
            extend: "Ext.data.Store",
            model: "User",
            proxy:{
                type: 'ajax',
                api: {
                    create  : "uadd",
                    read    : "uread",
                    update  : "uupdate",
                    destroy : "udestroy"
                },
                reader: {
                    type: 'json'
                },
                writer: {
                    type: 'json'
                }
            }//,
            //autoSync: true
        });

          var store = Ext.create("Users", {});

         Ext.define('UserList', {
              extend: 'Ext.grid.Panel',
              alias: 'widget.user_list',
              initComponent: function(){
                  Ext.apply(this, {
                      selType: "checkboxmodel", // 配置用什么类型 比如选择的是checkboxmodel, 那么下面的selModel就要用Ext.selection.CheckboxModel的配置项
                      selModel: {
                          injectCheckbox: 0,    // 定义选择框的列位置
                          mode: "MULTI",     //"SINGLE"/"SIMPLE"/"MULTI"
                          checkOnly: true     //只能通过checkbox选择
                      },
                      columns: {
                          //defaults: {flex: 1},
                          items: [{
                              text: 'ID',
                              dataIndex: 'id'
                          },{
                              text: '姓名',
                              dataIndex: 'name'
                          },{
                              text: '邮箱',
                              dataIndex: 'email',
                              flex: 1
                          },{
                              text: '电话',
                              dataIndex: 'phone'
                          }]
                      },
                      dockedItems: [{
                          xtype: 'toolbar',
                          dock: 'top',
                          items: [{
                              text: '添加',
                              itemId: 'add',
                              handler : function(btn){
                                  var x = Ext.widget('user_edit', {title: btn.getText()}).show();
                                  //x.down()
                                  //Ext.getCmp("xxx").setVisible(false);
                                  x.down("form").queryById("xxx").setDisabled(true);
                                  x.down("form").getForm().loadRecord(Ext.create("User", {
                                      name : "fdsafasd",
                                      email : "fdsafa@fdas.com"
                                  }));
                              }
                          },'-',{
                              text: '删除',
                              disabled: true,
                              itemId: 'delete',
                              handler : function(btn){
                                  var record = btn.up('user_list').getSelectionModel().getLastSelected();
                                  store.remove(record);
                              }
                          },'-',{
                              text: '编辑',
                              disabled: true,
                              itemId: 'edit',
                              handler : function(btn){
                                  var win = Ext.widget('user_edit', {title: btn.getText()});
                                  var record = btn.up('user_list').getSelectionModel().getLastSelected();
                                  win.down('form').getForm().loadRecord(record);
                                  win.show("#xxx").setDisabled(true);
                              }
                          }]
                      },{
                          xtype: 'pagingtoolbar',
                          dock: 'bottom',
                          displayInfo: true,
                          store: store
                      }],
                      store: store,
                      listeners : {
                          select : function(grid, record, index, eOpts){
                              this.down("#delete").setDisabled(false);
                              this.down("#edit").setDisabled(false);
                          },
                          deselect : function(grid, record, index, eOpts){
                              this.down("#delete").setDisabled(true);
                              this.down("#edit").setDisabled(false);
                          }
                      }
                  });
                  this.getStore().load();
                  this.callParent(arguments);
              }
          });


          /**
           * @作者 Neeke
           * @Blog http://www.ineeke.com
           * @描述 用户信息编辑
           */
          Ext.define('UserEdit', {
              extend: 'Ext.window.Window',
              alias: 'widget.user_edit',
              initComponent: function(){
                  Ext.apply(this, {
                      layout: 'fit',
                      modal: true,
                      maximizable: true,
                      minimizable: true,
                      resizable: false,
                      items: {
                          xtype: 'form',

                  });
                  this.callParent(arguments);
              }
          });

          Ext.onReady(function(){



              Ext.example.msg("fdsafa", "fdsafdsa");
              Ext.create("Ext.container.Viewport", {
                  layout: 'border',
                  items : [
                      {xtype : "user_list", region : "center"}
                  ]
              });

              // 基本的mask:
              var myMask = new Ext.LoadMask(Ext.getBody(), {msg:"Please wait..."});
              myMask.show();
              var task = new Ext.util.DelayedTask(function(){
                  myMask.destroy();
              });

              task.delay(5);
          });
      </script>
  </head>
  <body>
  </body>
</html>
