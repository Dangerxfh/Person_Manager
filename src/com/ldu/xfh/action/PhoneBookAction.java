package com.ldu.xfh.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSON;
import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.ldu.xfh.entity.LinkMan;
import com.ldu.xfh.entity.User;
import com.ldu.xfh.service.RelService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PhoneBookAction extends ActionSupport implements SessionAware,RequestAware{
	
	private LinkMan linkMan;
	private RelService<LinkMan> relService=new RelService<LinkMan>();
	private Map<String,Object> session;
	private Map<String,Object> request;
	private List<String> selectList; 
	
	
	//添加联系人
	public String phoneBookAdd() throws Exception{
		//解决get请求中文乱码
		String lmname=new String(linkMan.getLmname().getBytes("ISO-8859-1"),"UTF-8");
		linkMan.setLmname(lmname);
		linkMan.setUserByUserId((User)session.get("user"));
		List<LinkMan> linkMans=relService.getByParam(LinkMan.class,"lmname",linkMan.getLmname());
		if(session.get("user")==null){
			return "logout";
		}
		if(!linkMans.isEmpty()){
			ActionContext.getContext().put("phone_adderr_msg","联系人已存在");
			return "error";
		}
		
		else{
			
			relService.sava(linkMan);
			List<LinkMan> linkManList=relService.getByParam(LinkMan.class,"userByUserId", (User)session.get("user"));
			session.put("linkManList",linkManList);
			return "success";
		}
		
	}
	
	//模糊查找联系人
	public String phoneBookSearch(){
		Map<String,Object> linklist=new HashMap<String, Object>();
		linklist.put("lmname",linkMan.getLmname());
		List<LinkMan> linkMans=relService.getByParams(2,LinkMan.class, linklist);
		if(session.get("user")==null){
			return "logout";
		}
				
		ActionContext.getContext().put("linkMans",linkMans);
		return "success";	
	}
	
	//更新联系人
	public String phoneBookUpdate() throws Exception{
		//解决get请求中文乱码
				String lmname=new String(linkMan.getLmname().getBytes("ISO-8859-1"),"UTF-8");
				linkMan.setLmname(lmname);
		linkMan.setUserByUserId((User)session.get("user"));
		relService.update(linkMan);
		List<LinkMan> linkManList=relService.getByParam(LinkMan.class,"userByUserId",(User)session.get("user"));
		session.put("linkManList",linkManList);
		return "success";
		
	}
	
	//删除联系人
	public String phoneBookDelete() throws Exception{
		Integer id=Integer.parseInt(ServletActionContext.getRequest().getParameter("id"));
		List<LinkMan> linkMans=relService.getByParam(LinkMan.class,"id",id);
		relService.delete(linkMans.get(0));
		List<LinkMan> linkManList=relService.getByParam(LinkMan.class,"userByUserId",(User)session.get("user"));
		session.put("linkManList",linkManList);
		
		return "success";
	}
	
	//删除选择项
	public String phoneBookDeleteSelected() throws Exception{
		for(String id:getSelectList()){
			List<LinkMan> userList=relService.getByParam(LinkMan.class,"id",Integer.parseInt(id));
			relService.delete(userList.get(0));
			List<LinkMan> linkManList=relService.getByParam(LinkMan.class,"userByUserId",(User)session.get("user"));
			session.put("linkManList",linkManList);
		}
		return "success";
	}
	
	
	public List<String> getSelectList() {
		return selectList;
	}

	public void setSelectList(List<String> selectList) {
		this.selectList = selectList;
	}

	public LinkMan getLinkMan() {
		return linkMan;
	}
	public void setLinkMan(LinkMan linkMan) {
		this.linkMan = linkMan;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		this.session=session;
	}

	@Override
	public void setRequest(Map<String, Object> request) {
		this.request=request;
	}
	
}
