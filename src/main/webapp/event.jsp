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
        var children = Ext.create("Ext.util.Observable", {});
        var father = Ext.create("Ext.util.Observable", {});

        father.mon(children, "cry", function(){
          alert("孩子哭了");
        });

        father.destroy();

        children.fireEvent("cry");


        /*children.on("dead", function(){
          alert("孩子死了");
        });

        father.on("dead", function(){
          alert("爸爸送孩子去火葬场");
        });

        father.relayEvents(children, ["dead"]);

        children.fireEvent("dead");*/
      </script>
  </head>
  <body>

  </body>
</html>
