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
              var store = Ext.create('Ext.data.TreeStore', {
                  root: {
                      expanded: true,
                      children: [
                          { text: "detention", leaf: true },
                          { text: "homework", expanded: true, children: [
                              { text: "book report", leaf: true },
                              { text: "alegrbra", leaf: true}
                          ] },
                          { text: "buy lottery tickets", leaf: true }
                      ]
                  }
              });

              Ext.create('Ext.tree.Panel', {
                  title: 'Simple Tree',
                  width: 200,
                  height: 150,
                  store: store,
                  rootVisible: false,
                  renderTo: Ext.getBody(),
                  listeners: {
                      click: {
                          element: 'el', //bind to the underlying el property on the panel
                          fn: function(e){ console.log(e); }
                      },
                      dblclick: {
                          element: 'body', //bind to the underlying body property on the panel
                          fn: function(){ console.log('dblclick body'); }
                      }
                  }
              });
          });
      </script>
  </head>
  <body>

  </body>
</html>
