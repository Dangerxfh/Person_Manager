<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码</title>
  </head>
   <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="js/jquery-1.5.1.js"></script>
	<script type="text/javascript">
	  	$(function(){
	  		$(window).load(function(){
		  		$("#user_top_h2").text("用户密码修改");
	  		});
	  		
	  		$("#btn").click(function (){
	  			var p1=$("#p1").val();
				var p2=$("#p2").val();
				if(p1!=p2){
					$("#alert").show();
					return false;
				} 
	  		});
	  		
	  		$("#p1,#p2").click(function(){
	  			$("#alert").hide();
	  		});
	  	});	
 	</script>
  <body>
    	<s:include value="user_msg_top.jsp"></s:include>
    	<div class="container">
    	<div class="alert alert-danger" style="display: none;" id="alert">
    			两次密码输入不一致！！！
    	</div>
    	
    	<div class="row">
    		<div class="col-xs-10 col-xs-offset-1">
    			<form action="user/UpdatePass">
    		<input type="hidden" name="user.id" value="${sessionScope.user.id}"/>
    			<div class="form-group">
    				PassWord:<input type="password"  name="user.userpass" pattern="^[0-9a-zA-Z]{2,16}$"  title="密码应为2~16的字母或数字" class="form-control"  required="required" id="p1"/>
    			</div>
    			<div class="form-group">
    				PassWord Again:<input type="password" class="form-control" pattern="^[0-9a-zA-Z]{2,16}$"  title="密码应为2~16的字母或数字" required="required" id="p2"/>
    			</div>
    			
    			<div class="form-group">
    				<button type="submit" id="btn" class="btn btn-large btn-success">Submit</button>
    			</div>
    		</form>
    		</div>
    	</div>
    		
    		
    	</div>
  </body>
</html>
