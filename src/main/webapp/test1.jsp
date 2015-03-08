<%--
  Created by IntelliJ IDEA.
  User: navia
  Date: 2015/2/27
  Time: 20:09
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
      var persons = [
        {id : 1, name : "mihang1"},
        {id : 2, name : "mihang2"}
      ];

      Ext.define("person", {
        extend : "Ext.data.Model",
        fields : [
          {name : "xid", type : "int"},
          {name : "name", type : "string"}
        ],
        proxy : {
          /*
          type : "memory",
          data : persons
          */
          type: 'localstorage',
          id  : 'ttt'
        }
      });

      var store = Ext.create("Ext.data.Store", {
        model : person
      });

      store.add({name : "mihang2"});
      store.sync();
      store.load();

      store.each(function(rec){
        console.debug(rec.get("name"));
      });
    </script>
  </head>

  <body>

  </body>
</html>
