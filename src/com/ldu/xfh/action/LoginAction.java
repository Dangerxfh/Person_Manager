package com.ldu.xfh.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ldu.xfh.entity.FileEntity;
import com.ldu.xfh.entity.LinkMan;
import com.ldu.xfh.entity.User;
import com.ldu.xfh.service.RelService;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware{
	
	private User user;
	private Map<String, Object> session;
	private RelService<User> relService=new RelService<User>(); 
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	//登陆
		public String userLogin() throws Exception{
			Map<String,Object> params=new HashMap<String, Object>();
			params.put("username",user.getUsername());
			params.put("userpass",user.getUserpass());
			//调用多参数查询
			List <User> userList=relService.getByParams(1,User.class,params);
			if(!userList.isEmpty()){
				User user=userList.get(0);
				//将user通过Map注入到页面
				session.put("user",user);
				
				//将联系人列表注入到页面
				List<LinkMan> linkManList=new RelService<LinkMan>().getByParam(LinkMan.class,"userByUserId",user);
				session.put("linkManList",linkManList);
				
				//将文件列表注入到页面
				List<FileEntity> fileList=new ArrayList<FileEntity>();
				fileList=new RelService<FileEntity>().getByParam(FileEntity.class,"userByUserId",user);
				session.put("fileList",fileList);
				
				return "success";
			}
				return "error";
		}
}
