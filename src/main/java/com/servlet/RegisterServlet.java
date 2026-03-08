package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.UserDao;
import com.entity.User;
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullname =req.getParameter("fullname");
			String email =req.getParameter("email");
			String password =req.getParameter("password");
			String qualification =req.getParameter("qualification");
			UserDao dao = new UserDao(DBConnect.getConn());
			User u = new User(fullname ,email,password,qualification,"user");
			boolean f = dao.addUser(u);
			HttpSession session =req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Registration Sucessful");
				resp.sendRedirect("login.jsp");
				
			}else {
				session.setAttribute("succMsg", "Something wrong On Server");
				resp.sendRedirect("signup.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
