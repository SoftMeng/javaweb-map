package com.zr.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.zr.model.Fin;

public class FinDao {
	private static FinDao instance = null;
	/**
	 * 返回一个MesDao实例
	 * @return
	 */
	public static FinDao getInstance(){
		if(instance==null) instance = new FinDao();
		return instance;
	}
	
	public boolean saveFin(Fin fin){
		boolean result = false;//标记是否保存成功
		Session session = null;//创建Session实例
		Transaction trans = null;//创建事务
		try{
			session = SessionFactoryProvider.getSession();//创建Session实例
			
			trans=session.beginTransaction();//获取事务
			trans.begin();//开始事务
			session.save(fin);//保存对象
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
	public List<Fin> getFinByget(String finsend){
		List<Fin> fin = null;
		Session session = null;
		try{
			session = SessionFactoryProvider.getSession();	//创建Session实例
			String hql=" from Fin where finSend=:finsend";//hql语句
			Query query=session.createQuery(hql);//创建query对象
			query.setString("finsend",finsend);
			if(query.list()!=null&&query.list().size()>0){//判断返回的list集合是否存在用户信息对象
				for(int i =0; i<query.list().size();i++){
					fin=(List<Fin>)query.list();
				}
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			session.close();
		}
		return fin;
	}
	
	public boolean deleteacc(String finsend, String finget){
		Session session=null; 
		Transaction trans=null;
		try{
			session=SessionFactoryProvider.getSession();//创建session实例
			trans=session.beginTransaction();//获取事务
			trans.begin();//开始事务
			String hql = "delete from Fin where finSend=:finsend and finGet=:finget";//HQL语句
			Query query=session.createQuery(hql);//创建query对象
			query.setString("finsend", finsend);//HQL语句的参数赋值
			query.setString("finget", finget);//HQL语句的参数赋值
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
