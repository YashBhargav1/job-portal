package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.jobs;

public class JobDao {
	private Connection conn;

	public JobDao(Connection conn) {
		super();
		this.conn = conn; 
	}
   public boolean addjobs(jobs j) {
	   boolean f =false;
	   try {
		   String sql = "insert into jobs(tittle , description ,category ,status , location) values(?,?,?,?,?)";
		   PreparedStatement ps = conn.prepareStatement(sql);
		   ps.setString(1, j.getTittle());
		   ps.setString(2, j.getDescription());
		   ps.setString(3, j.getCategory());
		   ps.setString(4, j.getStatus());
		   ps.setString(5, j.getLocation());
		   
		   int i = ps.executeUpdate();
		   
		   if (i==1) {
			   f = true;
		   }
	   }catch (Exception e) {
		   e.printStackTrace();
	   }return f;
   }public List<jobs> getAllJobs()
   {
	   List<jobs> list = new ArrayList<jobs>();
	   jobs j = null;
	   try {
	   	   String sql = "select * from jobs order by id desc";
	   	   PreparedStatement ps =conn.prepareStatement(sql);
	   	   ResultSet rs = ps.executeQuery();
	   	   while (rs.next()) {
	   		   j = new jobs();
	   		   j.setId(rs.getInt(1));
	   		   j.setTittle(rs.getString(2));
	   		   j.setDescription(rs.getString(3));
	   		   j.setCategory(rs.getString(4));
	   		   j.setStatus(rs.getString(5));
	   		   j.setLocation(rs.getString(6));
	   		   list.add(j);
	   	   }


	   }  catch(Exception e) {
	   	   e.getStackTrace();
	   }
	   return list;


	   }
   public List<jobs> getAllJobsForUser()
	   {
		   List<jobs> list = new ArrayList<jobs>();
		   jobs j = null;
		   try {
		   	   String sql = "select * from jobs where status=? order by id desc";
		   	   PreparedStatement ps =conn.prepareStatement(sql);
		   	   ps.setString(1, "Open");
		   	   ResultSet rs = ps.executeQuery();
		   	   while (rs.next()) {
		   		   j = new jobs();
		   		   j.setId(rs.getInt(1));
		   		   j.setTittle(rs.getString(2));
		   		   j.setDescription(rs.getString(3));
		   		   j.setCategory(rs.getString(4));
		   		   j.setStatus(rs.getString(5));
		   		   j.setLocation(rs.getString(6));
		   		   list.add(j);
		   	   }


		   }  catch(Exception e) {
		   	   e.getStackTrace();
		   }
		   return list;


		   }
   public jobs getJobById(int id)
   {
	   
	   jobs j = null;
	   try {
	   	   String sql = "select * from jobs where id=?";
	   	   PreparedStatement ps =conn.prepareStatement(sql);
	   	   ps.setInt(1, id);
	   	   ResultSet rs = ps.executeQuery();
	   	   while (rs.next()) {
	   		   j = new jobs();
	   		   j.setId(rs.getInt(1));
	   		   j.setTittle(rs.getString(2));
	   		   j.setDescription(rs.getString(3));
	   		   j.setCategory(rs.getString(4));
	   		   j.setStatus(rs.getString(5));
	   		   j.setLocation(rs.getString(6));
	   		  
	   	   }


	   }  catch(Exception e) {
	   	   e.getStackTrace();
	   }
	   return j;
}
   public boolean updateJob(jobs j) {
	   boolean f =false;
	   try {
		   String sql = "update jobs set tittle=? , description=? ,category=? ,status=? , location=? where id=?";
		   PreparedStatement ps = conn.prepareStatement(sql);
		   ps.setString(1, j.getTittle());
		   ps.setString(2, j.getDescription());
		   ps.setString(3, j.getCategory());
		   ps.setString(4, j.getStatus());
		   ps.setString(5, j.getLocation());
		   ps.setInt(6, j.getId());
		   
		   int i = ps.executeUpdate();
		   
		   if (i==1) {
			   f = true;
		   }
	   }catch (Exception e) {
		   e.printStackTrace();
	   }return f;}
   public List<jobs> searchJobs(String location, String category){

List<jobs> list = new ArrayList<>();

try{

String sql = "select * from jobs where location like ? and category like ? and status='Open'";

PreparedStatement ps = conn.prepareStatement(sql);

ps.setString(1, "%"+location+"%");
ps.setString(2, "%"+category+"%");

ResultSet rs = ps.executeQuery();

while(rs.next()){

jobs j = new jobs();

j.setId(rs.getInt(1));
j.setTittle(rs.getString(2));
j.setDescription(rs.getString(3));
j.setCategory(rs.getString(4));
j.setStatus(rs.getString(5));
j.setLocation(rs.getString(6));

list.add(j);

}

}catch(Exception e){
e.printStackTrace();
}

return list;
}
   
public boolean deleteJob(int id) {
	   boolean f =false;
	   try {
		   String sql = "delete from jobs where id=?";
		   PreparedStatement ps = conn.prepareStatement(sql);
		  ps.setInt(1, id);
		   
		   int i = ps.executeUpdate();
		   
		   if (i==1) {
			   f = true;
		   }
	   }catch (Exception e) {
		   e.printStackTrace();
	   }return f;}
}

