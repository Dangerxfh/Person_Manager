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
	  		if( ${linkManList==null} && ${requestScope.linkMans==null}){
	  			$("#alert").show();
	  			$(".row").hide(); 	
	  		}
	  		/* if(${sessionScope.linkManList==null}){
	  			$("#alert").show();
	  			$(".row").hide(); 	
	  		} */
	  		
	  	 	$("[name = selectList]:checkbox").click(
		  		function(){
		  			if($("[name = selectList]:checkbox").is(":checked")){
		  				$("#de_sel").show();
		  			}
		  			else{
		  				$("#de_sel").hide();
		  			}
		  		}
	  		); 
	  		$("#selectAll").toggle(
		  		function(){
		  			$("#de_sel").show();
		  			$("[name = selectList]:checkbox").attr("checked", true);
		  		},
	  		
		  		function(){
		  			$("#de_sel").hide();
		  			$("[name = selectList]:checkbox").attr("checked", false);
		  		}
	  		);
	  		
  		});	
  </script>
  
  <style type="text/css">
  	.selectAll{
  		width: 50px;
  	}
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
	   	<div class="alert alert-warning" id="alert" style="display: none;">
	   		没有联系人！！！
	   	</div>
   		<div class="row">
   			<div class="col-xs-10 col-xs-offset-1">
   			<form action="phonebook/DeleteSelected" method="post">
   				<table class="table table-striped table-bordered">
   				<tr>
   					<th class="selectAll" >全选<input type="checkbox"    id="selectAll"/></th>
   					<th>姓名</th>
   					<th>电话号</th>
   					<th>邮箱</th>
   					<th>地址</th>	
   					<th>操作</th>
   				</tr>
   			<c:forEach items="${requestScope.linkMans==null?linkManList:requestScope.linkMans}" var="linkMan">
   				<tr>
   					<td><input type="checkbox" id="selectOne" name="selectList" value="${linkMan.id}"/></td>
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
   			
   			<button id="de_sel" type="submit" class="btn btn-large btn-danger" style="display: none;">删除</button>
   			</form>
   			
   			
   			</div>
   		</div>
   	</div>
  </body>
</html>
