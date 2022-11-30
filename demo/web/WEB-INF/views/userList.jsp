<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户列表</title>
    <style>
        #container {
            height: 2000px;
            width: 1800px;
            margin: 0 auto;
        }

        .box {
            height: 400px;
            width: 1800px;
            margin: 0 auto;
        }


        .ul-a li{
            list-style-type: none;
            display: inline-block;
            border-left: 1px solid white;
            margin-top: 10px;
            padding-left: 12px;
            margin-left: 12px;
        }
        .ul-a a {
            color: white;
            text-decoration: none;
            padding-left: 2px;
            margin-left: 2px;
        }

        #list-ul {
            padding-left: 0;
        }
        #list-ul li {
            list-style-type: none;
            display: inline-block;
            margin-right: 20px;
            background-color: rgb(8, 90, 157);
            padding: 4px;
        }
        #list-ul a {
            text-decoration: none;
            color: white;
        }

        table.tb {
            font-family: verdana,arial,sans-serif;
            font-size:11px;
            color:#333333;
            border-width: 1px;
            border-color: #999999;
            border-collapse: collapse;
        }
        table.tb th {
            background:#b5cfd2;
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #999999;
        }
        table.tb td {
            background:#dcddc0;
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #999999;
            text-align: center;
            width: 152px;
            height: 45px;
        }

        .role {
            display: none; 
            position: absolute; 
            top: 28%; 
            left: 33%; 
            width: 420px; 
            height: 200px; 
            padding: 20px; 
            border: 10px solid orange; 
            background-color: white; 
            z-index:1002;
            border-radius: 5%;
        }
        .black_overlay{ 
            display: none; /* 此元素不会被显示*/
            position: absolute; 
            top: 0%; 
            left: 0%; 
            width: 100%; 
            height: 100%; 
            background-color: black; 
            z-index:1001; /* z-index 属性设置元素的堆叠顺序。拥有更高堆叠顺序的元素总是会处于堆叠顺序较低的元素的前面。*/
            -moz-opacity: 0.8; 
            opacity:.80; /* opacity 属性设置元素的不透明级别。*/
            filter: alpha(opacity=88);  
			/* 所有浏览器都支持 opacity 属性。   注释：IE8 以及更早的版本支持替代的 filter 属性。例如：filter:Alpha(opacity=50)。*/
        }

        .div-delete {
            display: none; 
            position: absolute; 
            top: 28%; 
            left: 33%; 
            width: 354px; 
            height: 129px; 
            padding: 20px; 
            border: 8px solid #b5cfd2; 
            background-color: white; 
            z-index:1002;
            border-radius: 5px;
        }

        .div-info {
            display: none; 
            position: absolute; 
            top: 28%; 
            left: 33%; 
            width: 420px; 
            height: 200px; 
            padding: 20px; 
            border: 10px solid orange; 
            background-color: white; 
            z-index:1002;
            border-radius: 5%;
        }
    </style>
    <script>
        // 角色修改窗口显示
        function showRoleDiv(username) {
            document.getElementById('div-role-'+username).style.display = "block";
            document.getElementById('fade').style.display = "block";
        }

        // 角色修改窗口隐藏
        function hideRoleDiv(username) {
            document.getElementById('div-role-'+username).style.display = "none";
            document.getElementById('fade').style.display = "none";
        }

        // 设置默认值
        // function setSelectDefault(username, roleStr) {
        //     let e = document.getElementById('select-'+username);

        //     if (roleStr === '') {
        //         e.value = ''
        //     } else if () {

        //     } else if () {

        //     }
        // }

        // 删除提示窗口显示
        function showDeleteTips(username) {
            document.getElementById('div-delete-'+username).style.display = "block";
            document.getElementById('fade').style.display = "block";
        }

        // 删除提示窗口隐藏
        function hideDeleteDiv(username) {
            document.getElementById('div-delete-'+username).style.display = "none";
            document.getElementById('fade').style.display = "none";
        }

        // 修改信息窗口显示
        function showInfoDiv(username) {
            document.getElementById('div-info-'+username).style.display = "block";
            document.getElementById('fade').style.display = "block";
        }

        // 修改信息窗口隐藏
        function hideInfoDiv(username) {
            document.getElementById('div-info-'+username).style.display = "none";
            document.getElementById('fade').style.display = "none";
        }

        function userRoleSuccessTip() {
            console.log('${param.userRoleSuccess}');
            if ('${param.userRoleSuccess}' === '1') {
                alert("用户角色权限修改成功！");
            }
        }
        function userInfoSuccessTip() {
            console.log("userInfoSuccessTip");
            console.log('${param.userInfoSuccess}');
            if ('${param.userInfoSuccess}' === '1') {
                alert("用户信息修改成功！");
            }
        }
        function userDeleteSuccessTip() {
            console.log("userDeleteSuccessTip");
            console.log('${param.userDeleteSuccess}');
            if ('${param.userDeleteSuccess}' === '1') {
                alert("用户删除成功！");
            }
        }
    </script>
</head>
<body>
<%--    <!-- <c:set var="userRoleSuccess" value="${userRoleSuccess}"/> -->--%>
<%--    <!-- <c:if test="${param.userRoleSuccess == 1}"> -->--%>
    <script>
        userRoleSuccessTip();
    </script>
<%--    <!-- </c:if> -->--%>
<%--    <!-- <c:set var="userInfoSuccess" value="${userInfoSuccess}"/> -->--%>
<%--    <!-- <c:if test="${param.userInfoSuccess == true}"> -->--%>
    <script>
        userInfoSuccessTip();
    </script>
<%--    <!-- </c:if> -->--%>
<%--    <!-- <c:set var="userDeleteuccess" value="${userDeleteuccess}"/> -->--%>
<%--    <!-- <c:if test="${param.userDeleteuccess  == true}"> -->--%>
    <script>
        userDeleteSuccessTip();
    </script>
<%--    <!-- </c:if>  -->--%>
    <div id="fade" class="black_overlay"></div>

    <div id="container">
        <div class="box" style="height: 300px;">
            <h2 style="color: rgb(35, 179, 241); margin-bottom: 2px;">ASCENT TECHNOLOGIES</h2>
            <img src="../../static/img/2.jpg" style="height: 200px; width: auto;" alt="404">
            <div class="box" style="height: 45px; background-color: rgb(8, 90, 157); margin-top: 2px;">
                <ul class="ul-a" style="margin-top: 2px;">
                    <li><a href="#">首页</a></li>
                    <li><a href="#">IT服务</a></li>
                    <li><a href="#">电子商务系统</a></li>
                    <li><a href="#">员工招聘</a></li>
                    <li><a href="#">关于我们</a></li>
                </ul>
            </div>
        </div>

        <div class="box" style="height: 50px;">
            <ul class="ul-a" style="padding-left: 0;">
                <li style="border-left: 1px solid red; border-right: 1px solid red; color: red; padding-right: 12px; padding-left: 10px; margin-left: 0;">
                    <a href="#" style="color: red; padding-right: 2px; margin-right: 2px;">欢迎admin</a>
                </li>
                <li style="border-right: 1px solid red; color: red; margin-right: 12px; padding-right: 12px; margin-left: 0px; padding-left: 9px;">
                    <a href="#" style="color: red; padding-right: 2px; margin-right: 2px;">注销</a>
                </li>
            </ul>
        </div>

        <div>
            <ul id="list-ul">
                <li><a href="/list/user">用户列表</a></li>
                <li><a href="#">商品列表</a></li>
                <li><a href="#">邮件管理</a></li>
            </ul>
        </div>

        <div class="box">
            <table class="tb" style="margin-top: 38px;">
                <tr>
                    <th>用户名</th>
                    <th>Email</th>
                    <th>电话</th>
                    <th>公司名称</th>
                    <th>角色</th>
                    <th>修改</th>
                    <th>角色修改</th>
                    <th>授权商品</th>
                    <th>状态</th>
                    <th>删除</th>
                </tr>
                <!-- 用户信息，插入数据 -->
                <c:forEach items="${userList}" var="userItem" varStatus="userStatus">
                    <tr>
                        <td>${userItem.username}</td>
                        <td>${userItem.email}</td>
                        <td>${userItem.phone}</td>
                        <td>${userItem.company}</td>
                        <td>${userItem.role}</td>
                        <td><button onclick="showInfoDiv('${userItem.username}')">修改</button></td>
                        <!-- 用户信息修改弹窗div -->
                        <div class="div-info" id="div-info-${userItem.username}">
                            <h4 style="height: 35px; width: 115px; margin: 0 auto;">修改用户信息</h4>
                            <form enctype="application/json" action="${pageContext.request.contextPath}/user/info" method="post" autocomplete="off">
                                用户名：
                                <input type="text" name="username" value="${userItem.username}" style="margin-left: 16px; pointer-events: none;">
                                <br>
                                <span style="height: 4px; width: 100%; display: inline-block;"></span>
                                Email：
                                <input type="email" name="email" value="${userItem.email}" style="margin-left: 23px;">
                                <br>
                                <span style="height: 4px; width: 100%; display: inline-block;"></span>
                                电话：
                                <input type="tel" name="phone" value="${userItem.phone}" style="margin-left: 32px;">
                                <span style="height: 4px; width: 100%; display: inline-block;"></span>
                                <br>
                                公司名称：
                                <input type="text" name="company" value="${userItem.company}">
                                <br>
                                <span style="height: 4px; width: 100%; display: inline-block;"></span>
                                <input type="submit" value="确认" onclick="hideInfoDiv('${userItem.username}')" style="position: absolute; top: 179px; left: 239px;">
                            </form>
                            <br>
                            <button onclick="hideInfoDiv('${userItem.username}')" style="margin-left: 83px;">取消</button>
                        </div>

                        <td><button onclick="showRoleDiv('${userItem.username}')" id="button-role-${userItem.username}">角色修改</button></td>
                        <!-- 角色修改弹窗 -->
                        <div class="role" id="div-role-${userItem.username}">
                            <div style="width: 80%; height: 75%; margin: 0 auto;">
                                <h4 style="height: 35px; width: 115px; margin: 0 auto;">修改角色权限</h4>
                                <form action="${pageContext.request.contextPath}/user/role" method="post" autocomplete="off">
                                    当前用户：&nbsp;
                                    <input type="text" id="input-username" name="username" value="${userItem.username}" style="margin-left: 31px; pointer-events: none;">
                                    <br>
                                    <span style="height: 4px; width: 100%; display: inline-block;"></span>
                                    当前用户角色：
                                    <select name="role" id="select-${userItem.username}" value='${userItem.username}'>
                                        <option value="0">普通用户</option>
                                        <option value="1">高权用户</option>
                                        <option value="2">管理员</option>
                                    </select>
                                    <!-- <input type="text" name="role" list="role-list" placeholder="${userItem.role}">
                                    <datalist id="role-list">
                                        <option value="0">普通用户</option>
                                        <option value="1">高权用户</option>
                                        <option value="2">管理员</option>
                                    </datalist> -->
                                    <br>
                                    <span style="height: 8px; width: 100%; display: inline-block;"></span>
                                    <input type="submit" value="确认" onclick="hideRoleDiv('${userItem.username}')">
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                </form>
                                <button onclick="hideRoleDiv('${userItem.username}')">取消</button>
                            </div>
                        </div>
                        <td><button>授权商品</button></td>
                        <td><button>状态</button></td>
                        <td><button id="button-delete-${userItem.username}" onclick="showDeleteTips('${userItem.username}')">删除</button></td>
                        <div class="div-delete" id="div-delete-${userItem.username}">
                            <h4 style="height: 35px; width: 167px; margin: 0 auto;">是否确认删除该用户？</h4>
                            <form action="${pageContext.request.contextPath}/user/deleted" method="post">
                                当前用户：&nbsp;
                                <input type="text" id="input-username" name="username" value="${userItem.username}" style="margin-left: 31px; pointer-events: none;">
                                <br>
                                <span style="height: 8px; width: 100%; display: inline-block;"></span>
                                <input type="submit" value="确认" onclick="hideDeleteDiv('${userItem.username}')" style="position: absolute; top: 115px; left: 274px;">
                            </form>
                            &nbsp; &nbsp; &nbsp; &nbsp;
                            <button onclick="hideDeleteDiv('${userItem.username}')" style="position: absolute; top: 115px; left: 140px;">取消</button>
                        </div>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="box" style="height: 100px;">
            <hr style="border: 4px solid rgba(0, 0, 0, 0.698); padding: 0; margin: 0;">
            <div class="box" style="height: 40px; color: white; background-color: rgb(8, 90, 157); text-align: center; vertical-align: middle; padding-top: 15px;">
                版权所有：xxxxx有限公司 (c)2021-2022 | 京 ICP 备 xxxxxxxxxx 号
            </div>
        </div>
    </div>
</body>
</html>