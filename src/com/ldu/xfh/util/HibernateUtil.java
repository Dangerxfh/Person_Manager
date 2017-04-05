package com.ldu.xfh.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;

@SuppressWarnings("deprecation")
public class HibernateUtil {
	private static SessionFactory sessionFactory;
	private static Session session;

	static {
		
		Configuration config = new Configuration().configure();
		StandardServiceRegistryBuilder ssrb = new StandardServiceRegistryBuilder()
				.applySettings(config.getProperties());
		StandardServiceRegistry ssr=ssrb.build();
		sessionFactory=new AnnotationConfiguration().configure().buildSessionFactory(ssr);
	}
	
	
	public static SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	
	
	public static Session getSession(){
		session=sessionFactory.openSession();
		return session;
	}
	
	
	public static void closeSession(Session session){
		if(session!=null){
			session.close();
		}
	}
}
