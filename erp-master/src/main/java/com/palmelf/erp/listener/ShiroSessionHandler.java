package com.palmelf.erp.listener;


import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListener;

public class ShiroSessionHandler implements SessionListener
{

	public void onStart(Session session )
	{
		// TODO Auto-generated method stub
		
	}

	public void onStop(Session session )
	{
		System.out.println("---->"+session.getTimeout());
		EhCacheManager sdf=new EhCacheManager();
		sdf.getCache("shiro.authorizationCache");
		sdf.destroy();
	}

	public void onExpiration(Session session )
	{
		// TODO Auto-generated method stub
		
	}

}
