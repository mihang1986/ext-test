<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
      <title></title>
      <link rel="stylesheet" type="text/css" href="../../script/extjs/resources/css/ext-all.css"/>
      <script type="text/javascript" src="script/extjs/bootstrap.js"></script>
      <script type="text/javascript" src="script/extjs/locale/ext-lang-zh_CN.js"></script>
      <script type="text/javascript">
         Ext.Loader.setConfig({
             enabled : true,
             paths : {
                 "My" : "script/extapp/My"
             }
         });

          //Ext.require("My.User");

          var x = Ext.create("My.User", {
              name : "ffdsafas"
          });

         alert(x.getName());
      </script>
  </head>
  <body>

  </body>
</html>
