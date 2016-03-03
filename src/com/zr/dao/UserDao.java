package com.zr.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.zr.model.User;

/**
 * 处理用户注册登录的DAO管理类
 * @author ZR
 */
public class UserDao {
	private static UserDao instance = null;
	/**
	 * 返回一个UserDao实例
	 * @return
	 */
	public static UserDao getInstance(){
		if(instance==null) instance = new UserDao();
		return instance;
	}
	/**
	 * 保存用户注册信息
	 * @param user
	 * @return
	 */

public boolean saveUser(User user){
	boolean result = false;//标记是否保存成功
	Session session = null;//创建Session实例
	Transaction trans = null;//创建事务
	try{
		session = SessionFactoryProvider.getSession();//创建Session实例
		
		trans=session.beginTransaction();//获取事务
		trans.begin();//开始事务
		session.save(user);//保存对象
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
	/**
	 * 修改用户注册信息
	 * @param user
	 * @return
	 */
	public boolean updateUser(User user){
		boolean result = false;//标记是否保存成功
		Session session = null;//创建Session实例
		Transaction trans = null;//创建事务
		try{
			//从SessionFactory工厂类总获取Session实例
			session = SessionFactoryProvider.getSession();
			trans=session.beginTransaction();//获取事务
			trans.begin();//开始事务
			session.update(user);//更新对象
			trans.commit();//提交事务
			result=true;
		}catch(Exception ex){
			//如果出现异常事务回滚
			if(trans!=null&&trans.isActive()) trans.rollback();
			ex.printStackTrace();
		}
		return result;
	}
	/**
	 * 查询个人用户信息
	 * @return
	 */
	public User selectUserById(String userId){
		User user = null;
		Session session = null;
		try{
			//从SessionFactory工厂类总获取Session实例
			session = SessionFactoryProvider.getSession();
			Query query = session.createQuery("from User where userId=:id");
			query.setString("id", userId);
			//从查询的结果集合中获取到User实例
			user = (User)query.list().get(0);
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			session.close();//关闭session
		}
		return user;
	}
	/**
	 * 验证用户登录
	 * @param userName：用户名
	 * @param userPwd：密码
	 * @return
	 */
	public boolean enter(String userName,String userPwd){
		boolean result = false;
		Session session = null;
		try{
			//从SessionFactory工厂类总获取Session实例
			session = SessionFactoryProvider.getSession();	
			//查询是否有该用户的hql语句
			String hql="select count(userId) from User where userName=:name and userPwd=:pwd";
			//创建query对象
			Query query=session.createQuery(hql);
			//设置用户名参数
			query.setString("name", userName);
			//设置密码参数
			query.setString("pwd", userPwd);
			//返回的int值，查询用户的个数
			int userCount=Integer.parseInt(query.list().get(0).toString());
			if(userCount==1) result = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			session.close();
		}
		return result;
	}
	/**
	 * 根据用户名和密码查找用户对象
	 * @param name 用户名
	 * @param pwd 密码
	 * @return
	 */
	
public User getUserByNameAndPwd(String name,String pwd){
	User user = null;
	Session session = null;
	try{
		session = SessionFactoryProvider.getSession();	//创建Session实例
		String hql=" from User where userName=:name and userPwd=:pwd";//hql语句
		Query query=session.createQuery(hql);//创建query对象
		query.setString("name", name);//设置用户名参数
		query.setString("pwd", pwd);//设置密码参数
		if(query.list()!=null&&query.list().size()>0){//判断返回的list集合是否存在用户信息对象
			user=(User)query.list().get(0);
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		session.close();
	}
	return user;
}
	/**
	 * 根据用户注册输入的用户名
	 * 判断该用户是否存在
	 * @param name
	 * @return 存在返回true,不存在返回false
	 */
	
public boolean getUserByName(String name){
	boolean result = false;
	Session session = null;
	try{	
		session = SessionFactoryProvider.getSession();	//创建Session实例
		
		String hql=" from User where userName=:name";	//查询是否有该用户的hql语句
		Query query=session.createQuery(hql);			//创建query对象
		query.setString("name", name);					//设置用户名参数
		if(query.list()!=null&&query.list().size()>0)	//根据返回的list集合，判断是否存在该用户
			result = true;
	}catch(Exception ex){
		ex.printStackTrace();
//	}finally{
//		session.close();
	}
	return result;
}


@SuppressWarnings("unchecked")
public List<User> getUserByLocation(String location,String username){
	List<User> user = null;
	Session session = null;
	try{
		session = SessionFactoryProvider.getSession();	//创建Session实例
		String hql=" from User where userLocation=:location";//hql语句
		Query query=session.createQuery(hql);//创建query对象
		query.setString("location", location);
		if(query.list()!=null&&query.list().size()>0){//判断返回的list集合是否存在用户信息对象
			for(int i =0,len=query.list().size(); i<len;i++){
				user=(List<User>)query.list();
				if(user.get(i).getUserName().equals(username)){
					user.remove(i);
					--len;
					--i;
					
				}
			}
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		session.close();
	}
	return user;
}
}
