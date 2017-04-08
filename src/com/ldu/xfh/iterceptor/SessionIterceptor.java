package com.ldu.xfh.iterceptor;

import com.ldu.xfh.action.LoginAction;
import com.ldu.xfh.entity.User;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class SessionIterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		 ActionContext ctx = ActionContext.getContext(); 
		 Action action = (Action) actionInvocation.getAction();
		 if (action instanceof LoginAction) {  
	            return actionInvocation.invoke();  
	        }  
	        User user = (User) ctx.getSession().get("user");
	        if (user == null) 
	            return "timeoutSession";
	            return actionInvocation.invoke();        
	}

}
