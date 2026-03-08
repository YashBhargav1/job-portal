package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

    private static Connection conn;

    public static Connection getConn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            conn = DriverManager.getConnection(
                "jdbc:mysql://gateway01.ap-southeast-1.prod.aws.tidbcloud.com:4000/job_portal?sslMode=VERIFY_IDENTITY",
                "3JqTXwyACDnwyxu.root",
                "tdguv89hObW8IAUF"
            );

            System.out.println("Database connected!");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return conn;
    }
}