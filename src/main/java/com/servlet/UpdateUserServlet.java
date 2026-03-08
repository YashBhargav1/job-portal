package com.servlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.dao.UserDao;
import com.entity.User;

@WebServlet("/update_profile")
public class UpdateUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {

        try {
        	int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String qualification = req.getParameter("qualification");

            User u = new User();
            u.setId(id);
            u.setName(name);
            u.setEmail(email);
            u.setPassword(password);
            u.setQualification(qualification);

            UserDao dao = new UserDao(DBConnect.getConn());
            boolean f = dao.updateUser(u);
            HttpSession session = req.getSession();

            if(f) {
            	session.setAttribute("succMsg","Profile Updated Sucessfully");
                resp.sendRedirect("editprofile.jsp");
            }else {
            	session.setAttribute("succMsg","Something Wrong On Server");
                resp.sendRedirect("editprofile.jsp");
            }
        }catch(Exception e) {
        	e.printStackTrace();
        }
    }
}