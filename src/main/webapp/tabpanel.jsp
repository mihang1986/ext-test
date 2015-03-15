<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
      <title></title>
      <link rel="stylesheet" type="text/css" href="../../script/extjs/resources/css/ext-all.css"/>
      <script type="text/javascript" src="script/extjs/bootstrap.js"></script>
      <script type="text/javascript" src="script/extjs/locale/ext-lang-zh_CN.js"></script>
      <script type="text/javascript">
          Ext.define("MainViewPort", {
              extend : "Ext.container.Viewport",
              alias : "widget.vp",
              layout: 'border',
              items : [
                  {title  : "p1", html : "fdsafdsafasd", region: "west",
                      tools : [
                          {
                              type: 'plus',
                              tooltip: 'Refresh form Data',
                              // hidden:true,
                              handler: function (event, toolEl, panel) {
                                  // 实现逻辑
                              }
                          }
                      ]
                  },
                  {title  : "p2", html : "fdsafdsafasd2",  region: "center"}
              ],
              config : {
                  aaa : 5
              },
              renderTo : Ext.getBody()
          });

          Ext.onReady(function(){
              var x = Ext.widget("vp");
              x.setAaa(3);
              alert(x.getAaa());
          });
      </script>
  </head>
  <body>
  </body>
</html>
