package com.ldu.xfh.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.ldu.xfh.entity.User;
import com.ldu.xfh.service.RelService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserRegisterAction extends ActionSupport implements SessionAware {
	private User user;
	private Map<String,Object> session;
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	//注册
		public String userRegister() throws Exception{
			RelService<User> userService=new RelService<User>();
			List<User> userList=userService.getByParam(User.class,"username",user.getUsername());
			if(session.get("user")==null){
				//用户未登陆
				return "logout";
			}
			if(!userList.isEmpty()){
				ActionContext.getContext().put("regerr_msg","用户名已存在！！！");
				return "error";
			}
			else {
				userService.sava(user);
				ActionContext.getContext().put("username",user.getUsername());
				ActionContext.getContext().put("userpass",user.getUserpass());
				return "success";
			}
			
		}
		
	
	
	

}
