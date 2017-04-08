<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags"  %>
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
  <script src="js/jquery-1.5.1.js"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
  		if(${requestScope.files==null} && ${fileList==null}){
	  			$("#alert").show();
	  			$(".row").hide(); 	
		 }
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
    	<div class="alert alert-warning" id="alert" style="display: none;">
	   		没有文件！！！
	   	</div>
		    	
    	<div class="row">
   			<div class="col-xs-10 col-xs-offset-1">
   			<form action="file/DeleteSelected" method="post">
   			<table class="table table-striped table-bordered">
   				<tr>
   					<th class="selectAll" >全选<input type="checkbox"    id="selectAll"/></th>
   					<th>文件标题</th>
   					<th>文件名字</th>
   					<th>文件类型</th>
   					<th>文件大小</th>	
   					<th>操作</th>
   				</tr>
   			<c:forEach items="${requestScope.files==null?fileList:requestScope.files}" var="file">
   				<tr>
   					<td><input type="checkbox" id="selectOne" name="selectList" value="${file.id}"/></td>
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
   				<button id="de_sel" type="submit" class="btn btn-large btn-danger" style="display: none;">删除</button>	
   			</form>
   			</div>
   		</div>
    </div>
  </body>
</html>
