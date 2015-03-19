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
          Ext.onReady(function(){
              Ext.create('Ext.form.Panel', {
                  title: 'FieldContainer 示例',
                  width: 550,
                  bodyPadding: 10,
                  frame : true,

                  items: [{
                      xtype: 'fieldcontainer',
                      fieldLabel: '最近三份工作',
                      labelWidth: 100,

                      // body 区域将包含三个文本域(text fields),
                      //水平排列, 通过可拖动的分隔符 splitter 分隔开.
                      layout: 'hbox',
                      items: [{
                          xtype: 'textfield',
                          flex: 1
                      }, {
                          xtype: 'splitter'
                      }, {
                          xtype: 'textfield',
                          flex: 1
                      }, {
                          xtype: 'splitter'
                      }, {
                          xtype: 'textfield',
                          flex: 1
                      }]
                  }],
                  renderTo: Ext.getBody()
              });
          });

      </script>
  </head>
  <body>
  </body>
</html>
