<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>文件上传</title>
   	<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="js/jquery-1.5.1.js"></script>
	<style type="text/css">
	.wwFormTable{
		 margin-top: -90px;
	}
	.btn_file{
		margin-top: 60px;
	}
	.alert{
		margin-top: 15px;
	}
	</style>
	<script type="text/javascript">
	$(function(){
		$("#btn_upload").click(function(){
			if($("#filename").val()==""){
				$("#alert").show();
				return false;
			}
					
		});
		
		$("#filename").click(function(){
			$("#alert").hide();
		});
	});	
	</script>
  </head>
  
  <body>
  <c:import url="user_file_top.jsp"></c:import>
    <div class="container">
    <div class="alert alert-danger" style="display: none;" id="alert">
    	请选择文件！！！
    </div>
    	<s:form action="file/Upload" enctype="multipart/form-data">
    		<div class="form-group">
    			文件标题：<input name="fileEntity.fltitle" class="form-control" required="required"/>
    		</div>
    		<div class="fileupload">
    			<s:file name="upload" class="fileupload" required="required" id="filename"/>
    		</div>
    		
    		<div class="btn_file form-group">
    			<button class="btn btn-large btn-success" type="submit" id="btn_upload">上传</button>
    			<button class="btn btn-large btn-warning" type="reset">清空</button>
    		</div>
    	</s:form>
    </div>
  </body>
</html>
