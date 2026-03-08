package com.servlet;

import java.io.IOException;

import com.DB.DBConnect;
import com.dao.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/delete")

public class DeleteJobServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try{
			int id = Integer.parseInt(req.getParameter("id"));
			JobDao dao = new JobDao(DBConnect.getConn());
			boolean f = dao.deleteJob(id);
			
			HttpSession session=  req.getSession();
			 if(f) {
				 session.setAttribute("succMsg", "Job Delete Sucessfully");
				 resp.sendRedirect("postjob.jsp");
				 
			 }else {
				 session.setAttribute("succMsg", "Something wrong on server");
				 resp.sendRedirect("postjob.jsp");
			 }
		
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
