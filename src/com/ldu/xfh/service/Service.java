package com.ldu.xfh.service;

import java.util.List;
import java.util.Map;

public interface Service<T> {
	//保存
	public void sava(T t);
	
	//根据具体值查询
	public List<T> getByParam(Class t,String param,Object value)throws Exception;
	
	//多参数查询
	public  List<T> getByParams(int type,Class t,Map<String,Object> params);
	
	//删除
	public void delete(T t);
	
	//修改
	public void update (T t);
	
}
