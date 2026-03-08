package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.JobDao;
import com.entity.jobs;

@WebServlet("/postjob")

public class AddPostServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String tittle = req.getParameter("tittle");
			String location = req.getParameter("location");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String description = req.getParameter("description");
			
			jobs j = new jobs();
			j.setTittle(tittle);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			j.setDescription(description);
			
			JobDao dao= new JobDao(DBConnect.getConn()); 
			Boolean f= dao.addjobs(j);
			HttpSession session=  req.getSession();
			 if(f) {
				 session.setAttribute("succMsg", "Job Post Sucessfully");
				 resp.sendRedirect("postjob.jsp");
				 
			 }else {
				 session.setAttribute("succMsg", "Something wrong on server");
				 resp.sendRedirect("postjob.jsp");
			 }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	

}
