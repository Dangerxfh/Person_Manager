package com.ldu.xfh.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.attribute.standard.Severity;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.ldu.xfh.entity.FileEntity;
import com.ldu.xfh.entity.User;
import com.ldu.xfh.service.RelService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FileAction extends ActionSupport implements SessionAware{

	private String uploadFileName;
	private String uploadContentType;
	private File upload;
	private String savePath;
	private String path;
	private Map<String,Object> session;
	private FileEntity fileEntity;
	private RelService<FileEntity> relService=new RelService<FileEntity>(){};
	

	
	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getSavePath() throws Exception{
		return ServletActionContext.getServletContext().getRealPath(savePath);
	}

	public void setSavePath(String savaPath) {
		this.savePath = savaPath;
	}

	
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	public InputStream getInputStream() throws Exception{
		Integer id=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		List<FileEntity> fileEntities=relService.getByParam(FileEntity.class,"id",id);
		String filename=fileEntities.get(0).getFlname();
		return ServletActionContext.getServletContext().getResourceAsStream(path+"/"+filename);
	}
	
	//下载文件
		public String fileDownload(){
			return "success";
		}
	
	//文件上传
	public String fileUpload()throws Exception{
		FileOutputStream fos=new FileOutputStream(getSavePath()+"\\"+getUploadFileName());
		//定义输出流对象
		FileInputStream fis=new FileInputStream(getUpload());
		byte[] buffer =new byte[1024];
		int len=0;
		while((len=fis.read(buffer))>0){
			fos.write(buffer,0,len);
		}
		fos.close();
		//将文件属性保存到数据库
		fileEntity.setFlname(getUploadFileName());
		fileEntity.setFllength(String.valueOf(getUpload().length()));
		fileEntity.setFltype(getUploadContentType());
		fileEntity.setUserByUserId((User)session.get("user"));
		relService.sava(fileEntity);
		
		//更新文件列表
		List<FileEntity> fileList=(List)session.get("fileList");
		fileList.add(fileEntity);
		session.put("fileList",fileList);
		return "success";
	}
	
	
	//查找文件
	public String fileSearch(){
		Map<String,Object> fileparams=new HashMap<String, Object>();
		fileparams.put("fltitle",fileEntity.getFltitle());
		List<FileEntity> files=relService.getByParams(2,FileEntity.class,fileparams);
		
		ActionContext.getContext().put("files",files);
		return "success";
	}

	//删除文件
	public String fileDelete() throws Exception{
		//清除数据库记录
		Integer id=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		List<FileEntity> fileEntities=relService.getByParam(FileEntity.class,"id",id);
		relService.delete(fileEntities.get(0));
		//删除路径下的文件
		File file=new File(getSavePath()+"/"+fileEntities.get(0).getFlname());
		if(file.exists())
			file.delete();
		List<FileEntity> fileList=relService.getByParam(FileEntity.class,"userByUserId",(User)session.get("user"));
		session.put("fileList",fileList);
		return "success";
	}
	
	public FileEntity getFileEntity() {
		return fileEntity;
	}

	public void setFileEntity(FileEntity fileEntity) {
		this.fileEntity = fileEntity;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	
}
