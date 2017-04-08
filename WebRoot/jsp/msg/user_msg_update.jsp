<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改信息</title>
    
	<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
  </head>
  <script src="js/jquery-1.5.1.js"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
  		$(window).load(function(){
	  		$("#user_top_h2").text("用户信息修改");
  		});
  	});	
  </script>
  <body>
  <s:include value="user_msg_top.jsp"></s:include>
   	<div class="container">
   	<div class="row">
   		<div class="col-xs-10 col-xs-offset-1">
   			<form action="user/UpdateMsg" method="post">
				<!--  指定user的id,因为hibernate的session缓存中的user.id为空  -->
   				<input type="hidden" name="user.id" value="${sessionScope.user.id}"/>
    			
    			<div class="form-group">
    				UserName:<input name="user.username" class="form-control" pattern="^[0-9a-zA-Z]{2,16}$"  title="密码应为2~16的字母或数字" value="${sessionScope.user.username}" required="required" placeholder="userName"/>
    			</div>
    			
    			<div class="form-group">					
	    			Men:<input type="radio" name="user.sex"  required="required" value="Men"/>	    			
	    			Women:<input type="radio" name="user.sex"  required="required" value="Women"/>

    			</div>	
    			
    			<div class="form-group">
    				Age:<input name="user.age"  required="required" value="${sessionScope.user.age}" class="form-control" placeholder="Age"/>
    			</div>
    			
    			<div class="form-group">
    				Email:<input type="email" name="user.email" value="${sessionScope.user.email}"  required="required" class="form-control" placeholder="Email"/>
    			</div>
    			
    			<div class="form-group">
    				BirthDay:<input  type="date" name="user.birth" value="${sessionScope.user.birth}" required="required" class="form-control" placeholder="BirthDay"/>
    			</div>
    			
    			<div class="form-group">
    				Phone:<input name="user.phone" value="${sessionScope.user.phone}" pattern="^[0-9]{11}$"  title="电话号码应为11位数字" required="required" class="form-control" placeholder="Phone"/>
    			</div>
    			
    			<div class="form-group">
    				Address:
    				<input name="user.address" value="${sessionScope.user.address}" required="required" class="form-control" placeholder="Detail Address"/>
    			</div>
    			
    			<div class="form-group">
    				<button type="submit" class="btn btn-large btn-primary">提交</button>
    			</div>
    		</form>
   		</div>
   	</div>
   		
   	</div>
  </body>
</html>
