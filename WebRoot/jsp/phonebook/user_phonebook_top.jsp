<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html  lang="zh-CN">
  <head>
    <base href="<%=basePath%>">
    <link rel="shortcut icon" href="<%=basePath%>img/logo.ico"/>
    <title>个人信息</title>
			 <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
	
  </head>
  
  <style type="text/css">
  	.navbar-inverse{
  		font-size:17px;
  		height: 50px;
  	}
  	.navbar-inverse p{
  		width: 96px;
  	}
  	.navbar-right{
  		margin-right: 20px;
  	}
  	
  	.b{
  		margin-left: 180px;
  	}
  </style>
  <body>
    	<div class="container top_div">
    		<h1>个人信息管理系统</h1>
    		<nav class="navbar navbar-inverse text-center">
			 	<p class="navbar-text"><a href="jsp/msg/user_msg_show.jsp" class="navbar-link">Home</a></p>
			 	<p class="navbar-text"><a href="jsp/phonebook/user_phonebook.jsp" class="navbar-link">Phone book </a></p>
			 	<p class="navbar-text"><a href="jsp/gender/user_genser.jsp" class="navbar-link">Gender</a></p>
			 	<p class="navbar-text"><a href="jsp/file/user_file.jsp" class="navbar-link">File</a></p>
			 	<p class="navbar-text"><a href="./index.jsp" class="navbar-link">Exit</a></p>
			 	<p class="navbar-text navbar-right"><a href="jsp/msg/user_msg_show.jsp" class="navbar-link">${sessionScope.user.username }</a></p>
			</nav>
			<div id="user_phone">
				<h2 id="user_top_h2"></h2>
				<hr>
	    		<a href="jsp/phonebook/user_phonebook.jsp" type="button" id="top_a1" class="b btn btn-large btn-primary">查看联系人</a>
	    		<a href="jsp/phonebook/user_phonebook_add.jsp" type="button" id="top_a2"  class="b btn btn-large btn-success">添加联系人</a>
	    		<form action="phonebook/Search" style="display: inline;     margin-left: 190px;">
	    			<input style="width: 150px;" placeholder="查找联系人" name="linkMan.lmname"/>
	    			<button type="submit" class="btn btn-sm btn-info">查找</button>
    			</form>
				
			</div>
    	
    	</div>
  </body>
</html>
