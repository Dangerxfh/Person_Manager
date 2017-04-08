<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
  <head>
  
    <link rel="shortcut icon" href="img/logo.ico"/>
    <title>Login</title>
	
		 <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
		 <script src="js/jquery-1.5.1.js"></script>	
  </head>
  <script type="text/javascript">
  	$(function(){
  		$("input").click(function(){
  			$("#alert").hide();
  		});
  	});
  </script>
  <body>
  <div class="container">
  <h1>个人信息管理系统--用户登录</h1>
  	<hr>
  		
  			<c:if test="${param.log_status=='error'}">
  				<div class="alert alert-danger" id="alert">
  					用户名或密码错误！！！
  				</div>
  			</c:if>
  		
  		
  		<form action="user/Login" method="post">
  		<div class="form-group">
  			UserName:<input name="user.username" placeholder="UserName" class="form-control"  value='<s:property value="#username"/>'/>
  			<s:fielderror name="user.username"></s:fielderror>
  		</div>
  		
  		<div class="form-group">
  			PassWord:<input type="password" name="user.userpass" placeholder="PassWord" class="form-control" value='<s:property value="#userpass"/>'/>
  			<s:fielderror name="user.userpass"></s:fielderror>
  		</div>
    	
    	<div class="form-group">
    		 <button type="submit" class="btn btn-large btn-success">登陆</button>
    		 <a href="register.jsp"><button type="button" class="btn btn-large btn-info">注册</button></a>
    	</div>	
    	
    	</form>
  </div>
    	
  </body>
</html>
