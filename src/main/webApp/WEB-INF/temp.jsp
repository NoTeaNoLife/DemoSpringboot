<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv=“Content-Type” content=“text/html; charset=UTF-8″>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>接口测试</title>

    <script src="../static/js/jquery.js"></script>
    <style >
        p{
            float:left;
        }
    </style>
</head>
<body>
<h1 style="color:green;width:100%;text-align:center;">后台接口测试</h1>
<div style="width:100%; background:lightgray; padding-left:30px; ">
    <p >url：</p><input id='urlText' type="text" style="width:300px; height:30px; background:darkolivegreen; padding-left:10px; " /></br>
    <p >type：</p><input id='typeText' type="text" style="width:100px; height:30px; background:darkolivegreen;  padding-left:10px; " /></br>
    <p >data：</p><input id='dataText' type="text" style="width:200px; height:30px; background:darkolivegreen;  padding-left:10px; " /><input id='isString' type="checkbox" style="height:30px; width:30px; " />字符串</br>
    <p >dataType：</p><input id='dataTypeText' type="text" style="width:200px; height:30px; background:darkolivegreen;  padding-left:10px; " /></br>
    <p >contentType：</p><input id='contentTypeText' type="text" style="width:200px; height:30px; background:darkolivegreen;  padding-left:10px; " /></br>
    <input onclick='testFun()' type="button" style="width:80px; height:35px; background:powderblue; color:firebrick; " value="请求"/></br>
    <p >请求结果</p></br>
    <textarea id='resultText' style="resize:none; width:80%; height:100px; color:floralwhite; background:black; "></textarea>
</div>
<script >
    var testTimes = 1;
    function testFun(){
        var data = {
            url : $("#urlText").val(),
            type : $("#typeText").val(),
            data : $("#dataText").val(),
            dataType : $('#dataTypeText').val(),
            contentType : $('#contentTypeText').val()
        };
        showInResultArea("("+(testTimes++)+")发生请求："+JSON.stringify(data));
        if(!$("#isString").is(':checked'))
            data.data = JSON.parse(data.data);
        requestTest(data);
    }
    function requestTest(t){
        $.ajax({
            url: t.url,
            type: t.type,
            cache: false,
            dataType:t.dataType,
            //contentType: "application/x-www-form-urlencoded",
            //contentType: "application/json;charset=utf-8",
            contentType:t.contentType,
            data: t.data,
            success: function (data) {
                showInResultArea("请求成功");
                showInResultArea("服务器响应："+JSON.stringify(data));
            },
            error : function(){
                showInResultArea("请求失败")
            }
        });
    }
    function showInResultArea(t){
        var target = $('#resultText');
        target.val(t+"\n"+target.val());
    }


</script>

</body>
</html>