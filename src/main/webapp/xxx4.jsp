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
          Ext.require([
              'Ext.form.*',
              'Ext.tip.QuickTipManager'
          ]);

          Ext.onReady(function() {

              var required = '<span style="color:red;font-weight:bold" data-qtip="Required">*</span>',
                      win;

              Ext.tip.QuickTipManager.init();

              function showContactForm() {
                  if (!win) {
                      var form = Ext.widget('form', {
                          layout: {
                              type: 'vbox',
                              align: 'stretch'
                          },
                          border: false,
                          bodyPadding: 10,
                          frame : true,
                          margin : 5,

                          fieldDefaults: {
                              //labelAlign: 'top',
                              labelWidth: 50,
                              labelStyle: 'font-weight:bold'
                          },
                          items: [{
                              xtype: 'fieldcontainer',
                              layout: 'hbox',
                              defaultType: 'textfield',

                              items: [{
                                  flex: 1,
                                  name: 'firstName',
                                  itemId: 'firstName',
                                  afterLabelTextTpl: required,
                                  fieldLabel: 'First',
                                  allowBlank: false
                              },{
                                  flex: 1,
                                  name: 'lastName',
                                  afterLabelTextTpl: required,
                                  fieldLabel: 'Last',
                                  allowBlank: false,
                                  margins: '0 0 0 5'
                              }]
                          }, {
                              xtype: 'textfield',
                              fieldLabel: 'Your Email Address',
                              afterLabelTextTpl: required,
                              vtype: 'email',
                              allowBlank: false
                          }, {
                              xtype: 'textfield',
                              fieldLabel: 'Subject',
                              afterLabelTextTpl: required,
                              allowBlank: false
                          }, {
                              xtype: 'textareafield',
                              fieldLabel: 'Message',
                              labelAlign: 'top',
                              flex: 1,
                              margins: '0',
                              afterLabelTextTpl: required,
                              allowBlank: false
                          }],

                          buttons: [{
                              text: 'Cancel',
                              handler: function() {
                                  this.up('form').getForm().reset();
                                  this.up('window').hide();
                              }
                          }, {
                              text: 'Send',
                              handler: function() {
                                  if (this.up('form').getForm().isValid()) {
                                      // In a real application, this would submit the form to the configured url
                                      // this.up('form').getForm().submit();
                                      this.up('form').getForm().reset();
                                      this.up('window').hide();
                                      Ext.MessageBox.alert('Thank you!', 'Your inquiry has been sent. We will respond as soon as possible.');
                                  }
                              }
                          }]
                      });

                      win = Ext.widget('window', {
                          title: 'Contact Us',
                          closeAction: 'hide',
                          width: 400,
                          height: 400,
                          minWidth: 300,
                          minHeight: 300,
                          layout: 'fit',
                          resizable: true,
                          modal: true,
                          items: form,
                          defaultFocus: 'firstName'
                      });
                  }
                  win.show();
              }

              var mainPanel = Ext.widget('panel', {
                  renderTo: Ext.getBody(),
                  title: 'Welcome!',
                  width: 500,
                  bodyPadding: 20,

                  items: [{
                      margin: '0 0 20 0',
                      xtype: 'component',
                      html: 'Thank you for visiting our site! We welcome your feedback; please click the button below to ' +
                      'send us a message. We will respond to your inquiry as quickly as possible.'
                  }, {
                      xtype: 'container',
                      layout: {
                          type: 'hbox',
                          pack: 'center'
                      },
                      items: [{
                          xtype: 'button',
                          cls: 'contactBtn',
                          scale: 'large',
                          text: 'Contact Us',
                          handler: showContactForm
                      }]
                  }]
              });

          });
      </script>
  </head>
  <body>
  </body>
</html>
