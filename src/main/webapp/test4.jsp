<%--
  Created by IntelliJ IDEA.
  User: navia
  Date: 2015/3/2
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
      <title></title>
      <link rel="stylesheet" type="text/css" href="../../script/extjs/resources/css/ext-all.css"/>
      <script type="text/javascript" src="script/extjs/bootstrap.js"></script>
      <script type="text/javascript" src="script/extjs/locale/ext-lang-zh_CN.js"></script>
      <script type="text/javascript">
        Ext.define("Item", {
          extend : "Ext.data.Model",
          fields : [
            {name : "id", type : "int"},
            {name : "name", type : "string"}
          ]
        });

        Ext.define("Title", {
          extend : "Ext.data.Model",
          fields : [
            {name : "id", type : "int"},
            {name : "name", type : "string"}
          ]
        });

        Ext.define("User", {
          extend : "Ext.data.Model",
          fields : [
            {name : "id", type : "int"},
            {name : "name", type : "string"}
          ],
          hasMany : [
            {model : "Item", name : "items"},
            {model : "Title", name : "titles"}
          ]
        });

        var userdata = {
          total : 100,
          users : [{
            id : 1,
            name : "南宫若雪",
            items : [
              {id : 5, name : "凤凰金缕衣"},
              {id : 3, name : "迎春鸟"},
              {id : 7, name : "茉莉花"}
            ],
            titles : [
              {id : 4, name : "暴力女"},
              {id : 7, name : "傲娇"}
            ]
          },{
            id : 2,
            name : "南宫岚曦",
            items : [
              {id : 5, name : "万魂战衣"},
              {id : 3, name : "邪神万灵"}
            ],
            titles : [
              {id : 4, name : "大小姐"},
              {id : 7, name : "观星"}
            ]
          }]
        };

        var userReader = Ext.create("Ext.data.reader.Json", {
          root : "users"
        });

        var userProxy = Ext.create("Ext.data.proxy.Memory", {
          model : "User",   // 可有可无
          data : userdata,
          reader : userReader
        });

        var userStore = Ext.create("Ext.data.Store", {
          model : "User",
          proxy : userProxy
        });

        userStore.load();
        userStore.each(function(u){
          console.debug(u.get("id"));
          console.debug(u.get("name"));
          u.items().each(function(i){
            console.debug("--- " + i.get("name"));
          });
          u.titles().each(function(t){
            console.debug("--- " + t.get("name"));
          });
        });

        /*userProxy.read(new Ext.data.Operation(), function(m){
          Ext.Array.each(m.resultSet.records, function(o){
            console.debug(o.get("name"))
            o.items().each(function(i){
              console.debug("--- " + i.get("name"));
            });
            o.titles().each(function(t){
              console.debug("--- " + t.get("name"));
            });
          });
        });*/

       /* var x = Ext.create("User", {
          id : 1,
          name : "南宫若雪"
        });

        x.items().add([
          {id : 5, name : "凤凰金缕衣"},
          {id : 3, name : "迎春鸟"},
          {id : 7, name : "茉莉花"}
        ])

        x.titles().add([
          {id : 4, name : "暴力女"},
          {id : 7, name : "傲娇"}
        ]);


        x.items().each(function(m){
          console.debug(m.get("name"));
        });

        x.titles().each(function(m){
          console.debug(m.get("name"));
        });*/
      </script>
  </head>
  <body>

  </body>
</html>
