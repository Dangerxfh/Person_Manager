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
	@ManyToOne
	private User user;
	private Map<String, Object> session;
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
		List <User> userList=new RelService<User>().getByParams(1,User.class,params);
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
	
	//更新用户信息
	public String userUpdateMsg()throws Exception{
		new RelService<User>().update(user);
		session.put("user",user);
		return "success";
	}
	
	//更新密码
	public String userUpdatePass()throws Exception{
		RelService<User> r=new RelService<User>();
		//先查找出数据库中对应id的用户
		User u=r.getByParam(User.class,"id",user.getId()).get(0);
		//找不到用户，说明数据库中没有该用户或用户没有登陆
		if(u==null)
			return "error";
		//修改密码
		u.setUserpass(user.getUserpass());
		r.update(u);
		return "success";
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

}
