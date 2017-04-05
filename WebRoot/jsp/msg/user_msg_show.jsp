<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html  lang="zh-CN">
  <head>
    <base href="<%=basePath%>">
    
    <title>个人信息</title>
    
			
  </head>
  <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="js/jquery-1.5.1.js"></script>
  <script type="text/javascript" >
  	$(document).ready(function(){
  		$(window).load(function(){
	  		$("#user_top_h2").text("用户信息");
  		});
  	});	
  </script>
  <style type="text/css">
  	.table tr td:FIRST-CHILD{
  		width: 30%;
  	}
  	.show_div{
  		margin-top: 20px;
  	}
  </style>
  <body>
    	<s:include value="user_msg_top.jsp"></s:include>
    	<div class="show_div container">
	    	<div class="row">
		    	<div class="col-xs-8 col-xs-offset-2">
		    		<table class="table table-striped table-bordered">   			
		    				<tr>
		    					<td>属性</td>
		    					<td>信息</td>
		    				</tr> 
		    				<tr>
		    					<td>用户名</td>
		    					<td>${sessionScope.user.username}</td>
		    				</tr>
		    				<tr>
		    					<td>性别</td>
		    					<td>${sessionScope.user.sex}</td>
		    				</tr> 
		    				<tr>
		    					<td>年龄</td>
		    					<td>${sessionScope.user.age}</td>
		    				</tr> 
		    				<tr>
		    					<td>生日</td>
		    					<td>${sessionScope.user.birth}</td>
		    				</tr> 
		    				<tr>
		    					<td>Email</td>
		    					<td>${sessionScope.user.email}</td>
		    				</tr>  			
		    				<tr>
		    					<td>电话号码</td>
		    					<td>${sessionScope.user.phone}</td>
		    				</tr> 
		    				<tr>
		    					<td>地址</td>
		    					<td>${sessionScope.user.address}</td>
		    				</tr> 
		    		</table>
		    	</div>
	    	
	    		
	    	</div>
    		
    	</div>
  </body>
</html>
