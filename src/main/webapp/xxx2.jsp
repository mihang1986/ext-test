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
          Ext.define("UserModel", {
              extend : "Ext.data.Model",
              fields : [
                  {name : "id", type : "int", sortable : true},
                  {name : "name", type : "string", sortable : true},
                  {name : "email", type : "string", sortable : true},
                  {name : "phone", type : "string", sortable : true}
              ]
          });

          Ext.define("UserStore", {
              extend: "Ext.data.Store",
              model: "UserModel",
              proxy:{
                  type:'ajax',
                  url:'/getusers',
                  reader: {
                      type: 'json'
                  },writer:{
                      type:'json'
                  }
              },
              pageSize : 10//,
              //autoLoad: true
          });


          var store = Ext.create("UserStore", {});

          Ext.define("UserGrid", {
              extend : "Ext.grid.Panel",
              alias: 'widget.userlist',
              title : "用户表格",
              columns : [
                  {text : "名称", dataIndex : "name", width : 200},
                  {text : "邮箱", dataIndex : "email", flex: 1},
                  {text : "电话", dataIndex : "phone", width : 200}
              ],
              dockedItems :[{
                  xtype:'pagingtoolbar',
                  dock:'bottom',
                  displayInfo:true,
                  store : store
              }],
              store : store,
              initComponent:function(){
                  this.callParent(arguments);
              }
          });

          Ext.onReady(function(){
              /*Ext.create('Ext.container.Viewport', {
                  layout: 'border',
                  items: [
                      {xtype : "panel", region: 'west', html : "fdsafdsa", width : 200},
                      {xtype : "userlist", region: 'center'}
                  ]
              });*/

              var w = Ext.create('Ext.window.Window', {
                  title: 'Hello',
                  height: 200,
                  width: 400,
                  layout: 'fit',
                  items: {  // Let's put an empty grid in just to illustrate fit layout
                      xtype: 'userlist'
                  }
              }).show();

              w.down("gridpanel").getStore().load();
          });

      </script>
  </head>
  <body>
  </body>
</html>
