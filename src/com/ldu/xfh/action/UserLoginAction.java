package com.ldu.xfh.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import org.apache.struts2.interceptor.SessionAware;

import com.ldu.xfh.entity.FileEntity;
import com.ldu.xfh.entity.LinkMan;
import com.ldu.xfh.entity.User;
import com.ldu.xfh.service.RelService;
import com.ldu.xfh.service.Service;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
@Entity
public class UserLoginAction extends ActionSupport implements SessionAware{
	private User user;
	private Map<String, Object> session;
	private RelService<User> relService=new RelService<User>(); 
	
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}
	//更新用户信息
	public String userUpdateMsg()throws Exception{
		User u=relService.getByParam(User.class,"id",user.getId()).get(0);
		user.setUserpass(u.getUserpass());
		relService.update(user);
		session.put("user",user);
		return "success";
	}
	
	//更新密码
	public String userUpdatePass()throws Exception{
		//先查找出数据库中对应id的用户
		User u=relService.getByParam(User.class,"id",user.getId()).get(0);
		//修改密码
		u.setUserpass(user.getUserpass());
		relService.update(u);
		return "success";
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
