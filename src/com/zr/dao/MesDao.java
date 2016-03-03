package com.zr.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.zr.model.Message;

public class MesDao {
	private static MesDao instance = null;
	/**
	 * 返回一个MesDao实例
	 * @return
	 */
	public static MesDao getInstance(){
		if(instance==null) instance = new MesDao();
		return instance;
	}
	
	public boolean saveMes(Message mes){
		boolean result = false;//标记是否保存成功
		Session session = null;//创建Session实例
		Transaction trans = null;//创建事务
		try{
			session = SessionFactoryProvider.getSession();//创建Session实例
			
			trans=session.beginTransaction();//获取事务
			trans.begin();//开始事务
			session.save(mes);//保存对象
			trans.commit();//提交事务
			result=true;
		}catch(Exception ex){
			//如果出现异常事务回滚
			if(trans!=null&&trans.isActive()) trans.rollback();
			ex.printStackTrace();
		}finally{
			session.close();
		}
		return result;
	}
	@SuppressWarnings("unchecked")
	public List<Message> getMesByget(String mesget){
		List<Message> mes = null;
		Session session = null;
		try{
			session = SessionFactoryProvider.getSession();	//创建Session实例
			String hql=" from Message where mesGet=:mesget";//hql语句
			Query query=session.createQuery(hql);//创建query对象
			query.setString("mesget", mesget);
			if(query.list()!=null&&query.list().size()>0){//判断返回的list集合是否存在用户信息对象
				for(int i =0; i<query.list().size();i++){
					mes=(List<Message>)query.list();
				}
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			session.close();
		}
		return mes;
	}
	
	public boolean deleteacc(String messend, String mesget){
		Session session=null; 
		Transaction trans=null;
		try{
			session=SessionFactoryProvider.getSession();//创建session实例
			trans=session.beginTransaction();//获取事务
			trans.begin();//开始事务
			String hql = "delete from Message where mesGet=:mesget and mesSend=:messend";//HQL语句
			Query query=session.createQuery(hql);//创建query对象
			query.setString("messend", messend);//HQL语句的参数赋值
			query.setString("mesget", mesget);//HQL语句的参数赋值
			int i=query.executeUpdate();//执行删除，返回删除所影响的行数
			trans.commit();///提交事务
			if(i==1) 
				return true;
		}catch(Exception ex){
			if(trans!=null&&trans.isActive()) 
				trans.rollback();//出现异常将事务回滚	
			ex.printStackTrace();
		}finally{
			session.close();//关闭Session
		}
		return false;
	}
}
