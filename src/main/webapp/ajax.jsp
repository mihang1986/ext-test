<%--
  Created by IntelliJ IDEA.
  User: navia
  Date: 2015/3/2
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
      <title></title>
      <link rel="stylesheet" type="text/css" href="../../script/extjs/resources/css/ext-all.css"/>
      <script type="text/javascript" src="script/extjs/bootstrap.js"></script>
      <script type="text/javascript" src="script/extjs/locale/ext-lang-zh_CN.js"></script>
      <script type="text/javascript">
/*        Ext.Ajax.request({
          url : "/person",
          method : "POST",
          params : {
            id : 99
          },
          success : function(response, options){
            var x = Ext.JSON.decode(response.responseText);
            console.debug(x.name);
          }
        });*/

        /*Ext.onReady(function(){
          Ext.get("haha").on("click", function(e){
            //console.debug(this.dom.value);

            var x = "{\"id\" : 1, \"name\" : \"haha\"}";
            console.debug(eval("(" + x + ")"));
          });
        });*/

//            window.onload = function(){
//                //alert("xxxx");
//            };
          Ext.onReady(function(){
//              Ext.QuickTips.init();
//              //alert("eee");
//              Ext.fly("haha").load({
//                  url : "/json1",
//                  renderer : function(loader, response, request){
//                    this.target.dom.value = Ext.decode(response.responseText).name;
//                  }
//              });
//
//              Ext.fly("haha").addKeyMap({
//                  key : Ext.EventObject.B,
//                  fn : function(){
//                      alert("fdasfdas");
//                  }
//              });
//
//              console.debug(Ext.query(".aaa"));

              Ext.QuickTips.init();



              var userstore  = Ext.create('Ext.data.Store', {
                  storeId:'simpsonsStore',
                  fields:['name', 'email', 'phone'],
                  pageSize : 10,
                  listeners : {
                      beforeload : function(store, operation, eOpts){

                          var keyWord=Ext.getCmp('KeyWord').getValue();
                          var new_params = { searchText:keyWord };
                          Ext.apply(store.proxy.extraParams, new_params);

                      }
                  },
                  proxy: {
                      type: 'ajax',
                      url : "getusers",
                      reader: {
                          type: 'json'//,
                          //root: 'items'
                      }
                  }
              });

              Ext.create('Ext.grid.Panel', {
                  title: 'Simpsons',
                  store: userstore ,//"simpsonsStore",//Ext.data.StoreManager.lookup('simpsonsStore'),
                  columns: [
                      { text: 'Name',  dataIndex: 'name' },
                      { text: 'Email', dataIndex: 'email', flex: 1 },
                      { text: 'Phone', dataIndex: 'phone',editor:{
                          xtype:'textfield',
                          selectOnFocus: true,
                          allowBlank:false
                        },renderer: function(value){
                          if (value === 1) {
                              return '1 person';
                          }
                          return value + ' fdsa';
                        }
                      },
                      {
                          text : "编辑",
                          xtype:'actioncolumn',
                          menuDisabled:true,
                          width:40,
                          items: [{
                              icon: '/icons/fam/cog_edit.png',  // Use a URL in the icon config
                              tooltip: '编辑',
                              handler: function(grid, rowIndex, colIndex) {
                                  var rec = grid.getStore().getAt(rowIndex);
                                  alert("Edit " + rec.get('name'));
                              }
                          }]
                      }
                  ],
                  height: 500,
                  width: 800,
                  frame : true,
                  renderTo: Ext.getBody(),
                  dockedItems :[{
                      xtype:'pagingtoolbar',
                      store:userstore, //"simpsonsStore",//Ext.data.StoreManager.lookup('simpsonsStore'),
                      dock:'bottom',
                      displayInfo:true

                  }],
                  plugins:[
                      Ext.create("Ext.grid.plugin.CellEditing",{
                          clicksToEdit : 1
                      })
                  ],
                  columnLines: true,
                  selType: "checkboxmodel", // 配置用什么类型 比如选择的是checkboxmodel, 那么下面的selModel就要用Ext.selection.CheckboxModel的配置项
                  selModel: {
                      injectCheckbox: 0,    // 定义选择框的列位置
                      mode: "SINGLE",     //"SINGLE"/"SIMPLE"/"MULTI"
                      checkOnly: true     //只能通过checkbox选择
                  },
                  listeners : {
                      edit : function(editor, e, eOpts){
                          //e.record().commit();
                          //alert(1);
                          //e.record.commit();
                          //alert(e.record.get("name"));
                          //e.record.reject();
                      }
                  },

                  tbar :[
                      {xtype:'button',text:'添加'},
                      {xtype:'button',text:'删除'},
                      {xtype:'button',text:'修改',
                          listeners: {
                              click: function(o){
                                  //console.debug(o.ownerCt.ownerCt);
                                  var grid = o.findParentByType("gridpanel"),
                                          store = grid.getStore();

                                  //store.sync();

                                  var d = store.getUpdatedRecords();
                                  Ext.Array.each(d, function(o){
                                     console.debug(o.get("name") + o.get("phone"));
                                      //o.commit();
                                  });

                                  store.commitChanges();
                              }
                          }},
                      {xtype:'button',text:'读取',
                          listeners: {
                              click: function(o){
                                  //console.debug(o.ownerCt.ownerCt);
                                  var grid = o.findParentByType("gridpanel"),
                                          store = grid.getStore();
                                  /*store.load({
                                      params: {
                                          // 如果使用分页，在第一次加载时，指定params
                                          start: 0,
                                          limit: 10,
                                          // 其他params
                                          foo: 'bar'
                                      }
                                  });*/
                                  store.load();
                              }
                      }},

                      {
                          xtype:'label',text:'请输入关键词：'
                      },
                      {
                          xtype:'textfield',id:'KeyWord'
                      },
                      {
                          text:'搜索',handler:function(o){
                          var grid = o.findParentByType("gridpanel"),
                                  store = grid.getStore();
                          //点击搜索按钮将查询条件传递到后台
                          var keyWord=Ext.getCmp('KeyWord').getValue();
                          store.load({params:{start:0,limit:10,foo:'bar',searchText:keyWord}});
                      }
                      }
                  ]
              });







          });
      </script>
  </head>
  <body>
    <input type="button" value="aa" id="haha"/>

  </body>
</html>
