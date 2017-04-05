<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改联系人</title>
     <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

  </head>
  
  <body>
    <c:import url="user_phonebook_top.jsp"></c:import>
    <div class="container">
    <c:forEach items="${sessionScope.linkManList}" var="linkMan">
    	<c:if test="${linkMan.id==param.id }">
    			<div class="row">
   		<div class="col-xs-10 col-xs-offset-1">
   			<form action="phonebook/Update">
			<!--  指定user的id,因为hibernate的session缓存中的user.id为空  -->
   			<input type="hidden" name="linkMan.id" value="${linkMan.id}"/>
   			
   		
    			<div class="form-group">
    				姓名:<input name="linkMan.lmname" value="${linkMan.lmname }" class="form-control"  required="required" placeholder="LinkManName"/>
    				
    			</div>
    			<div class="form-group">
    				电话:<input name="linkMan.lmphone" value="${linkMan.lmphone }"  required="required" class="form-control" placeholder="Phone"/>
    			</div>
    			<div class="form-group">

    				Email:<input type="email" name="linkMan.lmemail"  value="${linkMan.lmemail }" required="required" class="form-control" placeholder="Email"/>
    			</div>
    			
    			<div class="form-group">
    				Address:
    				<input name="linkMan.lmaddress" value="${linkMan.lmaddress }" required="required" class="form-control" placeholder="Detail Address"/>
    			</div>
    			
    			<div class="form-group">
    				<button type="submit" class="btn btn-large btn-primary">提交</button>
    			</div>
    		</form>
   		</div>
   	</div>
    	</c:if>
    </c:forEach>	
   	</div>
  </body>
</html>
