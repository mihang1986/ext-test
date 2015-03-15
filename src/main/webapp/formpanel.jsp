<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="../../script/extjs/resources/css/ext-all.css"/>
    <script type="text/javascript" src="script/extjs/bootstrap.js"></script>
    <script type="text/javascript" src="script/extjs/locale/ext-lang-zh_CN.js"></script>
    <script type="text/javascript">
      Ext.define("MyFormPanel", {
        extend : "Ext.form.Panel",
        margin: 5,
        frame: true,
        width : 300,
        fieldDefaults: {
          allowBlank: false,
          anchor: '100%',
          labelAlign: 'right',
          labelWidth: 40,
          msgTarget : "side"
        },
        items: [{
          xtype: 'textfield',
          name: 'name',
          fieldLabel: '姓名',
          itemId : "xxx",
//          textValid: false,
//          validator: function(){
//            return this.textValid;
//          },
          listeners : {
            'change': function(textfield,newValue,oldValue) {
              Ext.Ajax.request({
                method : "POST",
                url: 'valid',
                success: function(response){
                  if (response.responseText == "true"){
                    textfield.clearInvalid();
                    //textfield.textValid = true;
                  } else {
                    textfield.markInvalid('field is not valid');
                    //textfield.textValid = false;
                  }
                }
              });
            }
          }
        },{
          xtype: 'textfield',
          name: 'email',
          fieldLabel: '邮箱'
        },{
          xtype: 'textfield',
          fieldLabel: '电话',
          name: 'phone'
        }]
      });

      Ext.onReady(function(){
        var a = Ext.create("MyFormPanel", {
          renderTo : Ext.getBody()
        });
      });
    </script>
  </head>

  <body>

  </body>
</html>
