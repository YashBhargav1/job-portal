package com.servlet;

import java.io.IOException;

import com.DB.DBConnect;
import com.dao.JobDao;
import com.entity.jobs;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/updatejob")
public class UpdateJobServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String tittle = req.getParameter("tittle");
			String location = req.getParameter("location");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String description = req.getParameter("description");
			
			jobs j = new jobs();
			j.setId(id);
			j.setTittle(tittle);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			j.setDescription(description);
			
			JobDao dao= new JobDao(DBConnect.getConn()); 
			Boolean f= dao.updateJob(j);
			
			HttpSession session=  req.getSession();
			 if(f) {
				 session.setAttribute("succMsg", "Job Update Sucessfully");
				 resp.sendRedirect("viewjob.jsp");
				 
			 }else {
				 session.setAttribute("succMsg", "Something wrong on server");
				 resp.sendRedirect("viewjob.jsp");
			 }
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
