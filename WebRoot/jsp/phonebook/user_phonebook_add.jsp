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
    
    <title>添加联系人</title>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
  </head>
  
  <body>
    	<s:include value="user_phonebook_top.jsp"></s:include>
    	
    	<div class="container">
    		<form action="phonebook/Add">
    			<div class="form-group">
    				姓名:<input name="linkMan.lmname" required="required" placeholder="LinkManName" class="form-control"/>
    			</div>
    			
    			<div class="form-group">
    				电话:<input name="linkMan.lmphone" pattern="^[0-9]{11}$"  title="电话号码应为11位数字" required="required" placeholder="LinkManPhone" class="form-control"/>
    			</div>
    			<div class="form-group">
    				地址:<input name="linkMan.lmaddress" required="required" placeholder="LinkManAddress" class="form-control"/>
    			</div>
    			<div class="form-group">
    				邮箱:<input name="linkMan.lmemail" type="email" required="required" placeholder="LinkManEamil" class="form-control"/>
    			</div>
    			<div class="form-group">
    				<button type="submit" class="btn btn-large btn-success">添加</button>
    			</div>
    		</form>
    	</div>
  </body>
</html>
