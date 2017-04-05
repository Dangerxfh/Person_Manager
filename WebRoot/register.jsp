<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册</title>
    <link rel="shortcut icon" href="img/logo.ico"/>

	<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">


  </head>
  
  <body>
    	<div class="container">
    		<h1>个人信息管理系统--用户注册</h1>
    		<hr>
    			<s:if test="#regerr_msg!=null">
			  		<div class="alert alert-danger">
			  			<s:property value="#regerr_msg"/>
			  		</div>
  				</s:if>
  				
    		<form action="user/register">
    			<div class="form-group">
    				<s:fielderror name="user.username"/>
    				UserName:<input name="user.username" class="form-control"  required="required" placeholder="userName"/>
    				
    			</div>
    			<div class="form-group">
    				<s:fielderror name="user.userpass"/>
    				PassWord:<input type="password" name="user.userpass"  required="required" class="form-control" placeholder="passWord"/>
    			</div>
    			<div class="form-group">	
    				<s:fielderror name="user.sex"/>				
	    			Men:<input type="radio" name="user.sex"  required="required" value="Men"/>	    			
	    			Women:<input type="radio" name="user.sex"  required="required" value="Women"/>

    			</div>	
    			<div class="form-group">
    				<s:fielderror name="user.age"/>
    				Age:<input name="user.age"  required="required" class="form-control" placeholder="Age"/>
    			</div>
    			
    			<div class="form-group">
    				<s:fielderror name="user.email"/>
    				Email:<input type="email" name="user.email"   required="required" class="form-control" placeholder="Email"/>
    			</div>
    			<div class="form-group">
    				<s:fielderror name="user.birth"/>
    				BirthDay:<input  type="date" name="user.birth"  required="required" class="form-control" placeholder="BirthDay"/>
    			</div>
    			<div class="form-group">
    				<s:fielderror name="user.phone"/>
    				Phone:<input name="user.phone"  required="required" class="form-control" placeholder="Phone"/>
    			</div>
    			<div class="form-group">
    				<s:fielderror name="user.address"/>
    				Address:
    				<input name="user.address" required="required" class="form-control" placeholder="Detail Address"/>
    			</div>
    			
    			<div class="form-group">
    				<button type="submit" class="btn btn-large btn-primary">提交</button>
    			</div>
    		</form>
    	</div>
  </body>
</html>
