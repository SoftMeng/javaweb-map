package com.zr.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zr.dao.FinDao;
import com.zr.dao.MesDao;
import com.zr.model.Fin;
import com.zr.model.Message;

public class MesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MesServlet() {
        super();
    }	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");//
		if(action!=null){
			if(action.equals("mesGet")){
				this.mesGet(request, response);
			}else if(action.equals("infor")){
				this.infor(request, response);
			}
		}
	}
			/**
			 * 处理用户修改
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			private void mesGet(HttpServletRequest request,HttpServletResponse response ) throws ServletException,IOException{
				PrintWriter out = response.getWriter();
				String mesSend = request.getParameter("messend"); //
				String mesGet = request.getParameter("mesget");	//
				Message mes = new Message();
				mes.setMesSend(mesSend.trim());
				mes.setMesGet(mesGet.trim());
				boolean res=MesDao.getInstance().saveMes(mes);	//保存注册信息
				if(res){
					out.println("<script>");
					out.println("window.location.href='jsp/passenger.jsp'");
					out.println("</script>");
				}
			}	
			
			private void infor(HttpServletRequest request,HttpServletResponse response ) throws ServletException,IOException{
				String mesGet = request.getParameter("mesget");//用户名
				java.util.List<Message> mes = MesDao.getInstance().getMesByget(mesGet);
				java.util.List<Fin> fin = FinDao.getInstance().getFinByget(mesGet);
				HttpSession session=request.getSession();
				if(fin!=null){
					for(int i =0; i<fin.size();i++){
						session.setAttribute("finname"+i, fin.get(i).getFinGet());
						}
				}
				if(mes!=null){
					for(int i =0; i<mes.size();i++){
					session.setAttribute("messend"+i, mes.get(i).getMesSend());
					}
					response.sendRedirect("jsp/passenger.jsp");
				}else{
					response.sendRedirect("jsp/passenger.jsp");
				}
				
			}

}
