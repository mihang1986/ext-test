<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>test</title>
        <link rel="stylesheet" type="text/css" href="../../script/extjs/resources/css/ext-all.css"/>
        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
        <script type="text/javascript" src="script/extjs/bootstrap.js"></script>
        <script type="text/javascript" src="script/extjs/locale/ext-lang-zh_CN.js"></script>
        <script type="text/javascript">
            /*var same = {
                g : 5
            };

            var base = {
                a : 10,
                g : same
            }


            var base2 = Ext.clone(base);

            base.g.g = 10;
            console.debug(base2);*/

            //console.debug(Ext.id());
            //Ext.destroy(window);

            /*Ext.onReady(function(){
                console.dir(Ext.getBody());
                console.dir(Ext.getHead());
                console.dir(Ext.getDoc());
            });*/

            /*var a = Ext.urlAppend("http://www.baidu.com", "a=5");
            console.debug(a);*/

            /*console.debug(Ext.typeOf(true));
            console.debug(Ext.isEmpty("", true));
            console.debug(Ext.isObject({ a : 5}));
            console.debug(Ext.isIterable([1, 2, 3]));
            console.debug(Ext.isFunction(window.alert));
            console.debug(Ext.isArray([1, 2, 3]));
            console.debug(Ext.isDate(new Date()));
            console.debug(Ext.isPrimitive(123));    // 是否是JS基本数据类型
            console.debug(Ext.isNumber(123));
            console.debug(Ext.isNumeric("123"));
            console.debug(Ext.isString("123"));
            console.debug(Ext.isBoolean("123"));
            console.debug(Ext.isElement("123"));
            console.debug(Ext.isTextNode("123"));
            console.debug(Ext.isDefined("123"));


            Ext.iterate([1, 2, 3], function(obj, idx){
                console.debug(obj, idx);
            });*/

            /*var a = { name : "piyan" };
            Ext.applyIf(a, {
                name : "nima",
                age : 19
            });

            console.debug(a);*/

            /*Ext.namespace("MyData", "MyData.a");


            Ext.define("MyData.People", {
                config : {
                    name : "",
                    age : 0
                },
                constructor : function(name, age){
                    this.name = name;
                    this.age = age;
                    this.initConfig();
                    return this;
                },
                say : function(){
                    console.debug("my name is " + this.getName() + " i'am " + this.getAge());
                },
                applyName : function(newval, oldval){
                    console.debug("name propertie " + oldval + " is change to " + newval);
                    console.dir(arguments);
                }
            });

            var p = Ext.create("MyData.People", "nima", 99);

            p.setName("fff");
            p.say();
            console.log("请将简历发送至 %c ps_recruiter@baidu.com（ 邮件标题请以“姓名-应聘XX职位-来自console”命名）","color:red");*/

            /*Ext.define("MyData.People", {
                say : function(){
                    console.debug("say");
                },
                cry : function(){
                    console.debug("cry");
                }
            });

            var p  = Ext.create("MyData.People");
            p.say();
            p.cry();

            console.dir(p);*/





            /*Ext.onReady(function(){

                //Ext.MessageBox.alert("提示", "哈哈哈");
                Ext.create("Ext.Viewport", {
                    layout : "fit",
                    items : [{
                        xtype : "panel",
                        title : "欢迎",
                        html : "<h1>fdsafdsafdsa</h1>"
                    }]
                });


            });*/

            /*Ext.onReady(function(){
                Ext.addBehaviors({
                    "input[type=button]@click" : function(e){
                        alert("fdsa");
                    }
                });
            });

            console.debug(Ext.isReady);*/

            /*var  a = {
                name : "mihang",
                age : 19
            };

            Ext.destroyMembers(a, "name");
            console.debug(a);*/


            /*var a = Ext.Object.toQueryString({name : "几把"});
            console.debug(a);
            console.debug(Ext.Object.fromQueryString(a));*/


            /*Ext.Object.each({a : 1, b : 2}, function(k, v){
                console.debug(k, v);
            });*/

            /*var a = Ext.Object.merge({a : 1}, {b : 2});
            console.debug(a);*/


            /*var a = Ext.Array.each([1, 2, 3], function(v, i){
                console.debug(v, i);
                //return true;
            });

            console.debug(a);*/

//            Ext.query();


            /*Ext.namespace("MyData");

            Ext.define("MyData.People", {
                config : {
                    name : "",
                    age : 0
                },
                constructor : function(name, age){
                    this.name = name;
                    this.age = age;
                    this.initConfig();
                    return this;
                },
                statics:{   //静态的方法或属性
                    static_id: '我是Person的id,不能被子类所继承!!'
                },
                inheritableStatics:{	//静态的方法或属性
                    inheritableStatics_id:'我是Person的id,我可以被子类继承!!'
                },
                say : function(){
                    console.debug("my name is " + this.getName() + " i'am " + this.getAge());
                },
                applyName : function(newval, oldval){
                    console.debug("name propertie " + oldval + " is change to " + newval);
                    console.dir(arguments);
                }
            });*/

            /*Ext.onReady(function(){
                Ext.EventManager.on("txt1", {
                    focus : function(e, el){
                        if(this.value == this.defaultValue){
                            this.value = "";
                        }
                    },
                    blur : function(e, el){
                        if(this.value == ""){
                            this.value = this.defaultValue;
                        }
                    }
                });
            });*/

            /*Ext.onReady(function(){
                // ext 延迟任务
                var task = new Ext.util.DelayedTask(function(){
                    console.debug(Ext.getDom("txt1").value);
                });

                console.debug(task);

                Ext.EventManager.on("txt1", {
                    keypress : function(e, el){
                        var key = e.getKey();
                        if(key< e.ZERO || key > e.NINE)
                            e.stopEvent();
                        task.delay(1000);
                    }
                });


                *//*var runner = new Ext.util.TaskRunner({
                    run : function(){
                        console.debug("123");
                    },
                    interval : 1000
                });*//*

               // Ext.util.TaskManager.start(runner);
            });*/



            /*Ext.onReady(function(){
              //  debugger
                console.debug(Ext.query(".txt1"));

                var content = Ext.get("content");
                console.debug(content.query(".txt1"));
            });*/

            //Ext.Array.each()

            //Ext.DomQuery.select();

            //alert(Ext.query == Ext.DomQuery.select);

            /*Ext.onReady(function(){
               // var f = Ext.DomQuery.compile("input");
                //console.debug(f());
                //Ext.DomQuery.jsSelect();

                //.fly("xxx").dom.innerHTML = "fdsaf";
                //Ext.getDom("xxx").innerHTML = "xxx";

                var dh = Ext.DomHelper;
                var cx = Ext.query("#content input:nth-of-type(4)")[0];
                var x = dh.insertHtml("afterend", cx, dh.markup({
                    tag : "div",
                    cn : [
                        {tag : "div", html : "c"},
                        {tag : "div", html : "d"}
                    ]
                }))

                dh.applyStyles(x, "background-color:#F0F")
            });


            alert(Ext.Element === Ext.dom.Element);
            alert(Ext.DomHelper === Ext.dom.DomHelper); // 用Ext.DomHelper*/

           /* Ext.onReady(function(){
                //var a = Ext.fly("content");
                //console.debug(Ext.select(".txt1"));

                //a.applyStyles({backgroundColor : "#F0F"});
                //var b = a.wrap(Ext.DomHelper.createHtml({tag : "div"}));
                //console.debug(b);


                //console.debug(Ext.select(".txt1", true));

                Ext.select("input[type=button]").on("click", function(e, el){
                    Ext.Ajax.request({
                        url : "json2",
                        method : "get",
                        success : function(rsp, opt){
                            var x = Ext.JSON.decode(rsp.responseText);
                            console.debug(x.name);
                        }
                    });

                    //Ext.fly("xxx").load();
                });
            });*/



            /*   自定义校验  */
/*
            Ext.apply(Ext.data.validations, {
                age : function(config, value){
                    if(value <= config.max && value >= config.min){
                        return true;
                    }else{
                        return false;
                    }
                },
                ageMessage : "年龄错误"
            });

            Ext.define("person", {
                extend : "Ext.data.Model",
                fields : [
                    {name : "name", type : "string"},
                    {name : "age", type : "int"}
                ],
                validations : [
                    {field : "name", type : "length", min : 5, message : "长度必须大于5"},
                    {field : "name", type : "age", min : 5, max : 50, message : "年龄必须在5~50岁之间"}
                ]
            });

            var p1 = Ext.create("person", {
                name : "mi",
                age : 999
            });

            var x = p1.validate();

            x.each(function(v){
                console.debug(v.field + "-------" + v.message);
            });*/


            Ext.define("person", {
                extend : "Ext.data.Model",
                fields : [
                    {name : "name", type : "string"},
                    {name : "age", type : "int"}
                ]
            });

            var persons = [
                {name : "a", age : 5},
                {name : "b", age : 7}
            ];

            var personProxy = Ext.create("Ext.data.proxy.Memory",{
                data : persons,
                model : person
            });

            personProxy.read(new Ext.data.Operation(), function(result){
                var models = result.resultSet.records;
                Ext.Array.each(models, function(m){
                    console.debug(m.get("name"));
                });
            });
        </script>
    </head>

    <body>
    ${jiba.name}<br/>
    ${fff}<br/>
    ${ffff}

        <div id="xxx"></div>
        <div id="content">
            <input type="text" class="txt1" value="请输入"/><br/>
            <input type="text" class="txt1" value="请输入"/><br/>
            <input type="text" class="txt1" value="请输入"/><br/>
            <input type="text" class="txt1" value="请输入"/><br/>
        </div>

        <input type="button" value="草泥马"/>
    </body>
</html>
