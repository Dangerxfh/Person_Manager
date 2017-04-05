<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>文件列表</title>
   <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
  </head>
  <style type="text/css">
  	
 	.file{
 		margin-top: 20px;
 	}
 	.opreation{
 		width: 170px;
 	}
  </style>
  <body>
  <c:import url="user_file_top.jsp"></c:import>
    <div class="file container">
    	<div class="row">
   			<div class="col-xs-10 col-xs-offset-1">
   			<table class="table table-striped table-bordered">
   				<tr>
   					<th>文件标题</th>
   					<th>文件名字</th>
   					<th>文件类型</th>
   					<th>文件大小</th>	
   					<th>操作</th>
   				</tr>
   			<c:forEach items="${requestScope.files==null?fileList:requestScope.files}" var="file">
   				<tr>
   					<td>${file.fltitle}</td>
   					<td>${file.flname}</td>
   					<td>${file.fltype}</td>
   					<td>${file.fllength}K</td>
   					<td class="opreation">
   							<a href="file/Download?id=${file.id}" type="button" class="btn btn-sm btn-warning">下载</a> 
   							<a href="file/Delete?id=${file.id }" type="button" class="btn btn-sm btn-danger">删除</a>	
   					</td>
   				</tr>
   			</c:forEach>
   			</table>
   			</div>
   		</div>
    </div>
  </body>
</html>
