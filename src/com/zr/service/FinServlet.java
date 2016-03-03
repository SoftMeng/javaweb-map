package com.zr.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.zr.dao.FinDao;
import com.zr.dao.MesDao;
import com.zr.model.Fin;

public class FinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public FinServlet() {
        super();
    }	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");//
		if(action!=null){
			if(action.equals("finGet")){
				this.finGet(request, response);
			}else if(action.equals("del")){
				this.delete(request, response);
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
			private void finGet(HttpServletRequest request,HttpServletResponse response ) throws ServletException,IOException{
				PrintWriter out = response.getWriter();
				String finSend = request.getParameter("messend"); //
				String finGet = request.getParameter("mesget");	//
				Fin fin = new Fin();
				fin.setFinSend(finSend.trim());
				fin.setFinGet(finGet.trim());
				boolean res=FinDao.getInstance().saveFin(fin);	//保存注册信息
				boolean res1=MesDao.getInstance().deleteacc(finSend,finGet);
				if(res&&res1){
					out.println("<script>");
					out.println("window.location.href='jsp/passenger.jsp'");
					out.println("</script>");
				}
			}	
			
			/**
			 * 删除信息
			 * @param request
			 * @param response
			 * @throws ServletException
			 * @throws IOException
			 */
			private void delete(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
				String finSend = request.getParameter("finsend"); //
				String finGet = request.getParameter("finget");	//
				boolean res=false;
				if(finSend!=""&&finGet!=""){
					res=FinDao.getInstance().deleteacc(finSend,finGet);
				}
				if(res){
					response.sendRedirect("jsp/passenger.jsp");
				}
				
			}
}
