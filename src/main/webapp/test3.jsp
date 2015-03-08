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
      Ext.define("user", {
        extend : "Ext.data.Model",
        fields : [
          {name : "xid", type : "int"}, // 一定不能用id
          {name : "name", type : "string"}
        ]
      });

     var proxy = Ext.create("Ext.data.proxy.Ajax", {
       model : "user",
       url : "getuser"
     });

      proxy.doRequest(new Ext.data.Operation({
        limit : 10,
        start : 5
      }), function(o){
        console.debug(o);
      });
    </script>
  </head>

  <body>

  </body>
</html>
