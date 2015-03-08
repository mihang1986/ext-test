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
                      { header: 'Name',  dataIndex: 'name' },
                      { header: 'Email', dataIndex: 'email', flex:1 },
                      { header: 'Phone', dataIndex: 'phone' }
                  ],
                  height: 200,
                  width: 400,
                  frame : true,
                  draggable : true,
                  resizable : true,
                  closable : true,
                  multiSelect:true,
                  selType: "checkboxmodel",
                  renderTo: Ext.getBody()
              });
          });
      </script>
  </head>
  <body>

  </body>
</html>
