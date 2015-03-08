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

            window.onload = function(){
                //alert("xxxx");
            };
          Ext.onReady(function(){
              Ext.QuickTips.init();
              //alert("eee");
              Ext.fly("haha").load({
                  url : "/json1",
                  renderer : function(loader, response, request){
                    this.target.dom.value = Ext.decode(response.responseText).name;
                  }
              });

              Ext.fly("haha").addKeyMap({
                  key : Ext.EventObject.B,
                  fn : function(){
                      alert("fdasfdas");
                  }
              });

              console.debug(Ext.query(".aaa"));

              Ext.create('Ext.data.Store', {
                  storeId:'simpsonsStore',
                  fields:['name', 'email', 'phone'],
                  data:{'items':[
                      { 'name': 'Lisa',  "email":"lisa@simpsons.com",  "phone":"555-111-1224"  },
                      { 'name': 'Bart',  "email":"bart@simpsons.com",  "phone":"555-222-1234" },
                      { 'name': 'Homer', "email":"home@simpsons.com",  "phone":"555-222-1244"  },
                      { 'name': 'Marge', "email":"marge@simpsons.com", "phone":"555-222-1254"  }
                  ]},
                  proxy: {
                      type: 'memory',
                      reader: {
                          type: 'json',
                          root: 'items'
                      }
                  }
              });

              Ext.create('Ext.grid.Panel', {
                  title: 'Simpsons',
                  store: Ext.data.StoreManager.lookup('simpsonsStore'),
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
                  height: 200,
                  width: 400,
                  frame : true,
                  renderTo: Ext.getBody(),
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
                  }
              });







          });
      </script>
  </head>
  <body>
    <input type="button" value="aa" id="haha"/>

  </body>
</html>
