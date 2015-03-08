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
        ],
        proxy : {
          type : "localstorage",
          id : "lc1"
        }
      });

      var store = new Ext.data.Store({
        model : user
      });

      store.add({xid : 1, name : "mihang2"});
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
