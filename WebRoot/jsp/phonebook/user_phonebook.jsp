<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html lang="zh-CN">
  <head>
    <base href="<%=basePath%>">
    
    <title>联系人</title>

  </head>
  <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="js/jquery-1.5.1.js"></script>
  <script type="text/javascript">
  		$(document).ready(function(){
	  		$("#user_top_h2").text("联系人列表");
  		});	
  </script>
  
  <style type="text/css">
  	
 	.phonebook{
 		margin-top: 20px;
 	}
 	.opreation{
 		width: 170px;
 	}
  </style>
  <body>
   	<s:include value="user_phonebook_top.jsp"></s:include>
   	<div class="phonebook container">
   		<div class="row">
   			<div class="col-xs-10 col-xs-offset-1">
   			<table class="table table-striped table-bordered">
   				<tr>
   					<th>姓名</th>
   					<th>电话号</th>
   					<th>邮箱</th>
   					<th>地址</th>	
   					<th>操作</th>
   				</tr>
   			<c:forEach items="${requestScope.linkMans==null?linkManList:requestScope.linkMans}" var="linkMan">
   				<tr>
   					<td>${linkMan.lmname}</td>
   					<td>${linkMan.lmphone}</td>
   					<td>${linkMan.lmemail}</td>
   					<td>${linkMan.lmaddress}</td>
   					<td class="opreation">
   							<a href="jsp/phonebook/user_phonebook_update.jsp?id=${linkMan.id}" type="button" class="btn btn-sm btn-warning">更新</a> 
   							<a href="phonebook/Delete?id=${linkMan.id }" type="button" class="btn btn-sm btn-danger">删除</a>	
   					</td>
   				</tr>
   			</c:forEach>
   			</table>
   			</div>
   		</div>
   	</div>
  </body>
</html>
